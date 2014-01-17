//
//  TSPhoenix
//	TSActionType.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSActionTypeGroup;



@interface TSActionType: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *actionTypeID;
@property (nonatomic, strong) NSNumber *actionTypeGroupID;
@property (nonatomic, copy) NSString *actionTypeDescription;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, copy) NSString *activator;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSActionTypeGroup *actionTypeGroup;



// TODO
+ (NSArray *)expandableProperties;

@end
