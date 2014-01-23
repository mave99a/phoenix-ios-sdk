//
//  TSPhoenix
//	TSDomain.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProvider;



@interface TSDomain: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *domainID;
@property (nonatomic, strong) NSNumber *providerID;
@property (nonatomic, strong) NSNumber *companyID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProvider *provider;



// TODO
+ (NSArray *)expandableProperties;

@end
