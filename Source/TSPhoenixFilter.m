//
//  TSPhoenixFilter.m
//  TSPhoenix
//
//  Created by Steve on 22/11/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSPhoenixFilter.h"

@interface TSPhoenixFilter() {
    NSDateFormatter *_dateFormatter;
}


// Private
+ (id)sharedInstance;

@property (readonly) NSDateFormatter *dateFormatter;


@end

@implementation TSPhoenixFilter

// Flatten an array of filters into a URL paramter string
+ (NSString *)filterStringFromFilters: (NSArray *)array {
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendString:@"filter="];
    NSString *filtersString = [array componentsJoinedByString:@"+and+"];
    [string appendString:filtersString];
    
    // Character escape is the responsibility of TSPhoenixParamter
    
    return [string copy];
}


+ (NSString *)filterWithName: (NSString *)name
                       value: (NSString *)value
                        type: (PhoenixFilterOperands)type {
    NSParameterAssert(name);
    NSParameterAssert(value);
    
    NSString *operand = kOperandStringValues[type];
    
    NSString *string = [NSString stringWithFormat:@"%@+%@+'%@'", name , operand, value];

    // Workaround for escaping ":"
    string= [string stringByReplacingOccurrencesOfString:@":" withString:@"%3A"];

    return string;
}

+ (NSString *)name: (NSString *)name
             value: (NSString *)value
              type: (PhoenixFilterOperands)type {
    return [self filterWithName:name
                          value:value
                           type:type];
}

+ (NSString *)dateFilterWithName: (NSString *)name
                            date: (NSDate *)date
                            type: (NSInteger)filterType {
    NSParameterAssert(date);
    
    NSDateFormatter *formatter = [[self sharedInstance] dateFormatter];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSString *dateString = [formatter stringFromDate:date];

    return [self filterWithName:name
                          value:dateString
                           type:filterType];
}

#pragma mark -

+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^ { sharedManager = [[self alloc] init]; });
    return sharedManager;
}

// Date formatter is expensive
// Cache it for max performance
- (NSDateFormatter *)dateFormatter {
    if (_dateFormatter) return _dateFormatter;
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:@"YYYY-MM-dd+HH:mm:ss"];
    
    return _dateFormatter;
}

+ (NSDateFormatter *)dateFormatter {
    return [[self sharedInstance] dateFormatter];
}

@end
