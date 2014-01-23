//
//  TSModelAbstract.m
//  TSPhoenix
//
//  Created by Steve on 28/10/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSModelAbstract.h"

@implementation TSModelAbstract

- (id)initWithDictionary: (NSDictionary *)dict {
    self = [self init];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    
    [[[self class] mappingDictionary] enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary *info, BOOL *stop) {
        NSString *dotNetType = info[@"type"];

        // expanded properties
		if ([dotNetType isEqualToString:@"relationship"])
            return;
        
        NSString *mappedName = info[@"mappedName"];
        
        id value = [aDecoder decodeObjectForKey:mappedName];
        if (value)
            [self setValue:value forKey:mappedName];
        
    }];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [[[self class] mappingDictionary] enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary *info, BOOL *stop) {
        NSString *dotNetType = info[@"type"];
        
        // expanded properties
		if ([dotNetType isEqualToString:@"relationship"])
            return;
        
        NSString *mappedName = info[@"mappedName"];
        
        id value = [self valueForKey:mappedName];
        if (value)
            [aCoder encodeObject:value forKey:mappedName];
        
    }];

}

- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] allocWithZone:zone] init];
    
    [[[self class] mappingDictionary] enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary *info, BOOL *stop) {
        NSString *mappedName = info[@"mappedName"];
        
        id value = [self valueForKey:mappedName];
        if (value)
            [copy setValue:value
                    forKey:mappedName];
        
    }];
    
    return copy;
}


- (NSString *)dbKey {
    NSAssert(NO, @"TSModelAbstract is an abstract super class. Use one of its concrete subclasses");
    return nil;
}

+ (NSString *)dbKeyWithID: (NSNumber *)identifier {
    NSAssert(NO, @"TSModelAbstract is an abstract super class. Use one of its concrete subclasses");
    return nil;
}

- (NSString *)dbCollection {
    return [[self class] dbCollection];
}

+ (NSString *)dbCollection {
    NSAssert(NO, @"TSModelAbstract is an abstract super class. Use one of its concrete subclasses");
    return nil;
}

+ (NSDictionary *)mappingDictionary {
    NSAssert(NO, @"TSModelAbstract is an abstract super class. Use one of its concrete subclasses");
    return nil;
}

// Handle undefined key, which is likely due to server side model changes
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"warning: %@ setting value for undefined key: %@", self, key);
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"warning: %@ getting value for undefined key: %@", self, key);
    return nil;
}

@end
