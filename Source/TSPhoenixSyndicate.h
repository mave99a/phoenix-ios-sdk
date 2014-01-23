//
//  TSPhoenixSyndicate.h
//  fuse
//
//  Created by Steve on 19/4/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

/**
 
 Phoenix Syndicate object.
 
 Provides high-level APIs to load sections and articles from Phoenix, send article interactions
 back to Phoenix, etc.
 
 Also abstracts Phoenix API response pagination via TSPaginator, so you can easily load thousands of articles
 without wrestling with URL paths.
 
 Paginators are short-lived in PhoenixSyndicate
 It is released as soon as a URL load succeeds / fails
 Consumers can hold on to it if it wants the next pagefull results
 Or call the master -loadArticleInSection:fromDate:toDate:pageIndex... method
 */

#import <Foundation/Foundation.h>
#import "TSPhoenixModuleAbastract.h"

@class TSPhoenixClient;
@class TSPaginator;

@class TSSection, TSArticle, TSArticleInteraction;

@class AFHTTPRequestOperation, AFHTTPRequestOperationManager;
@class YapDatabaseConnection;

@class TSCollection;

@interface TSPhoenixSyndicate : TSPhoenixModuleAbastract


@property (readonly) YapDatabaseConnection *readOnlyConnection;

@end
