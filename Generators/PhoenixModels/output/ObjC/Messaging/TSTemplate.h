//
//  TSPhoenix
//	TSTemplate.h
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@class TSAccount;
@class TSProject;
@class TSTemplateGroup;



@interface TSTemplate: TSModelAbstract <NSCoding>

- (id)initWithDictionary: (NSDictionary *)dict;

- (void)mapFromDictionary: (NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *templateID;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSNumber *accountID;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *payload;
@property (nonatomic, copy) NSString *senderAddress;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSNumber *templateGroupID;
@property (nonatomic, copy) NSString *payloadUrl;



// Expanded properties
// These will be nil, unless specific parameters "expand=propertyname" are set to expand these properties

@property (nonatomic, strong) TSAccount *account;
@property (nonatomic, strong) TSProject *project;
@property (nonatomic, strong) TSTemplateGroup *templateGroup;



// TODO
+ (NSArray *)expandableProperties;

@end
