//
//  NSArray+Mapping.h
//  TSPhoenix
//
//  Created by Steve on 22/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Mapping)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;


@end
