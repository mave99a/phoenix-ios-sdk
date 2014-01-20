//
//  TSPhoenix
//	TSTrigger.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSEventType;
@class TSTriggerActionMaps;



@interface TSTrigger: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *triggerID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *triggerDescription;
@property (nonatomic, strong) NSNumber *eventTypeID;
@property (nonatomic, copy) NSString *configuration;
@property (nonatomic, copy) NSString *activator;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSEventType *eventType;
@property (nonatomic, strong) TSTriggerActionMaps *triggerActionMaps;



// TODO
+ (NSArray *)expandableProperties;

@end
