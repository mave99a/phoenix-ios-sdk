//
//  TSPhoenix
//	TSFileExtension.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"



#ifndef MediaTypeIdEnum
#define MediaTypeIdEnum
typedef NS_ENUM(NSUInteger, MediaTypeId) {
	kMediaTypeIdTextOnly = 1,
	kMediaTypeIdImage,
	kMediaTypeIdAudio,
	kMediaTypeIdVideo,
};

#endif



@interface TSFileExtension: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *fileExtensionID;
@property (nonatomic, strong) NSNumber *mediaTypeID;
@property (nonatomic, copy) NSString *extension;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties




// TODO
+ (NSArray *)expandableProperties;

@end
