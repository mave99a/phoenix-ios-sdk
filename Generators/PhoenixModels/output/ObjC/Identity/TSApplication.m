//
//  TSPhoenix
//	TSApplication.m
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSApplication.h"
#import "TSPhoenixClient.h"

@implementation TSApplication

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
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"applicationID"},
		@"ProjectId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"projectID"},
		@"ApplicationTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"applicationTypeID"},
		@"Name" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"name"},
		@"Description" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"applicationDescription"},
		@"MetaData" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"metaData"},
		@"ImageUrl" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"imageUrl"},
		@"UserId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"userID"},
		@"LatestVersion" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"latestVersion"},
		@"ForceUpgrade" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"forceUpgrade"},
		@"InstallationUrl" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"installationUrl"},
		@"InstallationCount" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"installationCount"},
		@"Reference" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"reference"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"Project" : @{@"type": @"relationship", @"mappedType":@"TSProject", @"mappedName": @"project"},
		@"User" : @{@"type": @"relationship", @"mappedType":@"TSUser", @"mappedName": @"user"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.applicationID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/Application/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/Application";
  
}

+ (instancetype)applicationWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"project",
@"user"
  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end