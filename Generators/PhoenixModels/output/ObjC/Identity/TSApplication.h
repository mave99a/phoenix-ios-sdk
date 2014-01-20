//
//  TSPhoenix
//	TSApplication.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProject;
@class TSUser;

#ifndef ApplicationTypeIdEnum
#define ApplicationTypeIdEnum
typedef NS_ENUM(NSUInteger, ApplicationTypeId) {
	kApplicationTypeIdApple_iOS = 1,
	kApplicationTypeIdGoogle_Android,
	kApplicationTypeIdHTML5,
	kApplicationTypeIddotNet,
};

#endif



@interface TSApplication: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *applicationID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *applicationTypeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *applicationDescription;
@property (nonatomic, copy) NSString *metaData;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, copy) NSString *latestVersion;
@property (nonatomic, strong) NSNumber *forceUpgrade;
@property (nonatomic, copy) NSString *installationUrl;
@property (nonatomic, strong) NSNumber *installationCount;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProject *project;
@property (nonatomic, strong) TSUser *user;



// TODO
+ (NSArray *)expandableProperties;

@end
