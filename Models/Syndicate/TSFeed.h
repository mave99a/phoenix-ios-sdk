//
//  TSPhoenix
//	TSFeed.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSSection;

#ifndef FeedTypeIdEnum
#define FeedTypeIdEnum
typedef NS_ENUM(NSUInteger, FeedTypeId) {
	kFeedTypeIdArticles = 1,
	kFeedTypeIdImages,
	kFeedTypeIdVideos,
};

#endif



@interface TSFeed: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *feedID;
@property (nonatomic, strong) NSNumber *sectionID;
@property (nonatomic, strong) NSNumber *feedTypeID;
@property (nonatomic, strong) NSNumber *isActive;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSDate *nextUpdate;
@property (nonatomic, strong) NSNumber *tTL;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSSection *section;



// TODO
+ (NSArray *)expandableProperties;

@end
