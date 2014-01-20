//
//  TSPhoenix
//	TSEventLog.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSEventType;
@class TSProject;



@interface TSEventLog: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *eventLogID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *phoenixIDentity_UserId;
@property (nonatomic, copy) NSString *correlationID;
@property (nonatomic, strong) NSNumber *eventParentID;
@property (nonatomic, strong) NSNumber *targetID;
@property (nonatomic, copy) NSString *metaData;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, copy) NSString *ipAddress;
@property (nonatomic, strong) NSNumber *progress;
@property (nonatomic, copy) NSString *statusDescription;
@property (nonatomic, strong) NSNumber *success;
@property (nonatomic, strong) NSNumber *providerID;
@property (nonatomic, strong) NSNumber *companyID;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSEventType *eventType;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
