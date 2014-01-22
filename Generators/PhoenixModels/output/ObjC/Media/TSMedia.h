//
//  TSPhoenix
//	TSMedia.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSCategory;
@class TSParentMedia;
@class TSProfile;
@class TSProject;

#ifndef StatusTypeIdEnum
#define StatusTypeIdEnum
typedef NS_ENUM(NSUInteger, StatusTypeId) {
	kStatusTypeIdPending = 1,
	kStatusTypeIdApproved,
	kStatusTypeIdDeclined,
};

#endif

#ifndef MediaTypeIdEnum
#define MediaTypeIdEnum
typedef NS_ENUM(NSUInteger, MediaTypeId) {
	kMediaTypeIdTextOnly = 1,
	kMediaTypeIdImage,
	kMediaTypeIdAudio,
	kMediaTypeIdVideo,
};

#endif

#ifndef PrivacyTypeIdEnum
#define PrivacyTypeIdEnum
typedef NS_ENUM(NSUInteger, PrivacyTypeId) {
	kPrivacyTypeIdPrivate = 1,
	kPrivacyTypeIdPublic,
};

#endif

#ifndef ProcessedTypeIdEnum
#define ProcessedTypeIdEnum
typedef NS_ENUM(NSUInteger, ProcessedTypeId) {
	kProcessedTypeIdUploading = 1,
	kProcessedTypeIdPending,
	kProcessedTypeIdSuccess,
	kProcessedTypeIdFailed,
};

#endif



@interface TSMedia: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *mediaID;
@property (nonatomic, strong) NSNumber *parentMediaID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *profileID;
@property (nonatomic, strong) NSNumber *statusTypeID;
@property (nonatomic, strong) NSNumber *categoryID;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, strong) NSNumber *mediaTypeID;
@property (nonatomic, strong) NSNumber *privacyTypeID;
@property (nonatomic, strong) NSNumber *durationInSeconds;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mediaDescription;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *lastViewedDate;
@property (nonatomic, strong) NSDate *lastVotedDate;
@property (nonatomic, strong) NSDate *lastSharedDate;
@property (nonatomic, strong) NSDate *lastCommentedDate;
@property (nonatomic, strong) NSNumber *viewCount_Daily;
@property (nonatomic, strong) NSNumber *viewCount_Weekly;
@property (nonatomic, strong) NSNumber *viewCount_Monthly;
@property (nonatomic, strong) NSNumber *viewCount_Overall;
@property (nonatomic, strong) NSNumber *voteCount_Daily;
@property (nonatomic, strong) NSNumber *voteCount_Weekly;
@property (nonatomic, strong) NSNumber *voteCount_Monthly;
@property (nonatomic, strong) NSNumber *voteCount_Overall;
@property (nonatomic, strong) NSNumber *shareCount_Daily;
@property (nonatomic, strong) NSNumber *shareCount_Weekly;
@property (nonatomic, strong) NSNumber *shareCount_Monthly;
@property (nonatomic, strong) NSNumber *shareCount_Overall;
@property (nonatomic, strong) NSNumber *commentCount_Daily;
@property (nonatomic, strong) NSNumber *commentCount_Weekly;
@property (nonatomic, strong) NSNumber *commentCount_Monthly;
@property (nonatomic, strong) NSNumber *commentCount_Overall;
@property (nonatomic, strong) NSNumber *processedTypeID;
@property (nonatomic, copy) NSString *sourceFilePath;
@property (nonatomic, copy) NSString *previewFilePath;
@property (nonatomic, copy) NSString *metaData;
@property (nonatomic, strong) NSNumber *replyCount_Daily;
@property (nonatomic, strong) NSNumber *replyCount_Weekly;
@property (nonatomic, strong) NSNumber *replyCount_Monthly;
@property (nonatomic, strong) NSNumber *replyCount_Overall;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSArray *mediaFiles;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSCategory *category;
@property (nonatomic, strong) TSParentMedia *parentMedia;
@property (nonatomic, strong) TSProfile *profile;
@property (nonatomic, strong) TSProject *project;



// TODO
+ (NSArray *)expandableProperties;

@end
