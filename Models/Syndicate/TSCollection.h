//
//  TSPhoenix
//	TSCollection.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProject;



@interface TSCollection: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *collectionID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *hasEdition;
@property (nonatomic, strong) NSNumber *hasSection;
@property (nonatomic, strong) NSNumber *hasRank;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, copy) NSString *reference;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
