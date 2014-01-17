//
//  TSPhoenix
//	TSAccount.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSAggregator;

#ifndef MessageTypeIdEnum
#define MessageTypeIdEnum
typedef NS_ENUM(NSUInteger, MessageTypeId) {
	kMessageTypeIdEmail = 1,
	kMessageTypeIdSMS,
	kMessageTypeIdiOSPushNotification,
	kMessageTypeIdAndroidPushNotification,
	kMessageTypeIdWindowsPushNotification,
};

#endif



@interface TSAccount: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *accountID;
@property (nonatomic, strong) NSNumber *phoenixIDentity_CompanyId;
@property (nonatomic, strong) NSNumber *aggregatorID;
@property (nonatomic, strong) NSNumber *messageTypeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *systemName;
@property (nonatomic, copy) NSString *originator;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *providerUrl;
@property (nonatomic, strong) NSNumber *supportsInbound;
@property (nonatomic, strong) NSNumber *supportsOutbound;
@property (nonatomic, strong) NSNumber *isProductionGateway;
@property (nonatomic, strong) NSNumber *certificate;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSAggregator *aggregator;



// TODO
+ (NSArray *)expandableProperties;

@end
