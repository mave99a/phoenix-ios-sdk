//
//  TSPhoenix
//	TSRecipient.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"



#ifndef StatusTypeIdEnum
#define StatusTypeIdEnum
typedef NS_ENUM(NSUInteger, StatusTypeId) {
	kStatusTypeIdSuccess = 1,
	kStatusTypeIdFailure,
	kStatusTypeIdPartialSuccess,
};

#endif



@interface TSRecipient: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *recipientID;
@property (nonatomic, strong) NSNumber *messageID;
@property (nonatomic, copy) NSString *recipientAddress;
@property (nonatomic, strong) NSDate *sendDate;
@property (nonatomic, strong) NSDate *receiveDate;
@property (nonatomic, strong) NSNumber *statusTypeID;
@property (nonatomic, copy) NSString *statusDesc;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *phoenixIDentity_UserId;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties




// TODO
+ (NSArray *)expandableProperties;

@end
