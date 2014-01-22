//
//  TSPhoenix
//	TSProfile.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProject;

#ifndef StatusTypeIdEnum
#define StatusTypeIdEnum
typedef NS_ENUM(NSUInteger, StatusTypeId) {
	kStatusTypeIdPending = 1,
	kStatusTypeIdApproved,
	kStatusTypeIdDeclined,
};

#endif



@interface TSProfile: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *profileID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *statusTypeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *profileDescription;
@property (nonatomic, copy) NSString *profileImageUrl;
@property (nonatomic, strong) NSNumber *voteCount_Overall;
@property (nonatomic, strong) NSNumber *viewCount_Overall;
@property (nonatomic, strong) NSNumber *mediaCount_Overall;
@property (nonatomic, strong) NSDate *lastMediaCreatedDate;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *phoenixIDentity_UserId;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
