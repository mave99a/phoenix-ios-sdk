//
//  TSPhoenix
//	TSMediaFile.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSMediaFileType;

#ifndef ProcessedTypeIdEnum
#define ProcessedTypeIdEnum
typedef NS_ENUM(NSUInteger, ProcessedTypeId) {
	kProcessedTypeIdUploading = 1,
	kProcessedTypeIdPending,
	kProcessedTypeIdSuccess,
	kProcessedTypeIdFailed,
};

#endif



@interface TSMediaFile: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *mediaFileID;
@property (nonatomic, strong) NSNumber *mediaID;
@property (nonatomic, strong) NSNumber *processedTypeID;
@property (nonatomic, strong) NSNumber *mediaFileTypeID;
@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSMediaFileType *mediaFileType;



// TODO
+ (NSArray *)expandableProperties;

@end
