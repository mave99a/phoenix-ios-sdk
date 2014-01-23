//
//  TSPhoenix
//	TSIdentifier.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProject;

#ifndef IdentifierTypeIdEnum
#define IdentifierTypeIdEnum
typedef NS_ENUM(NSUInteger, IdentifierTypeId) {
	kIdentifierTypeIdEmail = 1,
	kIdentifierTypeIdMsisdn,
	kIdentifierTypeIdiOS_Device_Token,
	kIdentifierTypeIdAndroid_RegistrationID,
	kIdentifierTypeIdWindows_RegistrationID,
};

#endif



@interface TSIdentifier: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *identifierID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSNumber *identifierTypeID;
@property (nonatomic, strong) NSNumber *isConfirmed;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
