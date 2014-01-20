//
//  TSPhoenix
//	TSTriggerActionMap.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSAction;
@class TSProject;



@interface TSTriggerActionMap: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *triggerActionMapID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *triggerID;
@property (nonatomic, strong) NSNumber *actionID;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSAction *action;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
