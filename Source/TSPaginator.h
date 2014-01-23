//
//  TSPaginator.h
//  TSPhoenix
//
//  Created by Steve on 19/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//
//  Inspired by RKPaginator, credit goes to Blake Watters (https://github.com/blakewatters‎) for creating the awesome RestKit!
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

/**
 
 TSPaginator
 
 Abstract Phoenix API paginated requests
 
 Designed to work with MagicalRecord / Core Data.
 
 Importing from JSON to NSManagedObject is handled using MagicalRecord's import mechanism.
   For more info: http://www.cimgf.com/2012/05/29/importing-data-made-easy/
 
 Usage:
 
    TSPaginator *paginator = [[TSPaginator alloc] initWithRequestPatternPath:pathPattern
                                                                  httpClient:self.client];
    
    paginator.dataArrayKeyPath = @"Data";
    paginator.objectCountKeyPathInResponse = @"TotalRecords";
    paginator.zeroIndexed = YES;
    [paginator setObjectMappingBlock:^NSArray *(NSArray *sourceObjects) {
        __block NSArray *destinationObjects;
        
        destinationObjects = [TSArticle MR_importFromArray:sourceObjects];
        
        return destinationObjects;
    }];
    paginator.perPage = kPhoenixResponsePageSize;
    
    [self.paginators addObject:paginator];
    
    [paginator setCompletionBlockWithSuccess:failure:];
    [paginator loadPage:0];
 
 */



@interface TSPaginator : NSObject

/**
 Dedicated initializer

 @param patternPath a URL template
 @param client an instance of TSPhoenixClient
 
 */
- (id)initWithRequestPatternPath: (NSString *)patternPath
                      httpClient: (AFHTTPRequestOperationManager *)client;


/**
 The current / last URL load operation.
 */
@property (nonatomic, readonly) AFHTTPRequestOperation *requestOperation;

/**
 The error, if any, that occured during the last load of the paginator.
 */
@property (nonatomic, strong, readonly) NSError *error;


@property (nonatomic, copy) void (^successBlock)(TSPaginator *paginator, NSArray *objects, NSUInteger page);
@property (nonatomic, copy) void (^failureBlock)(TSPaginator *paginator, NSError *error);


///------------------------------------
/// @name Importing objects with Magical Records
///------------------------------------

// response: {'data': [array of data]}
// here "data" is the key path
@property (copy) NSString *dataArrayKeyPath;

// Any better way to do this?
@property (copy) NSArray *(^objectMappingBlock)(NSArray *sourceArray);


///------------------------------------
/// @name Accessing Pagination Metadata
///------------------------------------

/**
 Initial page loaded?
 If it's loaded, we know the number of pages, total object count etc.
 */
@property (assign, readonly) BOOL isMetadataLoaded;


@property (copy) NSString *pageCountKeyPathInResponse;
@property (copy) NSString *objectCountKeyPathInResponse;

@property (assign, getter = isZeroIndexed) BOOL zeroIndexed;

/**
 The number of objects to load per page
 */
@property (nonatomic, assign) NSUInteger perPage;

/**
 Returns the page number for the most recently loaded page of objects.
 
 @return The page number for the current page of objects.
 @exception NSInternalInconsistencyException Raised if `isLoaded` is equal to `NO`.
 */
@property (nonatomic, readonly) NSUInteger currentPage;

/**
 A set of NSNumbers to keep track of pages that were loaded successfully
 */
@property (nonatomic, readonly) NSMutableSet *loadedPages;

/**
 Returns the offset based off the page for the most recently loaded objects.
 
 @return The offset for the current page of objects.
 @exception NSInternalInconsistencyException Raised if `isLoaded` is equal to `NO`.
 */
@property (nonatomic, readonly) NSUInteger offset;

/**
 Returns the number of pages in the total resource collection.
 
 @return A count of the number of pages in the resource collection.
 @exception NSInternalInconsistencyException Raised if `hasPageCount` is `NO`.
 */
@property (nonatomic, readonly) NSUInteger pageCount;

/**
 Returns the total number of objects in the collection
 
 @return A count of the number of objects in the resource collection.
 @exception NSInternalInconsistencyException Raised if `hasObjectCount` is `NO`.
 */
@property (nonatomic, readonly) NSUInteger objectCount;

/**
 Returns a Boolean value indicating if there is a next page in the collection.
 
 @return `YES` if there is a next page, otherwise `NO`.
 @exception NSInternalInconsistencyException Raised if isLoaded or hasPageCount is `NO`.
 */

- (BOOL)hasNextPage;

/**
 Returns a Boolean value indicating if there is a previous page in the collection.
 
 @return `YES` if there is a previous page, otherwise `NO`.
 @exception NSInternalInconsistencyException Raised if isLoaded is `NO`.
 */
- (BOOL)hasPreviousPage;

///------------------------
/// @name Paginator Actions
///------------------------

/**
 Loads the next page of data by incrementing the current page, constructing an object loader to fetch the data, and object mapping the results.
 */
- (void)loadNextPageWithSuccess:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
                        failure:(void (^)(TSPaginator *paginator, NSError *error))failure;

/**
 Loads the previous page of data by decrementing the current page, constructing an object loader to fetch the data, and object mapping the results.
 */
- (void)loadPreviousPageWithSuccess:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
                            failure:(void (^)(TSPaginator *paginator, NSError *error))failure;

/**
 Loads the fist page of data
 */
- (void)loadFirstPageWithSuccess:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
                         failure:(void (^)(TSPaginator *paginator, NSError *error))failure;

/**
 Loads a specific page of data by mutating the current page, constructing an object loader to fetch the data, and object mapping the results.
 
 @param pageNumber The page of objects to load from the remote backend
 */
- (void)loadPage:(NSUInteger)pageNumber
         success:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
         failure:(void (^)(TSPaginator *paginator, NSError *error))failure;


/**
 Cancels an in-progress pagination request.
 */
- (void)cancel;





/**
 A dictionary to hold context information, such as how the URL pattern is constructed.
 */
@property (strong) NSDictionary *userInfo;

@end
