//
//  TSPhoenix
//	TSMessage.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSAccount;
@class TSProject;
@class TSRecipients;

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

#ifndef DirectionTypeIdEnum
#define DirectionTypeIdEnum
typedef NS_ENUM(NSUInteger, DirectionTypeId) {
	kDirectionTypeIdInbound = 1,
	kDirectionTypeIdOutbound,
};

#endif

#ifndef StatusTypeIdEnum
#define StatusTypeIdEnum
typedef NS_ENUM(NSUInteger, StatusTypeId) {
	kStatusTypeIdSuccess = 1,
	kStatusTypeIdFailure,
	kStatusTypeIdPartialSuccess,
};

#endif



@interface TSMessage: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *messageID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *accountID;
@property (nonatomic, strong) NSNumber *messageTypeID;
@property (nonatomic, strong) NSNumber *directionTypeID;
@property (nonatomic, copy) NSString *senderAddress;
@property (nonatomic, strong) NSNumber *statusTypeID;
@property (nonatomic, copy) NSString *statusDesc;
@property (nonatomic, strong) NSDate *processDate;
@property (nonatomic, copy) NSString *payload;
@property (nonatomic, strong) NSNumber *recipientCount;
@property (nonatomic, strong) NSNumber *expectedRecipientCount;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSAccount *account;
@property (nonatomic, strong) TSProject *project;
@property (nonatomic, strong) TSRecipients *recipients;



// TODO
+ (NSArray *)expandableProperties;

@end
