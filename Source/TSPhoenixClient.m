//
//  TSPhoenixClient.m
//  fuse
//
//  Created by Steve on 4/4/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSPhoenixClient.h"

#import "TSPhoenix.h"
#import "AFOAuth2Client.h"
#import "RKDotNetDateFormatter.h"

#import "TSPhoenixIdentity.h"
#import "TSPhoenixSyndicate.h"
#import <AFNetworking/AFNetworking.h>
#import "TSModelAbstract.h"

NSString * const TSPhoenixKeyValueDatabaseSQLiteName = @"TSPhoenixStore.sqlite";

@interface TSPhoenixClient() {
    YapDatabase *_database;
}

@end

@implementation TSPhoenixClient

static NSURL *phoenix_baseURL;
static NSString *phoenix_clientID;
static NSString *phoenix_clientSecret;
static NSInteger phoenix_projectID;

- (id)init {

    NSAssert(phoenix_baseURL != nil, @"BaseURL missing. did you call [TSPhoenixClient setUp...]?");
    NSAssert(phoenix_clientID != nil, @"BaseURL missing. did you call [TSPhoenixClient setUp...]?");
    NSAssert(phoenix_clientSecret != nil, @"BaseURL missing. did you call [TSPhoenixClient setUp...]?");
    NSAssert(phoenix_projectID > 0, @"projectID missing. did you call [TSPhoenixClient setUp...]?");
    
    
    self = [super initWithBaseURL:phoenix_baseURL];
    
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Accept-Encoding" value:@"gzip, deflate"];
    self.parameterEncoding = AFJSONParameterEncoding;
    self.defaultDateFormatter = [RKDotNetDateFormatter dotNetDateFormatterWithTimeZone:nil];
    
    self.identity = [[TSPhoenixIdentity alloc] initWithPhoenixClient:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(HTTPOperationDidFinish:)
                                                 name:AFNetworkingOperationDidFinishNotification
                                               object:nil];

    
    
    
    NSFileManager *fm = [NSFileManager defaultManager];

    NSArray *array = [fm URLsForDirectory:NSLibraryDirectory
                                inDomains:NSUserDomainMask];
    
    // KeyValueDB
    NSString* path = [(NSURL *)array[0] path];
    
    path = [path stringByAppendingPathComponent:@"TSPhoenix"];
    if (![fm fileExistsAtPath:path])
        [fm createDirectoryAtPath:path
      withIntermediateDirectories:YES
                       attributes:nil
                            error:nil];
    path = [path stringByAppendingPathComponent:TSPhoenixKeyValueDatabaseSQLiteName];
    
    _database = [[YapDatabase alloc] initWithPath:path];
    
    _readOnlyDatabaseConnection = [_database newConnection];
    
    _writeDatabaseConnection = [_database newConnection];
    _writeDatabaseConnection.objectCacheEnabled = NO;
    _writeDatabaseConnection.metadataCacheEnabled = NO;
    
    // Identity setup deffered till we get the clientID / secret

    NSParameterAssert(_database);
    
    self.syndicate = [[TSPhoenixSyndicate alloc] initWithPhoenixClient:self];

    self.messaging = [[TSPhoenixMessaging alloc] initWithPhoenixClient:self];
    self.media = [[TSPhoenixMedia alloc] initWithPhoenixClient:self];
    self.analytics = [[TSPhoenixAnalytics alloc] initWithPhoenixClient:self];
    
    self.paginators = [NSMutableSet new];
    
    
    return self;
}

+ (id)sharedInstance {
    
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^ {
        sharedManager = [[self alloc] init];
    
    });
    return sharedManager;
}

// Convenience
+ (TSPhoenixIdentity *)identity {
    return [[TSPhoenixClient sharedInstance] identity];
}

+ (TSPhoenixSyndicate *)syndicate {
    return [[TSPhoenixClient sharedInstance] syndicate];
}


+ (TSPhoenixMedia *)media {
    return [[TSPhoenixClient sharedInstance] media];
}

+ (TSPhoenixMessaging *)messaging {
    return [[TSPhoenixClient sharedInstance] messaging];
}

+ (TSPhoenixAnalytics *)analytics {
    return [[TSPhoenixClient sharedInstance] analytics];
}


+ (void)setUpWithBaseURL: (NSURL *)baseURL
                clientID: (NSString *)clientID
            clientSecret: (NSString *)clientSecret
               projectID: (NSInteger)projectID {
    phoenix_baseURL = baseURL;
    phoenix_clientID = clientID;
    phoenix_clientSecret = clientSecret;
    phoenix_projectID = projectID;
    
    // Initialize the singleton
    [TSPhoenixClient sharedInstance];
}

#pragma mark - Networking

- (void)setUpNetworking {
    // Enable Activity Indicator Spinner
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
}

- (void)setAuthorizationHeaderWithToken:(NSString *)token {
    [self setDefaultHeader:@"Authorization" value:[NSString stringWithFormat:@"Bearer %@", token]];
}

#pragma mark - Error handling


/*
 Capture all http errors here
 */
- (void)HTTPOperationDidFinish:(NSNotification *)notification {
    AFHTTPRequestOperation *operation = (AFHTTPRequestOperation *)[notification object];
    
    if (![operation isKindOfClass:[AFHTTPRequestOperation class]])
        return;
   
    if (operation.isCancelled) return;

    if ([operation isKindOfClass:[AFImageRequestOperation class]]) return; // ignore image download errors
    
    if (operation.error) {
        NSLog(@"Network error: %@", operation.error);
    }
    
    if (operation.error.code == NSURLErrorNotConnectedToInternet) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:operation.error.localizedDescription
                              delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        [self.operationQueue cancelAllOperations];
        
        
    }
    
    
    NSInteger statusCode = operation.response.statusCode;
    if (statusCode == 401 || statusCode == 403) {
        
        // Attempt to refresh token
        // Success: re-queue all HTTP requests with new token
        // Failure: log out
        
        static dispatch_once_t refreshOnceToken;
        dispatch_once(&refreshOnceToken, ^{
            // 1. Store and stop all URL requests
            NSArray *httpOperations = self.operationQueue.operations;
            
            [self.operationQueue cancelAllOperations];
            
            [self.operationQueue cancelAllOperations];
            
            // 2. Refresh token
            [self.identity refreshTokenWithSuccess:^(AFOAuthCredential *credential) {
                
                // Re-queue all request operations
                [httpOperations enumerateObjectsUsingBlock:^(AFHTTPRequestOperation *op, NSUInteger idx, BOOL *stop) {
                    // Re-construct the requests, swap in new Authorization header field, enqueue the reqeust operation
                    NSMutableURLRequest *request = [op.request mutableCopy];
                    
                    NSMutableDictionary *headers = [[request allHTTPHeaderFields] mutableCopy];
                    NSString *token = credential.accessToken;
                    headers[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@", token];
                    
                    [request setAllHTTPHeaderFields:headers];
                    
                    AFHTTPRequestOperation *newOp = [self HTTPRequestOperationWithRequest:request
                                                                                             success:nil failure:nil];
                    newOp.completionBlock = op.completionBlock;
                    
                    [self enqueueHTTPRequestOperation:newOp];
                    
                    
                }];
            }
            failure:^(NSError *error) {
                [self.identity logout];
            }];
        });

    }
    
}


#pragma mark - Database 

- (void)saveObjectsToDatabase: (NSArray *)objects {
    [self.writeDatabaseConnection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [objects enumerateObjectsUsingBlock:^(TSModelAbstract *obj, NSUInteger idx, BOOL *stop) {
            [transaction setObject:obj
                            forKey:obj.dbKey
                      inCollection:obj.dbCollection];
            
        }];
    }];
}

- (void)deleteObjectsInDatabase: (NSArray *)objects {
    [self.writeDatabaseConnection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [objects enumerateObjectsUsingBlock:^(TSModelAbstract *obj, NSUInteger idx, BOOL *stop) {
            [transaction removeObjectForKey:obj.dbKey
                               inCollection:obj.dbCollection];
        }];
    }];
}



- (void)saveObjectsToDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock {
    [self.writeDatabaseConnection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [objects enumerateObjectsUsingBlock:^(TSModelAbstract *obj, NSUInteger idx, BOOL *stop) {
            [transaction setObject:obj
                            forKey:obj.dbKey
                      inCollection:obj.dbCollection];
        }];
    } completionBlock:completionBlock];

}

- (void)deleteObjectsInDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock {
    [self.writeDatabaseConnection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [objects enumerateObjectsUsingBlock:^(TSModelAbstract *obj, NSUInteger idx, BOOL *stop) {
            [transaction removeObjectForKey:obj.dbKey
                               inCollection:obj.dbCollection];
        }];
    } completionBlock:completionBlock];
}


+ (YapDatabase *)database {
    return [[self sharedInstance] database];
}
+ (YapDatabaseConnection *)readOnlyDatabaseConnection {
    return [[self sharedInstance] readOnlyDatabaseConnection];
}

+ (YapDatabaseConnection *)writeDatabaseConnection {
    return [[self sharedInstance] writeDatabaseConnection];
}

// Synchronous
+ (void)saveObjectsToDatabase: (NSArray *)objects {
    [[self sharedInstance] saveObjectsToDatabase:objects];
}

+ (void)deleteObjectsInDatabase: (NSArray *)objects {
    [[self sharedInstance] deleteObjectsInDatabase:objects];
}

// Async
+ (void)saveObjectsToDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock {
    [[self sharedInstance] saveObjectsToDatabase:objects completion:completionBlock];
}

+ (void)deleteObjectsInDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock {
    [[self sharedInstance] deleteObjectsInDatabase:objects completion:completionBlock];
}

#pragma mark - 

- (NSString *)clientID {
    return phoenix_clientID;
}

- (NSString *)clientSecret{
    return phoenix_clientSecret;
}

- (NSInteger)projectID {
    return phoenix_projectID;
}



@end
