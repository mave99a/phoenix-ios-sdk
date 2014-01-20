//
//  TSPhoenixFilter.h
//  TSPhoenix
//
//  Created by Steve on 22/11/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A helper class for constructing URLs with correct parameters
 */

typedef NS_ENUM(NSUInteger, PhoenixFilterOperands) {
    kPhoenixGreaterThanOperand = 0,
    kPhoenixGreaterThanOrEqualToOperand,
    kPhoenixEqualToOperand,
    kPhoenixLessThanOperand,
    kPhoenixLessThanOrEqualToOperand,
    kPhoenixUnequalOperand,
    kPhoenixLikeOperand,
    kPhoenixStartsWithOperand,
    kPhoenixEndsWithOperand
};

#define kOperandStringValues @[@"gt", @"ge", @"eq", @"lt", @"le", @"ne", @"like", @"sw", @"nw"]


@interface TSPhoenixFilter : NSObject

// Flatten an array of filters into a URL paramter string
+ (NSString *)filterStringFromFilters: (NSArray *)array;

#pragma mark - Filters
+ (NSString *)filterWithName: (NSString *)name
                       value: (NSString *)value
                        type: (PhoenixFilterOperands)type;


// Shorthand
+ (NSString *)name: (NSString *)name
             value: (NSString *)value
              type: (PhoenixFilterOperands)type;

// Formats date into a Phoenix compatible string
+ (NSString *)dateFilterWithName: (NSString *)name
                            date: (NSDate *)date
                            type: (NSInteger)filterType;

+ (NSDateFormatter *)dateFormatter;

@end
