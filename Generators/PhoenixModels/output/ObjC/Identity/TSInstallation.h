//
//  TSPhoenix
//	TSInstallation.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSIdentifier;
@class TSProject;
@class TSUser;
@class TSApplication;

#ifndef DeviceTypeIdEnum
#define DeviceTypeIdEnum
typedef NS_ENUM(NSUInteger, DeviceTypeId) {
	kDeviceTypeIdSmartphone = 1,
	kDeviceTypeIdTablet,
	kDeviceTypeIdDesktop,
	kDeviceTypeIdSmartTV,
	kDeviceTypeIdWearable,
};

#endif



@interface TSInstallation: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *installationID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *applicationID;
@property (nonatomic, copy) NSString *installedVersion;
@property (nonatomic, strong) NSNumber *deviceTypeID;
@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSNumber *identifierID;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, copy) NSString *operatingSystemVersion;
@property (nonatomic, copy) NSString *modelReference;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSIdentifier *identifier;
@property (nonatomic, strong) TSProject *project;
@property (nonatomic, strong) TSUser *user;
@property (nonatomic, strong) TSApplication *application;



// TODO
+ (NSArray *)expandableProperties;

@end
