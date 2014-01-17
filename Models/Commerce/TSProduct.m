//
//  TSPhoenix
//	TSProduct.m
//
//  Created by Steve on January 14th 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSProduct.h"
#import "TSPhoenixClient.h"

@implementation TSProduct

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
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"productID"},
		@"ProductIdentifier" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"productIDentifier"},
		@"ProductTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"productTypeID"},
		@"ApplicationId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"applicationID"},
		@"Name" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"name"},
		@"Price" : @{@"type": @"System.Decimal", @"mappedType":@"undefined", @"mappedName": @"price"},
		@"MinMajorVersion" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"minMajorVersion"},
		@"MinMinorVersion" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"minMinorVersion"},
		@"IsActive" : @{@"type": @"System.Boolean", @"mappedType":@"NSNumber", @"mappedName": @"isActive"},
		@"MinPointVersion" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"minPointVersion"},
		@"Description" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"productDescription"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"Application" : @{@"type": @"relationship", @"mappedType":@"TSApplication", @"mappedName": @"application"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.productID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/Product/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/Product";
  
}

+ (instancetype)productWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"application"
  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end