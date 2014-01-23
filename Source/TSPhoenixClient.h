//
//  TSPhoenixClient.h
//  fuse
//
//  Created by Steve on 4/4/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AFNetworking/AFNetworking.h>

#import "TSPhoenixConstants.h"
#import <YapDatabase/YapDatabase.h>

/** Tigerspike Phoenix Client.
 
 This is the singleton entry point to Phoenix SDK.
 
 It is a standard AFHTTPClient which you already use and love.
 
 Access the shared instance:
 
    [TSPhoenixClient sharedInstance]
 
 Initial setup:
 
        [[TSPhoenixClient sharedInstance] setUpWithBaseURL: [NSURL urlWithString: @"https://api.phoenixplatform.com.sg"]
                                                    ClientID:@"CLIENT_ID"
                                               clientSecret:@"SECRET"
                                                  projectID:PROJECT_ID];

 */

extern NSString * const TSPhoenixKeyValueDatabaseSQLiteName;

@class Project;
@class AFOAuthCredential;

@class TSPhoenixSyndicate, TSPhoenixIdentity, TSPhoenixMedia, TSPhoenixAnalytics, TSPhoenixMessaging;


@interface TSPhoenixClient : AFHTTPRequestOperationManager

/**
 * Singleton design
 * Access Phoenix modules with [TSPhoenixClient sharedInstance].syndicate
 */
+ (instancetype)sharedInstance;

+ (TSPhoenixIdentity *)identity;

+ (TSPhoenixSyndicate *)syndicate;

+ (TSPhoenixMedia *)media;

+ (TSPhoenixMessaging *)messaging;

+ (TSPhoenixAnalytics *)analytics;

/**
 Make this a property so that setting up baseURL can be deferred till runtime
 */
//@property (nonatomic, strong) AFHTTPClient *httpClient;


/**
 *  1-time setup of Phoenix SDK upon appDidFinishLaunch
 *
 *  @param baseURL      An NSURL pointing to the Phoenix API baseURL
 *  @param clientID     Phoenix OAuth2 clientID
 *  @param clientSecret Phoenix OAuth2 clientSecret
 *  @param projectID    Phoenix base project id. All Phoenix projects have a project id
 */
+ (void)setUpWithBaseURL: (NSURL *)baseURL
                clientID: (NSString *)clientID
            clientSecret: (NSString *)clientSecret
               projectID: (NSInteger)projectID;

//@property (assign) NSInteger projectID;
@property (assign) NSInteger companyID;
//@property (assign) NSInteger forgotPasswordTemplateID;
//@property (copy) NSString * clientSecret;
//@property (copy) NSString * clientID;


- (void)setAuthorizationHeaderWithCredential:(AFOAuthCredential *)credential;


@property (readonly) YapDatabase *database;

// -save methods does NOT save expanded properties
// you need to save them explicitly

// Synchronous
- (void)saveObjectsToDatabase: (NSArray *)objects;
- (void)deleteObjectsInDatabase: (NSArray *)objects;

// Async
- (void)saveObjectsToDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock;
- (void)deleteObjectsInDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock;



// YapDB supports multiple concurrent reads, only a single write at a time
// This is because of how SQLite-WAL works
// This connection is dedicated for one obj to load another from the DB
@property (readonly) YapDatabaseConnection *readOnlyDatabaseConnection;
@property (readonly) YapDatabaseConnection *writeDatabaseConnection;

/**
 All paginators work on main thread
 To avoid race conditions with multiple concurrent paginators
 Put them all on this thread, make it serial (maxConcurrentOperation = 1)
 */
// Deprecated thanks to TSPaginator
//@property (strong) NSOperationQueue *paginatorOperationQueue;

@property (strong) NSMutableSet *paginators;


/**
 Phoenix modules
 */
@property (strong) TSPhoenixIdentity *identity;
@property (strong) TSPhoenixSyndicate *syndicate;
@property (strong) TSPhoenixMedia *media;
@property (strong) TSPhoenixMessaging *messaging;
@property (strong) TSPhoenixAnalytics *analytics;

/**
 *  Default .Net date formatter, parses /Date(xxxxxxxxxx)/
 */
@property (strong) NSDateFormatter *defaultDateFormatter;

#pragma mark - Convenience

/**
 *  Convenience methods to access the database
 *
 */
+ (YapDatabase *)database;
+ (YapDatabaseConnection *)readOnlyDatabaseConnection;
+ (YapDatabaseConnection *)writeDatabaseConnection;

// Synchronous
+ (void)saveObjectsToDatabase: (NSArray *)objects;
+ (void)deleteObjectsInDatabase: (NSArray *)objects;

// Async
+ (void)saveObjectsToDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock;
+ (void)deleteObjectsInDatabase: (NSArray *)objects completion:(dispatch_block_t)completionBlock;

/**
 *  Phoenix parameters
 *
 */
- (NSString *)clientID;
- (NSString *)clientSecret;
- (NSInteger)projectID;

@end

