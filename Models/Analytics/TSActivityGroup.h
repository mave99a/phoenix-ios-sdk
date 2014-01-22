//
//  TSPhoenix
//	TSActivityGroup.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSActivityGroup2;



@interface TSActivityGroup: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *activityGroupID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSActivityGroup2 *activityGroup2;



// TODO
+ (NSArray *)expandableProperties;

@end
