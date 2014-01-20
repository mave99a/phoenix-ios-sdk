//
//  TSPhoenix
//	TSProjectMediaFileTypeMap.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSMediaFileType;
@class TSProject;



@interface TSProjectMediaFileTypeMap: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *projectMediaFileTypeMapID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *mediaFileTypeID;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSMediaFileType *mediaFileType;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
