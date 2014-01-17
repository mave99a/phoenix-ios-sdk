//
//  NSObject+DictionaryRepresentation.m
//  TSPhoenix
//
//  Created by Steve on 22/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "NSObject+DictionaryRepresentation.h"
#import "TSPhoenixClient.h"

@implementation NSObject (TSDictionaryRepresentation)

/**
 Turns an object into NSDictionary, for API requests
 */
- (NSDictionary *)dictionaryRepresentationWithMapping: (NSDictionary *)mapping {
    NSMutableDictionary *mutableDict = [NSMutableDictionary new];
    
    [mapping enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id value = [self valueForKey:key];
        
        if ([value isKindOfClass:[NSDate class]]) {
            // Phoenix uses /Date(xxxxxxxx)/ format
            value = [[TSPhoenixClient sharedInstance].defaultDateFormatter stringFromDate:value];
        }
        
        if (value)
            mutableDict[obj] = value;
    }];
    
    return [mutableDict copy];
}

@end
