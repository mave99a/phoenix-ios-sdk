//
//  TSPhoenix
//	TSTag.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProject;

#ifndef EntityTypeIdEnum
#define EntityTypeIdEnum
typedef NS_ENUM(NSUInteger, EntityTypeId) {
	kEntityTypeIdMedia = 1,
	kEntityTypeIdProfile,
	kEntityTypeIdChannel,
};

#endif



@interface TSTag: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *tagID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *entityTypeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *tagCount;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
