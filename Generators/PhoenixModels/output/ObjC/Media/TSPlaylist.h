//
//  TSPhoenix
//	TSPlaylist.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProfile;
@class TSProject;

#ifndef PrivacyTypeIdEnum
#define PrivacyTypeIdEnum
typedef NS_ENUM(NSUInteger, PrivacyTypeId) {
	kPrivacyTypeIdPrivate = 1,
	kPrivacyTypeIdPublic,
};

#endif



@interface TSPlaylist: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *playlistID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *ownerProfileID;
@property (nonatomic, strong) NSNumber *privacyTypeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProfile *profile;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
