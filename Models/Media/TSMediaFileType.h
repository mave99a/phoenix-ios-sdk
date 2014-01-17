//
//  TSPhoenix
//	TSMediaFileType.h
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSFileExtension;

#ifndef InputMediaTypeIdEnum
#define InputMediaTypeIdEnum
typedef NS_ENUM(NSUInteger, InputMediaTypeId) {
	kInputMediaTypeIdTextOnly = 1,
	kInputMediaTypeIdImage,
	kInputMediaTypeIdAudio,
	kInputMediaTypeIdVideo,
};

#endif



@interface TSMediaFileType: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *mediaFileTypeID;
@property (nonatomic, copy) NSString *mediaFileTypeDescription;
@property (nonatomic, copy) NSString *outputSuffix;
@property (nonatomic, strong) NSNumber *outputFileExtensionID;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSNumber *isPreview;
@property (nonatomic, strong) NSNumber *inputMediaTypeID;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, copy) NSString *configXml;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSFileExtension *fileExtension;



// TODO
+ (NSArray *)expandableProperties;

@end
