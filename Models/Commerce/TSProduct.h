//
//  TSPhoenix
//	TSProduct.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSApplication;

#ifndef ProductTypeIdEnum
#define ProductTypeIdEnum
typedef NS_ENUM(NSUInteger, ProductTypeId) {
	kProductTypeIdIAPConsumable = 1,
	kProductTypeIdIAPNonConsumable,
	kProductTypeIdIAPAutoRenewableSubscription,
	kProductTypeIdIAPFreeSubscription,
	kProductTypeIdIAPNonRenewingSubscription,
};

#endif



@interface TSProduct: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *productID;
@property (nonatomic, copy) NSString *productIDentifier;
@property (nonatomic, strong) NSNumber *productTypeID;
@property (nonatomic, strong) NSNumber *applicationID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *minMajorVersion;
@property (nonatomic, strong) NSNumber *minMinorVersion;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSNumber *minPointVersion;
@property (nonatomic, copy) NSString *productDescription;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSApplication *application;



// TODO
+ (NSArray *)expandableProperties;

@end
