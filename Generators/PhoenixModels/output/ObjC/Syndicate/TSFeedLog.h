//
//  TSPhoenix
//	TSFeedLog.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSFeed;

#ifndef StatusTypeIdEnum
#define StatusTypeIdEnum
typedef NS_ENUM(NSUInteger, StatusTypeId) {
	kStatusTypeIdPending = 1,
	kStatusTypeIdProcessing,
	kStatusTypeIdSuccess,
	kStatusTypeIdFailure,
};

#endif



@interface TSFeedLog: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *feedLogID;
@property (nonatomic, strong) NSNumber *feedID;
@property (nonatomic, strong) NSNumber *statusTypeID;
@property (nonatomic, copy) NSString *feedLogDescription;
@property (nonatomic, copy) NSString *stackTrace;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSFeed *feed;



// TODO
+ (NSArray *)expandableProperties;

@end
