//
//  TSPhoenix
//	TSActionTypeGroup.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"





@interface TSActionTypeGroup: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *actionTypeGroupID;
@property (nonatomic, copy) NSString *actionTypeGroupDescription;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties




// TODO
+ (NSArray *)expandableProperties;

@end
