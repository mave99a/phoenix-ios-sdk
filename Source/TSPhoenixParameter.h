//
//  TSPhoenixParameter.h
//  TSPhoenix
//
//  Created by Steve on 22/11/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSPhoenixParameter : NSObject


+ (NSString *)parameterWithName: (NSString *)name
                          value: (NSString *)value;

+ (NSString *)name: (NSString *)name
             value: (NSString *)value;

// Flatten array into URL parameter string
+ (NSString *)parameterStringFromParameters: (NSArray *)parameters;

+ (NSString *)parameterStringFromParameters: (NSArray *)parameters
                                  expansion: (NSArray *)expansion
                                    filters: (NSArray *)filters;



#pragma mark - Convenience Parameters

+ (NSString *)sortDirectionAscendingParameter;
+ (NSString *)sortDirectionDescendingParameter;

+ (NSString *)sortByPublishDateParameter;

+ (NSString *)sortByRankParameter;


+ (NSString *)pageSizeTemplateParameter;
+ (NSString *)pageNumberTemplateParameter;



#pragma mark - Helpers

+ (NSString *)urlEncodeString:(NSString *)str;

@end
