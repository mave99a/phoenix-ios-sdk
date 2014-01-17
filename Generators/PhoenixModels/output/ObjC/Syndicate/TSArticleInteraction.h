//
//  TSPhoenix
//	TSArticleInteraction.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSArticle;

#ifndef InteractionTypeIdEnum
#define InteractionTypeIdEnum
typedef NS_ENUM(NSUInteger, InteractionTypeId) {
	kInteractionTypeIdViewed = 1,
	kInteractionTypeIdStarred,
	kInteractionTypeIdTrashed,
	kInteractionTypeIdAgreed,
};

#endif



@interface TSArticleInteraction: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *articleID;
@property (nonatomic, strong) NSNumber *phoenixIDentity_UserId;
@property (nonatomic, strong) NSNumber *interactionTypeID;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSArticle *article;



// TODO
+ (NSArray *)expandableProperties;

@end
