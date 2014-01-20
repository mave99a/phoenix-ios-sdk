//
//  TSPhoenix
//	TSArticle.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSAssets;
@class TSProject;



@interface TSArticle: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *articleID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *articleDescription;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *contentData;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, strong) NSDate *publishDate;
@property (nonatomic, copy) NSString *metadata;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *projectID;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSAssets *assets;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
