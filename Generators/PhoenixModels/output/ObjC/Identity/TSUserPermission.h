//
//  TSPhoenix
//	TSUserPermission.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSAction;
@class TSProject;
@class TSResource;
@class TSUser;



@interface TSUserPermission: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *userPermissionID;
@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSNumber *resourceID;
@property (nonatomic, strong) NSNumber *actionID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *entityID;
@property (nonatomic, strong) NSNumber *isGrant;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSAction *action;
@property (nonatomic, strong) TSProject *project;
@property (nonatomic, strong) TSResource *resource;
@property (nonatomic, strong) TSUser *user;



// TODO
+ (NSArray *)expandableProperties;

@end
