//
//  TSPhoenixIdentity.h
//  fuse
//
//  Created by Steve on 19/4/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <AFOAuth2Client/AFOAuth2Client.h>
#import <YapDatabase/YapDatabase.h>
#import "TSPhoenixModuleAbastract.h"

/**
 Phoenix Identity module
 
 Provided authentication services:
 - Login
 - Logout
 - Storing OAuth token
 - Refresh OAuth token
 - Creating / deleting memberships
 
 */

@class TSPhoenixClient;
@class TSUser, TSProject, TSMembership;
@class TSPaginator;

@interface TSPhoenixIdentity : TSPhoenixModuleAbastract

@property (readonly) YapDatabaseConnection *readOnlyConnection;

/**
 A dedicated HTTP client for authentication purposes
 Oauth2 only takes form encoded requests, whereas the rest of the requests need to be JSON encoded
 */
@property (strong) AFOAuth2Client *oauth2Client;

// Fuse project Ids are hard coded
// Not using this method at the moment

/**
 Retrieves all projects for the current user
 Stores them in Core Data with entity named Project
 */

// Not in use: API not ready
//- (void)loadProjectsWithSuccess: (void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
//                        failure: (void (^)(RKObjectRequestOperation *operation, NSError *error))failure;


/**
 If the user is not logged in, API client still needs to be authenticated
 
 Use this method to authenticate and automatically put a client Bearer token in the header
    [client.identity authenticateClientWithSuccess:failure:]
 */

@property (readonly) BOOL isClientAuthenticated;
@property (strong) AFOAuthCredential *clientCredential;


/**
 OAuth2 client authentication
 
 @param success A block to be executed upon a successful authentication.
 @param failure A block to be exected upon a failed load.
 */
- (void)authenticateClientWithSuccess:(void (^)(AFOAuthCredential *))success
                              failure:(void (^)(NSError *))failure;





@property (assign) BOOL isUserAuthenticated;

@property (strong) AFOAuthCredential *userCredential;

/**
 Logs an user into Phoenix Identity
 Upon successful login, automatically does the following:
 Put a Bearer token in the header
 Token is saved across app sessions
 Set up Core Data sqlite for the user
 
 @param username Username.
 @param password Password.
 @param success A block to be executed upon a successful authentication.
 @param failure A block to be exected upon a failed load.
 */
- (void)authenticateWithUsername: (NSString *)username
                        password: (NSString *)password
                         success:(void (^)(AFOAuthCredential *credential))success
                         failure:(void (^)(NSError *error))failure;

/**
 OAuth2 refresh token
 
 SDK will refresh the token for you, there is no need to call this method as SDK consumer.
 
 @param success A block to be executed upon a successful authentication.
 @param failure A block to be exected upon a failed load.
 */
- (void)refreshTokenWithSuccess:(void (^)(AFOAuthCredential *credential))success
                        failure:(void (^)(NSError *error))failure;


/**
 Log out, clear local data
 
 Broadcasts kPhoenixIdentityDidLogoutNotification
 */
- (void)logout;

/**
 Get current user's info
 */

/*
@property (readonly) TSUser *myUser;

- (void)getMyUserWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

 */


/**
 * Password reset step 1
 * User inputs an email address. A reset token will be sent to that email.
 
 @param email The username which is an email.
 @param success A block to be executed upon a successful request.
 @param failure A block to be exected upon a failed load.
 **/
- (void)requestPasswordResetWithEmail: (NSString *)email
             forgotPasswordTemplateID: (NSInteger)forgotPasswordTemplateID
                              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 Password reset step 2
 User receives and uses the reset token. Let user set a new passowrd.
 
 @param token A password reset token which users obtain via email.
 @param password A new password
 @param success A block to be executed upon a successful authentication.
 @param failure A block to be exected upon a failed load.
 **/
- (void)resetPasswordWithToken: (NSString *)token
                      password: (NSString *)password
                       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)getMyUserWithCompletion: (void (^)(TSUser *user, NSError *error))completion;




#pragma mark -
#pragma mark -

// The hard coded project for Fuse
@property (readonly) TSProject *project;

- (void)setUpProject;




@end
