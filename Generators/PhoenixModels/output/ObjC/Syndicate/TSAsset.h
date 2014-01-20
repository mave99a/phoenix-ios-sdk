//
//  TSPhoenix
//	TSAsset.h
//
//  Created by Steve on January 20th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"



#ifndef AssetTypeIdEnum
#define AssetTypeIdEnum
typedef NS_ENUM(NSUInteger, AssetTypeId) {
	kAssetTypeIdImage = 1,
	kAssetTypeIdVideo,
	kAssetTypeIdDocument,
	kAssetTypeIdHTML_Package,
};

#endif



@interface TSAsset: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *assetID;
@property (nonatomic, strong) NSNumber *assetTypeID;
@property (nonatomic, strong) NSNumber *articleID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *caption;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *thumbnailUrl;
@property (nonatomic, strong) NSNumber *rank;
@property (nonatomic, strong) NSDate *publishDate;
@property (nonatomic, strong) NSNumber *duration;
@property (nonatomic, strong) NSNumber *fileSize;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties




// TODO
+ (NSArray *)expandableProperties;

@end
