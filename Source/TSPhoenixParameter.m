//
//  TSPhoenixParameter.m
//  TSPhoenix
//
//  Created by Steve on 22/11/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSPhoenixParameter.h"
#import "TSPhoenixFilter.h"

@implementation TSPhoenixParameter

+ (NSString *)parameterWithName: (NSString *)name
                          value: (NSString *)value {
    NSString *string = [NSString stringWithFormat:@"%@=%@", name, value];
    
    return string;
}

+ (NSString *)name: (NSString *)name
             value: (NSString *)value {
    return [self parameterWithName:name
                             value:value];
}


+ (NSString *)sortDirectionAscendingParameter {
    return [self parameterWithName:@"sortdir"
                             value:@"asc"];
}

+ (NSString *)sortDirectionDescendingParameter {
    return [self parameterWithName:@"sortdir"
                             value:@"desc"];
}



#pragma mark - Parameters


+ (NSString *)sortByPublishDateParameter {
    return [self parameterWithName:@"sortby"
                             value:@"publishdate"];
}

+ (NSString *)sortByRankParameter {
    return [self parameterWithName:@"sortby"
                             value:@"rank"];
}

//+ (NSString *)expandArticleInteractionParameter {
//    return @"expand=articleinteractions";
//}

+ (NSString *)pageSizeTemplateParameter {
    return [self parameterWithName:@"pageSize" value:@":perPage"];
}

+ (NSString *)pageNumberTemplateParameter {
    return [self parameterWithName:@"pageNum" value:@":currentPage"];
}

//+ (NSString *)subscribedOnlyParameter {
//    return @"subscribedonly=true"; // Syndicate only
//}


+ (NSString *)parameterStringFromParameters: (NSArray *)parameters {
    NSMutableString *string = [[NSMutableString alloc] init];
    
    if (parameters.count) {
        [string appendString:@"?"];
        NSString *paramString = [parameters componentsJoinedByString:@"&"];
        [string appendString:paramString];
    }

    return [string copy];
}


+ (NSString *)parameterStringFromParameters: (NSArray *)parameters
                                  expansion: (NSArray *)expansion
                                    filters: (NSArray *)filters {
    NSMutableArray *allParameters = [NSMutableArray new];
    if (expansion) {
        [expansion enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [allParameters addObject:[TSPhoenixParameter parameterWithName:@"expand" value:obj]];
        }];
    }
    
    if (filters) {
        [allParameters addObject:[TSPhoenixFilter filterStringFromFilters:filters]];
    }
    
    if (parameters)
        [allParameters addObjectsFromArray:parameters];
    
    NSString *parameterString = @"";
    
    if (allParameters.count)
        parameterString = [TSPhoenixParameter parameterStringFromParameters:allParameters];
    
    return parameterString;
}


#pragma mark -

+ (NSString *)urlEncodeString:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    return result;
}



@end
