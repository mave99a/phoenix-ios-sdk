//
//  TSPhoenix
//	TSModule.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"



#ifndef IdEnum
#define IdEnum
typedef NS_ENUM(NSUInteger, Id) {
	kIdIdentity = 1,
	kIdMessaging,
	kIdMedia,
	kIdDataCapture,
	kIdSyndicate,
	kIdLocation,
	kIdCommerce,
	kIdAnalytics,
	kIdResponse,
};

#endif



@interface TSModule: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *moduleID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSNumber *isVisibleInPhoenix;
@property (nonatomic, strong) NSNumber *rank;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties




// TODO
+ (NSArray *)expandableProperties;

@end
