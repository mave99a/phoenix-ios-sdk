//
//  TSPhoenix
//	TSActivityLog.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSActivity;
@class TSProject;



@interface TSActivityLog: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *activityLogID;
@property (nonatomic, strong) NSNumber *activityID;
@property (nonatomic, strong) NSNumber *phoenixIDentity_UserId;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *companyID;
@property (nonatomic, strong) NSNumber *providerID;
@property (nonatomic, copy) NSString *correlationID;
@property (nonatomic, strong) NSNumber *entityCount;
@property (nonatomic, copy) NSString *metaData;
@property (nonatomic, strong) NSNumber *responseStatus;
@property (nonatomic, strong) NSNumber *executionTime;
@property (nonatomic, copy) NSString *exception;
@property (nonatomic, strong) NSDate *activityDate;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, copy) NSString *ipAddress;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSActivity *activity;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
