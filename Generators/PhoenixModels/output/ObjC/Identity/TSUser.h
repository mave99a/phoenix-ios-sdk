//
//  TSPhoenix
//	TSUser.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSCompany;


#ifndef UserTypeIdEnum
#define UserTypeIdEnum
typedef NS_ENUM(NSUInteger, UserTypeId) {
	kUserTypeIdPlatform_Administrator = 1,
	kUserTypeIdPhoenix_Component,
	kUserTypeIdProvider_Administrator,
	kUserTypeIdCompany_Administrator,
	kUserTypeIdRestricted_Application,
	kUserTypeIdRestricted_Application_User,
};

#endif



@interface TSUser: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSNumber *userTypeID;
@property (nonatomic, strong) NSNumber *companyID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSNumber *lockingCount;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *lastLoginDate;
@property (nonatomic, strong) NSDate *expiryDate;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, copy) NSString *metaData;
@property (nonatomic, strong) NSArray *identifiers;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSCompany *company;



// TODO
+ (NSArray *)expandableProperties;

@end
