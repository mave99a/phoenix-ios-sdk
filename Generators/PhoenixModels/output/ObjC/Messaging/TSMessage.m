//
//  TSPhoenix
//	TSMessage.m
//
//  Created by Steve on January 23rd 2014.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSMessage.h"
#import "TSPhoenixClient.h"
#import "NSArray+Mapping.h"

@implementation TSMessage

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
		@"Id" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"messageID"},
		@"ProjectId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"projectID"},
		@"AccountId" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"accountID"},
		@"MessageTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"messageTypeID"},
		@"DirectionTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"directionTypeID"},
		@"SenderAddress" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"senderAddress"},
		@"StatusTypeId" : @{@"type": @"enumList", @"mappedType":@"NSNumber", @"mappedName": @"statusTypeID"},
		@"StatusDesc" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"statusDesc"},
		@"ProcessDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"processDate"},
		@"Location" : @{@"type": @"System.Data.Spatial.DbGeography", @"mappedType":@"undefined", @"mappedName": @"location"},
		@"Payload" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"payload"},
		@"RecipientCount" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"recipientCount"},
		@"ExpectedRecipientCount" : @{@"type": @"System.Int32", @"mappedType":@"NSNumber", @"mappedName": @"expectedRecipientCount"},
		@"Subject" : @{@"type": @"System.String", @"mappedType":@"NSString", @"mappedName": @"subject"},
		@"CreateDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"createDate"},
		@"ModifyDate" : @{@"type": @"System.DateTime", @"mappedType":@"NSDate", @"mappedName": @"modifyDate"},
		@"Account" : @{@"type": @"relationship", @"mappedType":@"TSAccount", @"mappedName": @"account"},
		@"Project" : @{@"type": @"relationship", @"mappedType":@"TSProject", @"mappedName": @"project"},
		@"Recipients" : @{@"type": @"relationship.array", @"mappedType":@"NSArray", @"mappedName": @"recipients", @"arrayContentType": @"TSRecipient"}
	};
}

- (NSString *)dbKey {
	
    return [[self class] dbKeyWithID:self.messageID];
	
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    return [NSString stringWithFormat:@"Phoenix/Message/%@", [identifier stringValue]];
}

+ (NSString *)dbCollection {
  // TODO: needs thinking: what about ArticleInderation? How to store those?
  // TODO: maybe override dbKey and dbKeyWithID:? 
  
  return @"Phoenix/Message";
  
}

+ (instancetype)messageWithID: (NSNumber *)objectID {
   
    NSString *key = [self dbKeyWithID:objectID];
    __block id object;
    [[TSPhoenixClient sharedInstance].readOnlyDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        object = [transaction objectForKey:key inCollection:[[self class] dbCollection]];        
    }];
    return object;
}



+ (NSArray *)expandableProperties {
  return @[
   @"account",
@"project",

  ];
}

+ (NSArray *)uncodableProperties {
	return [self expandableProperties];
}

@end