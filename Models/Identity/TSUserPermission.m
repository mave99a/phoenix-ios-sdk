//
//  TSPhoenix
//	TSUserPermission.m
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSUserPermission.h"
#import "TSPhoenixClient.h"
#import "NSArray+Mapping.h"

@implementation TSUserPermission

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
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"userPermissionID"},
		@"UserId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"userID"},
		@"ResourceId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"resourceID"},
		@"ActionId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"actionID"},
		@"ProjectId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"projectID"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"EntityId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"entityID"},
		@"IsGrant" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"isGrant"},
		@"Action" : @{@"type": @"relationship", @"mappedType":@"TSAction", @"mappedName": @"action"},
		@"Project" : @{@"type": @"relationship", @"mappedType":@"TSProject", @"mappedName": @"project"},
		@"Resource" : @{@"type": @"relationship", @"mappedType":@"TSResource", @"mappedName": @"resource"},
		@"User" : @{@"type": @"relationship", @"mappedType":@"TSUser", @"mappedName": @"user"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.userPermissionID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/UserPermission/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/UserPermission";
  
}

+ (instancetype)userPermissionWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"action",
@"project",
@"resource",
@"user"
  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end