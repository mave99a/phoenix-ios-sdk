//
//  TSPhoenix
//	TSBroadcast.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSAccount;
@class TSProject;




@interface TSBroadcast: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *broadcastID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *phoenixIDentity_GroupId;
@property (nonatomic, copy) NSString *excludeRecipientAddress;
@property (nonatomic, strong) NSNumber *templateGroupID;
@property (nonatomic, strong) NSNumber *accountID;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *payload;
@property (nonatomic, copy) NSString *senderAddress;
@property (nonatomic, strong) NSDate *deliverAfterDate;
@property (nonatomic, strong) NSNumber *isProcessing;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSAccount *account;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
