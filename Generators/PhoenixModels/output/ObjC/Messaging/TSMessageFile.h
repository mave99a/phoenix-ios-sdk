//
//  TSPhoenix
//	TSMessageFile.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSMessage;



@interface TSMessageFile: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *messageFileID;
@property (nonatomic, strong) NSNumber *messageID;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *fileExtension;
@property (nonatomic, copy) NSString *mimeType;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSMessage *message;



// TODO
+ (NSArray *)expandableProperties;

@end
