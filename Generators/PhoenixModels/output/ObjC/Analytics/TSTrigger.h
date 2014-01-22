//
//  TSPhoenix
//	TSTrigger.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSEventType;




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
@property (nonatomic, strong) NSArray *triggerActionMaps;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSEventType *eventType;



// TODO
+ (NSArray *)expandableProperties;

@end
