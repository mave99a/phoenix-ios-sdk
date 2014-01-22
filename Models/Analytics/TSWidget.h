//
//  TSPhoenix
//	TSWidget.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSProject;

#ifndef WidgetTypeIdEnum
#define WidgetTypeIdEnum
typedef NS_ENUM(NSUInteger, WidgetTypeId) {
	kWidgetTypeIdPhoenixEvent = 1,
	kWidgetTypeIdPhoenixActivity,
	kWidgetTypeIdExternalUrl,
	kWidgetTypeIdAppfigures,
	kWidgetTypeIdQloudstats,
	kWidgetTypeIdLatestMedia,
	kWidgetTypeIdMostViewedMedia,
};

#endif



@interface TSWidget: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *widgetID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *widgetTypeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *parameter;
@property (nonatomic, strong) NSNumber *sortOrder;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
