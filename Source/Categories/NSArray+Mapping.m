//
//  NSArray+Mapping.m
//  TSPhoenix
//
//  Created by Steve on 22/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "NSArray+Mapping.h"

@implementation NSArray (Mapping)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj, idx)];
    }];
    return result;
}

@end
