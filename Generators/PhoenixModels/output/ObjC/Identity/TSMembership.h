//
//  TSPhoenix
//	TSMembership.h
//
//  Created by Steve on January 22nd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSGroup;
@class TSUser;
@class TSIdentifier;



@interface TSMembership: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *membershipID;
@property (nonatomic, strong) NSNumber *groupID;
@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSNumber *identifierID;
@property (nonatomic, strong) NSDate *joinDate;
@property (nonatomic, strong) NSDate *expiryDate;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSGroup *group;
@property (nonatomic, strong) TSUser *user;
@property (nonatomic, strong) TSIdentifier *identifier;



// TODO
+ (NSArray *)expandableProperties;

@end
