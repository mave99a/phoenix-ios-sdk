//
//  TSPhoenix
//	TSCompany.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProvider;
@class TSDomains;



@interface TSCompany: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *companyID;
@property (nonatomic, strong) NSNumber *providerID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, copy) NSString *logoUrl;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, copy) NSString *metaData;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProvider *provider;
@property (nonatomic, strong) TSDomains *domains;



// TODO
+ (NSArray *)expandableProperties;

@end
