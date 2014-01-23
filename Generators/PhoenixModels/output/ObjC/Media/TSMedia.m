//
//  TSPhoenix
//	TSMedia.m
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSMedia.h"
#import "TSPhoenixClient.h"
#import "NSArray+Mapping.h"

@implementation TSMedia

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
	
    [self mapFromDictionary:dict];
	
    return self;
}

- (void)mapFromDictionary: (NSDictionary *)dict {
    [[self.class mappingDictionary] enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary *info, BOOL *stop) {
        
        id value = dict[key];
        if (!value) return ;
        
        if ([value isKindOfClass:[NSNull class]]) {
            [self setValue:nil forKey:info[@"mappedName"]];
            return;
        }
        
        NSString *dotNetType = info[@"type"];
        
        // Dot Net date /Date(xxxxxxxxxx)/
        if ([dotNetType isEqualToString:@"System.DateTime"]) {
            NSDate *date = [[TSPhoenixClient sharedInstance].defaultDateFormatter dateFromString:value];
            [self setValue:date forKey:info[@"mappedName"]];
            return;
        }
        
        // bool
        if ([dotNetType isEqualToString:@"System.Boolean"]) {
            BOOL boolValue = [value boolValue];
            [self setValue:@(boolValue) forKey:info[@"mappedName"]];
            return;
        }
		
        // expanded array properties
        if ([dotNetType isEqualToString:@"relationship.array"]) {
            if (![value isKindOfClass:[NSArray class]]) {
                NSLog(@"Warning: mapping skips array expansion %@ because the value %@ is not an array", info[@"mappedName"], value);
                return;
            }
            
            NSString *className = info[@"arrayContentType"];
            if (!className)
                return;
            
            Class DestinationClass = NSClassFromString(className);
            if (!DestinationClass) {
                NSLog(@"Warning: unsuccessful mapping because class %@ not found", className);
                return;
            }
            
            NSArray *mappedArray = [value mapObjectsUsingBlock:^id(id obj, NSUInteger idx) {
                return [[DestinationClass alloc] initWithDictionary:obj];
            }];
            
            [self setValue:mappedArray forKey:info[@"mappedName"]];

            return;
        }
		
        // expanded properties
        if ([dotNetType isEqualToString:@"relationship"]) {
            
            if (![value isKindOfClass:[NSDictionary class]])
                return;
            
            NSString *className = info[@"mappedType"];
            if (!className)
                return;
            Class MappedClass = NSClassFromString(className);
            if (!MappedClass)
                return;
            
            id mappedObject = [[MappedClass alloc] initWithDictionary:value];
            
            [self setValue:mappedObject forKey:info[@"mappedName"]];
			
		        return;
        }

		
        [self setValue:value forKey:info[@"mappedName"]];
		

        
    }];
    
}

// Mapping from self.property to json['property']
+ (NSDictionary *)mappingDictionary {
	return @{
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"mediaID"},
		@"ParentMediaId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"parentMediaID"},
		@"ProjectId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"projectID"},
		@"ProfileId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"profileID"},
		@"StatusTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"statusTypeID"},
		@"CategoryId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"categoryID"},
		@"CategoryName" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"categoryName"},
		@"Tags" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"tags"},
		@"MediaTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"mediaTypeID"},
		@"PrivacyTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"privacyTypeID"},
		@"DurationInSeconds" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"durationInSeconds"},
		@"Name" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"name"},
		@"Description" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"mediaDescription"},
		@"Reference" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"reference"},
		@"Location" : @{@"type": @"System.Data.Spatial.DbGeography", @"mappedType":@"undefined", @"mappedName": @"location"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"LastViewedDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"lastViewedDate"},
		@"LastVotedDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"lastVotedDate"},
		@"LastSharedDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"lastSharedDate"},
		@"LastCommentedDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"lastCommentedDate"},
		@"ViewCount_Daily" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"viewCount_Daily"},
		@"ViewCount_Weekly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"viewCount_Weekly"},
		@"ViewCount_Monthly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"viewCount_Monthly"},
		@"ViewCount_Overall" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"viewCount_Overall"},
		@"VoteCount_Daily" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"voteCount_Daily"},
		@"VoteCount_Weekly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"voteCount_Weekly"},
		@"VoteCount_Monthly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"voteCount_Monthly"},
		@"VoteCount_Overall" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"voteCount_Overall"},
		@"Rating_Daily" : @{@"type": @"System.Double", @"mappedType":@"undefined", @"mappedName": @"rating_Daily"},
		@"Rating_Weekly" : @{@"type": @"System.Double", @"mappedType":@"undefined", @"mappedName": @"rating_Weekly"},
		@"Rating_Monthly" : @{@"type": @"System.Double", @"mappedType":@"undefined", @"mappedName": @"rating_Monthly"},
		@"Rating_Overall" : @{@"type": @"System.Double", @"mappedType":@"undefined", @"mappedName": @"rating_Overall"},
		@"ShareCount_Daily" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"shareCount_Daily"},
		@"ShareCount_Weekly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"shareCount_Weekly"},
		@"ShareCount_Monthly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"shareCount_Monthly"},
		@"ShareCount_Overall" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"shareCount_Overall"},
		@"CommentCount_Daily" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"commentCount_Daily"},
		@"CommentCount_Weekly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"commentCount_Weekly"},
		@"CommentCount_Monthly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"commentCount_Monthly"},
		@"CommentCount_Overall" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"commentCount_Overall"},
		@"ProcessedTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"processedTypeID"},
		@"SourceFilePath" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"sourceFilePath"},
		@"PreviewFilePath" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"previewFilePath"},
		@"MetaData" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"metaData"},
		@"ReplyCount_Daily" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"replyCount_Daily"},
		@"ReplyCount_Weekly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"replyCount_Weekly"},
		@"ReplyCount_Monthly" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"replyCount_Monthly"},
		@"ReplyCount_Overall" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"replyCount_Overall"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"Category" : @{@"type": @"relationship", @"mappedType":@"TSCategory", @"mappedName": @"category"},
		@"ParentMedia" : @{@"type": @"relationship", @"mappedType":@"TSParentMedia", @"mappedName": @"parentMedia"},
		@"Profile" : @{@"type": @"relationship", @"mappedType":@"TSProfile", @"mappedName": @"profile"},
		@"MediaFiles" : @{@"type": @"relationship.array", @"mappedType":@"NSArray", @"mappedName": @"mediaFiles", @"arrayContentType": @"TSMediaFile"},
		@"Project" : @{@"type": @"relationship", @"mappedType":@"TSProject", @"mappedName": @"project"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.mediaID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/Media/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/Media";
  
}

+ (instancetype)mediaWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"category",
@"parentMedia",
@"profile",
@"project"
  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end