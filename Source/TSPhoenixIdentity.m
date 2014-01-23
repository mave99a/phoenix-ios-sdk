//
//  TSPhoenixIdentity.m
//  fuse
//
//  Created by Steve on 19/4/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSPhoenixIdentity.h"
#import "TSPaginator.h"
#import <AFOAuth2Client@phoenixplatform/AFOAuth2Client.h>
#import "TSPhoenix.h"

@interface TSPhoenixIdentity() {
    TSProject *_companyProject;
}
@end

@implementation TSPhoenixIdentity

- (id)initWithPhoenixClient: (TSPhoenixClient *)client {

    self = [super initWithPhoenixClient:client];

    _readOnlyConnection = [client.database newConnection];
    
    self.clientCredential = [AFOAuthCredential retrieveCredentialWithIdentifier:kPhoenixClientAuthenticationCredentialKey];

    self.userCredential = [AFOAuthCredential retrieveCredentialWithIdentifier:kPhoenixUserAuthenticationCredentialKey];
    
    if (self.userCredential) {
//        [self.client setAuthorizationHeaderWithCredential:self.userCredential];
        [self.client setAuthorizationHeaderWithToken:self.userCredential.accessToken];
        self.isUserAuthenticated = YES;
    }
    else if (self.clientCredential) {
//        [self.client setAuthorizationHeaderWithCredential:self.clientCredential];
        [self.client setAuthorizationHeaderWithToken:self.clientCredential.accessToken];
    }
    
    NSAssert(self.client.clientID, @"Missing Client ID");
    NSAssert(self.client.clientSecret, @"Missing Client Secret");
    
    AFOAuth2Client *oauth2Client = [AFOAuth2Client clientWithBaseURL:client.baseURL
                                                            clientID:self.client.clientID
                                                              secret:self.client.clientSecret];
    
    self.oauth2Client = oauth2Client;
    
    return self;
}


- (void)authenticateClientWithSuccess:(void (^)(AFOAuthCredential *))success
                              failure:(void (^)(NSError *))failure {
    [self.oauth2Client authenticateUsingOAuthWithURLString:[[NSURL URLWithString:kIdentityTokenPath
                                                                   relativeToURL:self.client.baseURL] absoluteString]
                                                scope:nil
                                              success:^(AFOAuthCredential *credential) {
                                                  NSLog(@"Client authenticated!");
                                                  
                                                  self.clientCredential = credential;
                                                  
//                                                  [self.oauth2Client setAuthorizationHeaderWithCredential:credential];
//                                                  [self.client setAuthorizationHeaderWithCredential:credential];
                                                  [self.oauth2Client setAuthorizationHeaderWithToken:credential.accessToken];
                                                  [self.client setAuthorizationHeaderWithToken:credential.accessToken];
                                                  
                                                  [AFOAuthCredential storeCredential:credential
                                                                      withIdentifier:kPhoenixClientAuthenticationCredentialKey];
                         
                                                  TS_BLOCK_SAFE_RUN(success, credential);
                                                  
                                              } failure:^(NSError *error) {
                                                  self.clientCredential = nil;
                                                  
                                                  NSLog(@"Client authentication failed: %@" ,[error description]);
                                                  
                                                  TS_BLOCK_SAFE_RUN(failure, error);
                                                  
                                              }];
    
    
}



- (void)authenticateWithUsername: (NSString *)username
                        password: (NSString *)password
                         success:(void (^)(AFOAuthCredential *credential))success
                         failure:(void (^)(NSError *error))failure {
    NSString *path = kIdentityTokenPath;
    
    [self.oauth2Client authenticateUsingOAuthWithURLString:[[NSURL URLWithString:path relativeToURL:self.client.baseURL] absoluteString]
                                username:username
                                password:password
                                   scope:nil
                                 success:^(AFOAuthCredential *credential) {
#ifdef DEBUG
                                     NSLog(@"User authenticated!");
#endif
                                     self.userCredential = credential;
                                     
//                                     [self.oauth2Client setAuthorizationHeaderWithCredential:credential];
//                                     [self.client setAuthorizationHeaderWithCredential:credential];
                                     [self.oauth2Client setAuthorizationHeaderWithToken:credential.accessToken];
                                     [self.client setAuthorizationHeaderWithToken:credential.accessToken];

                                     
                                     self.isUserAuthenticated = YES;
                                     
                                     
                                     [AFOAuthCredential storeCredential:credential withIdentifier:kPhoenixUserAuthenticationCredentialKey];
                                     
                                     [self setUpProject];
                                     
                                     [[NSNotificationCenter defaultCenter] postNotificationName:kPhoenixIdentityDidLoginNotification
                                                                                         object:self];
                                     
                                     TS_BLOCK_SAFE_RUN(success, credential);

                                     
                                 } failure:^(NSError *error) {
                                     NSLog(@"user authentication failed: %@" ,[error description]);
                                     
                                     TS_BLOCK_SAFE_RUN(failure, error);
                                 }];
    
}


- (void)refreshTokenWithSuccess:(void (^)(AFOAuthCredential *credential))success
                        failure:(void (^)(NSError *error))failure {
    NSString *path = kIdentityTokenPath;
    
    [self.oauth2Client authenticateUsingOAuthWithURLString:[[NSURL URLWithString:path relativeToURL:self.client.baseURL] absoluteString]
                                         refreshToken:self.userCredential.refreshToken
                                              success:^(AFOAuthCredential *credential) {
#ifdef DEBUG
                                                  NSLog(@"Auth token refreshed!");
#endif
                                                  self.userCredential = credential;
                                                  
//                                                  [self.oauth2Client setAuthorizationHeaderWithCredential:credential];
//                                                  [self.client setAuthorizationHeaderWithCredential:credential];
                                                  [self.oauth2Client setAuthorizationHeaderWithToken:credential.accessToken];
                                                  [self.client setAuthorizationHeaderWithToken:credential.accessToken];
                                                  
                                                  self.isUserAuthenticated = YES;
                                                  
                                                  [AFOAuthCredential storeCredential:credential
                                                                      withIdentifier:kPhoenixUserAuthenticationCredentialKey];
                                                  
                                                  [[NSNotificationCenter defaultCenter] postNotificationName:kPhoenixIdentityDidRefreshTokenNotification
                                                                                                      object:self];

                                                  TS_BLOCK_SAFE_RUN(success, credential);
                                                  
                                              } failure:^(NSError *error) {
                                                  NSLog(@"refresh token failed: %@" ,[error description]);
                                                  
                                                  TS_BLOCK_SAFE_RUN(failure, error);
                                              }];
    
}


- (BOOL)isClientAuthenticated {
    return (self.clientCredential != nil);
}


- (void)requestPasswordResetWithEmail: (NSString *)email
             forgotPasswordTemplateID: (NSInteger)forgotPasswordTemplateID
                              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    // Reset only allowed when the user is logged out
    NSParameterAssert(!self.isUserAuthenticated);
    
    NSParameterAssert(email.length);
    
    if (!self.isClientAuthenticated) {
        [self authenticateClientWithSuccess:^(AFOAuthCredential *credential) {
            [self requestPasswordResetWithEmail:email
                       forgotPasswordTemplateID:forgotPasswordTemplateID
                                        success:success
                                        failure:failure];
        } failure:^(NSError *error) {
            failure(nil, error);
        }];
        
        return;
    }
    
    NSAssert(self.client.projectID > 0, @"Missing project id");
    NSAssert(forgotPasswordTemplateID > 0, @"Missing forgot password template id");
    
    
    NSString *path = [NSString stringWithFormat:kPhoenixIdentityRetrievePasswordResetTokenPath, self.client.projectID, email, forgotPasswordTemplateID];
    
    [self.client GET:path
              parameters:nil
                 success:success
                 failure:failure];
}


- (void)resetPasswordWithToken: (NSString *)token
                      password: (NSString *)password
                       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    // Reset only allowed when the user is logged out
    NSParameterAssert(!self.isUserAuthenticated);
    
    NSParameterAssert(token.length);
    NSParameterAssert(password.length);
    
    
    if (!self.isClientAuthenticated) {
        [self authenticateClientWithSuccess:^(AFOAuthCredential *credential) {
            [self resetPasswordWithToken:token
                                password:password
                                 success:success
                                 failure:failure];
        } failure:^(NSError *error) {
            failure(nil, error);
        }];
        
        return;
    }
    
    NSAssert(self.client.projectID > 0, @"Missing project id");

    NSString *path = [NSString stringWithFormat:kPhoenixIdentityResetPasswordPath, self.client.projectID];
    
    NSDictionary *parameters = @{@"token":token,
                                 @"newPassword":password};
    
    [self.client PUT:path
              parameters:parameters
                 success:success
                 failure:failure];
}

- (void)getMyUserWithCompletion: (void (^)(TSUser *user, NSError *error))completion {
    // Reset only allowed when the user is logged out

    NSString *path = @"identity/v1/users/me";
    
    [self.client GET:path
              parameters:nil
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     NSDictionary *dict = responseObject;
                     dict = dict[@"Data"][0];
                     
                     TSUser *user = [[TSUser alloc] initWithDictionary:dict];
                     
                     TS_BLOCK_SAFE_RUN(completion, user, nil);
                     
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     TS_BLOCK_SAFE_RUN(completion, nil, error);
                 }];

}


- (void)invalidateCredential {
    self.clientCredential = nil;
    [AFOAuthCredential deleteCredentialWithIdentifier:kPhoenixClientAuthenticationCredentialKey];
    
    self.userCredential = nil;
    [AFOAuthCredential deleteCredentialWithIdentifier:kPhoenixUserAuthenticationCredentialKey];
    
    [self.client.requestSerializer clearAuthorizationHeader];
    
    self.isUserAuthenticated = NO;
}

- (void)logout {
    if (!self.isUserAuthenticated) return; // Already logged out
    
    [self invalidateCredential];
    
    _companyProject = nil;
    
    NSError *error;
    [self.client.operationQueue cancelAllOperations];
    
    
    [self.client.writeDatabaseConnection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [transaction removeAllObjectsInAllCollections];
    }];
    
    if (error)
        NSLog(@"Logout clear Core Data error: %@", error);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kPhoenixIdentityDidLogoutNotification
                                                        object:self];
    
}

#pragma mark - 

- (void)setUpProject {
    TSProject *companyProject = [TSProject new];
    NSAssert(self.client.projectID > 0, @"Missing project id. Is TSPhoenixClient configured with a project ID?");
    
    companyProject.projectID = @(self.client.projectID);
    
    _companyProject = companyProject;
    
    [self.client.writeDatabaseConnection  asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [transaction setObject:companyProject
                        forKey:[companyProject dbKey]
                  inCollection:[TSProject dbCollection]];
    }];
}

- (TSProject *)project {
    if (_companyProject) return _companyProject;
    
    NSAssert(self.client.projectID > 0, @"Missing project id");

    __block TSProject *aProject;
    [self.readOnlyConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        NSString *key = [[transaction allKeysInCollection:[TSProject dbCollection]] lastObject];
        aProject = [transaction objectForKey:key inCollection:[TSProject dbCollection]];
     }];

    if (!aProject) {
        aProject = [[TSProject alloc] init];
        aProject.projectID = @(self.client.projectID);
    }
    _companyProject = aProject;

    
    return _companyProject;
}


@end



@implementation AFOAuth2Client

- (void)setAuthorizationHeaderWithToken:(NSString *)token {
    // Use the "Bearer" type as an arbitrary default
    [self setAuthorizationHeaderWithToken:token ofType:@"Bearer"];
}

@end