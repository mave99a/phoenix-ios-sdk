//
//  TSPhoenix
//	TSResource.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"



#ifndef ModuleIdEnum
#define ModuleIdEnum
typedef NS_ENUM(NSUInteger, ModuleId) {
	kModuleIdIdentity = 1,
	kModuleIdMessaging,
	kModuleIdMedia,
	kModuleIdDataCapture,
	kModuleIdSyndicate,
	kModuleIdLocation,
	kModuleIdCommerce,
	kModuleIdAnalytics,
	kModuleIdResponse,
};

#endif



@interface TSResource: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *resourceID;
@property (nonatomic, strong) NSNumber *moduleID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties




// TODO
+ (NSArray *)expandableProperties;

@end
