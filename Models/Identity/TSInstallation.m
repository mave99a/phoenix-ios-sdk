//
//  TSPhoenix
//	TSInstallation.m
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSInstallation.h"
#import "TSPhoenixClient.h"

@implementation TSInstallation

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
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"installationID"},
		@"ProjectId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"projectID"},
		@"InstallationId" : @{@"type": @"undefined", @"mappedType":@"undefined", @"mappedName": @"appInstallationID"},
		@"ApplicationId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"applicationID"},
		@"InstalledVersion" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"installedVersion"},
		@"DeviceTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"deviceTypeID"},
		@"UserId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"userID"},
		@"IdentifierId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"identifierID"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"OperatingSystemVersion" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"operatingSystemVersion"},
		@"ModelReference" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"modelReference"},
		@"Identifier" : @{@"type": @"relationship", @"mappedType":@"TSIdentifier", @"mappedName": @"identifier"},
		@"Project" : @{@"type": @"relationship", @"mappedType":@"TSProject", @"mappedName": @"project"},
		@"User" : @{@"type": @"relationship", @"mappedType":@"TSUser", @"mappedName": @"user"},
		@"Application" : @{@"type": @"relationship", @"mappedType":@"TSApplication", @"mappedName": @"application"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.installationID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/Installation/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/Installation";
  
}

+ (instancetype)installationWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"identifier",
@"project",
@"user",
@"application"
  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end