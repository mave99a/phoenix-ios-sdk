//
//  TSPhoenix
//	TSEdition.m
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSEdition.h"
#import "TSPhoenixClient.h"

@implementation TSEdition

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
		
		// expanded properties
		if ([dotNetType isEqualToString:@"relationship"]) {
            if ([value isKindOfClass:[NSArray class]]) {
#warning TODO: expanded array properties in script, mapping
                
            } else {
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
            }
			
			return;
        }

		
        [self setValue:value forKey:info[@"mappedName"]];
		

        
    }];
    
}

// Mapping from self.property to json['property']
+ (NSDictionary *)mappingDictionary {
	return @{
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"editionID"},
		@"ProjectId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"projectID"},
		@"StatusTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"statusTypeID"},
		@"Title" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"title"},
		@"Description" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"editionDescription"},
		@"CoverImageUrl" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"coverImageUrl"},
		@"MajorVersion" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"majorVersion"},
		@"MinorVersion" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"minorVersion"},
		@"PointVersion" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"pointVersion"},
		@"LiveDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"liveDate"},
		@"Reference" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"reference"},
		@"IsActive" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"isActive"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"Project" : @{@"type": @"relationship", @"mappedType":@"TSProject", @"mappedName": @"project"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.editionID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/Edition/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/Edition";
  
}

+ (instancetype)editionWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"project"
  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end