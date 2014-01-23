//
//  TSPhoenix
//	TSTransaction.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProduct;

#ifndef StatusTypeIdEnum
#define StatusTypeIdEnum
typedef NS_ENUM(NSUInteger, StatusTypeId) {
	kStatusTypeIdSuccess = 1,
	kStatusTypeIdError,
};

#endif



@interface TSTransaction: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *transactionID;
@property (nonatomic, strong) NSNumber *phoenixIDentity_UserId;
@property (nonatomic, strong) NSNumber *productID;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, copy) NSString *receiptData;
@property (nonatomic, strong) NSNumber *quantity;
@property (nonatomic, strong) NSNumber *statusTypeID;
@property (nonatomic, copy) NSString *statusDescription;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProduct *product;



// TODO
+ (NSArray *)expandableProperties;

@end
