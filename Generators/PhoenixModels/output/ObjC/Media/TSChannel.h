//
//  TSPhoenix
//	TSChannel.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSOwnerProfile;
@class TSProject;
@class TSCategory;



@interface TSChannel: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *channelID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *ownerProfileID;
@property (nonatomic, strong) NSNumber *categoryID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, copy) NSString *channelDescription;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, strong) NSNumber *voteCount_Overall;
@property (nonatomic, strong) NSNumber *viewCount_Overall;
@property (nonatomic, strong) NSNumber *mediaCount_Overall;
@property (nonatomic, strong) NSDate *lastMediaCreatedDate;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *phoenixIDentity_GroupId_Subscribers;
@property (nonatomic, strong) NSNumber *phoenixIDentity_GroupId_Editors;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSOwnerProfile *ownerProfile;
@property (nonatomic, strong) TSProject *project;
@property (nonatomic, strong) TSCategory *category;



// TODO
+ (NSArray *)expandableProperties;

@end
