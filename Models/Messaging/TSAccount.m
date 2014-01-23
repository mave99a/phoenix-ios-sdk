//
//  TSPhoenix
//	TSAccount.m
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSAccount.h"
#import "TSPhoenixClient.h"
#import "NSArray+Mapping.h"

@implementation TSAccount

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
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"accountID"},
		@"PhoenixIdentity_CompanyId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"phoenixIDentity_CompanyId"},
		@"AggregatorId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"aggregatorID"},
		@"MessageTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"messageTypeID"},
		@"Name" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"name"},
		@"SystemName" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"systemName"},
		@"Originator" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"originator"},
		@"Username" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"username"},
		@"Password" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"password"},
		@"Token" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"token"},
		@"ProviderUrl" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"providerUrl"},
		@"SupportsInbound" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"supportsInbound"},
		@"SupportsOutbound" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"supportsOutbound"},
		@"IsProductionGateway" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"isProductionGateway"},
		@"Certificate" : @{@"type": @"System.Byte", @"mappedType":@"NSNumber", @"mappedName": @"certificate"},
		@"IsActive" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"isActive"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"Aggregator" : @{@"type": @"relationship", @"mappedType":@"TSAggregator", @"mappedName": @"aggregator"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.accountID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/Account/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/Account";
  
}

+ (instancetype)accountWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"aggregator"
  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end