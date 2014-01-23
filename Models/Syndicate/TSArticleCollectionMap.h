//
//  TSPhoenix
//	TSArticleCollectionMap.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSArticle;
@class TSCollection;
@class TSEdition;
@class TSSection;



@interface TSArticleCollectionMap: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *articleCollectionMapID;
@property (nonatomic, strong) NSNumber *editionID;
@property (nonatomic, strong) NSNumber *sectionID;
@property (nonatomic, strong) NSNumber *articleID;
@property (nonatomic, strong) NSNumber *rank;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *collectionID;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSArticle *article;
@property (nonatomic, strong) TSCollection *collection;
@property (nonatomic, strong) TSEdition *edition;
@property (nonatomic, strong) TSSection *section;



// TODO
+ (NSArray *)expandableProperties;

@end
