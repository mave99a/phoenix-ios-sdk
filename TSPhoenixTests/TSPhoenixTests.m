//
//  TSPhoenixTests.m
//  TSPhoenixTests
//
//  Created by Steve on 16/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSPhoenix.h"
//#import <SHTestCaseAdditions/SHTestCaseAdditions.h>

@interface TSPhoenixTests : XCTestCase

@property (strong) TSPhoenixClient *client;

@end

@implementation TSPhoenixTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    [MagicalRecord setDefaultModelFromClass:[self class]];
	[MagicalRecord setupCoreDataStackWithInMemoryStore];
    
    self.client = [TSPhoenixClient sharedInstance];
    
//    self.client.operationQueue = [NSOperationQueue new];
//    [self.client setUp];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
    
    self.client = nil;
}

- (void)testLogin {
    
    __block BOOL hasCalledBack = NO;

    [self.client.identity authenticateWithUsername:TEST_USER
                                          password:TEST_PWD
                                           success:^(AFOAuthCredential *credential) {
                                               hasCalledBack = YES;
                                           } failure:^(NSError *error) {

                                               XCTFail(@"User authentication failed");

                                               hasCalledBack = YES;
                                           }];
    
    
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:10];
    while (hasCalledBack == NO && [loopUntil timeIntervalSinceNow] > 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:loopUntil];
    }
    
    if (!hasCalledBack)
    {
        XCTFail(@"Test failed: timeout");
    }
    
}




@end
