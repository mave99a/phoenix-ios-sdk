//
//  TSPhoenix
//	TSAggregator.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"



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



@interface TSAggregator: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *aggregatorID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *messageTypeID;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties




// TODO
+ (NSArray *)expandableProperties;

@end
