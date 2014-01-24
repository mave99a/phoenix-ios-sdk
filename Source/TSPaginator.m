//
//  TSPaginator.m
//  TSPhoenix
//
//  Created by Steve on 19/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//
//  Inspired by RKPaginator, credit goes to Blake Watters (https://github.com/blakewatters‎) for creating the awesome RestKit!

#import "TSPaginator.h"
#import "TSPhoenix.h"

static NSUInteger TSPaginatorDefaultPerPage = 100;

@interface TSPaginator()

@property (nonatomic, readonly) AFHTTPRequestOperationManager *client;


@property (nonatomic, copy) NSString *pathPattern;

/**
 Sets the completion block to be invoked when the paginator finishes loading a page of results.
 
 @param success A block to be executed upon a successful load of a page of objects. The block has no return value and takes three arguments: the paginator object, an array containing the paginated objects, and an integer indicating the page that was loaded.
 @param failure A block to be exected upon a failed load. The block has no return value and takes two arguments: the paginator object and an error indicating the nature of the failure.
 */
- (void)setCompletionBlockWithSuccess:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
                              failure:(void (^)(TSPaginator *paginator, NSError *error))failure;

@end

@implementation TSPaginator

- (id)initWithRequestPatternPath: (NSString *)patternPath
                      httpClient: (AFHTTPRequestOperationManager *)client{
    self = [super init];
    
    if (self) {
     
        NSParameterAssert(patternPath);
        NSParameterAssert(client);
        
        _pathPattern = patternPath;
        _client = client;

        _currentPage = NSNotFound;
        _pageCount = 0;
        _objectCount = 0;
        _perPage = TSPaginatorDefaultPerPage;
        _loadedPages = [NSMutableSet set];
        _isMetadataLoaded = NO;
        _zeroIndexed = NO;
        
        // Phoenix defaults
        // Since we're shipping paginator in Phoenix SDK
        // Give it sensible defaults
        _dataArrayKeyPath = @"Data";
        _objectCountKeyPathInResponse = @"TotalRecords";
        _zeroIndexed = YES;
    }
    
    return self;
}

- (void)dealloc
{
    [self.requestOperation cancel];
}

- (NSURL *)URL
{
    return self.requestOperation.request.URL;
}

- (void)setCompletionBlockWithSuccess:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
                              failure:(void (^)(TSPaginator *paginator, NSError *error))failure
{
    self.successBlock = success;
    self.failureBlock = failure;
}

- (BOOL)hasNextPage
{
    NSAssert(self.isMetadataLoaded, @"Cannot determine hasNextPage: page count is not known.");
    
    if (self.isZeroIndexed)
        return self.currentPage + 1 < self.pageCount;
    
    return self.currentPage < self.pageCount;
}

- (BOOL)hasPreviousPage
{
    NSAssert(self.isMetadataLoaded, @"Cannot determine hasPreviousPage: paginator is not loaded.");
    if (self.isZeroIndexed)
        return self.currentPage > 0;
    
    return self.currentPage > 1;
}

#pragma mark - Action methods

- (void)loadNextPageWithSuccess:(void (^)(TSPaginator *, NSArray *, NSUInteger))success
                        failure:(void (^)(TSPaginator *, NSError *))failure
{
    [self loadPage:self.currentPage + 1
           success:success
           failure:failure];
}

- (void)loadPreviousPageWithSuccess:(void (^)(TSPaginator *, NSArray *, NSUInteger))success
                            failure:(void (^)(TSPaginator *, NSError *))failure
{
    [self loadPage:self.currentPage - 1
           success:success
           failure:failure];
}

- (void)loadPage:(NSUInteger)pageNumber
         success:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
         failure:(void (^)(TSPaginator *paginator, NSError *error))failure {
    
    [self setCompletionBlockWithSuccess:success
                                failure:failure];
    
    _currentPage = pageNumber;

    NSString *path = [self.pathPattern stringByReplacingOccurrencesOfString:@":currentPage"
                                                                 withString:[@(self.currentPage) stringValue]];
    
    path = [path stringByReplacingOccurrencesOfString:@":perPage"
                                           withString:[@(self.perPage) stringValue]];
    
    NSError *error;
    NSURLRequest *request = [self.client.requestSerializer requestWithMethod:@"GET"
                                                                   URLString:[[NSURL URLWithString:path
                                                                                    relativeToURL:self.client.baseURL] absoluteString]
                                                                  parameters:nil
                             error:&error];
    
    if (error) {
        NSLog(@"Request serializer error: %@", error);
    }
    
    AFHTTPRequestOperation *op = [self.client HTTPRequestOperationWithRequest:request
                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {

//                                                                          NSAssert([operation isKindOfClass:[AFJSONRequestOperation class]], @"Only JSON request is implemented");
                                                                          
//                                                                          AFJSONRequestOperation *jsonOp = (id)operation;
                                                                          NSDictionary *responseDictionary = responseObject;
                                                                          
                                                                          // Implement "empty response" error handling in the future
                                                                          NSParameterAssert(responseDictionary);
                                                                          
                                                                          if (!self.isMetadataLoaded) {
                                                                              if (self.pageCountKeyPathInResponse && [responseDictionary valueForKey:self.pageCountKeyPathInResponse])
                                                                                  _pageCount = [[responseDictionary valueForKey:self.pageCountKeyPathInResponse] integerValue];
                                                                              
                                                                              if (self.objectCountKeyPathInResponse && [responseDictionary valueForKey:self.objectCountKeyPathInResponse])
                                                                                  _objectCount = [[responseDictionary valueForKey:self.objectCountKeyPathInResponse] integerValue];

                                                                              // Object count takes priority
                                                                              if (self.objectCount > 0) {
                                                                                  // Round up divide
                                                                                  _pageCount = (self.objectCount + self.perPage - 1) / self.perPage;
                                                                              }
                                                                              
                                                                              _isMetadataLoaded = YES;
                                                                          }
                                                                          

                                                                          
                                                                          NSArray *sourceObjects = responseDictionary[self.dataArrayKeyPath];
                                                                          NSArray *destinationObjects;
                                                                          
                                                                          if (sourceObjects.count) {
                                                                              destinationObjects = self.objectMappingBlock(sourceObjects);
                                                                          }
                                                                          
                                                                          [self.loadedPages addObject:@(self.currentPage)];
                                                                          
                                                                          TS_BLOCK_SAFE_RUN(self.successBlock, self, destinationObjects, self.currentPage);
                                                                          
                                                                          
                                                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                          _error = error;
                                                                          
                                                                          TS_BLOCK_SAFE_RUN(self.failureBlock, self, error);
                                                                      }];
    [self.client.operationQueue addOperation:op];
    
    _requestOperation = op;

}

- (void)loadFirstPageWithSuccess:(void (^)(TSPaginator *paginator, NSArray *objects, NSUInteger page))success
                         failure:(void (^)(TSPaginator *paginator, NSError *error))failure {
    if (self.isZeroIndexed)
        [self loadPage:0
         success:success
               failure:failure];
    else
        [self loadPage:1
               success:success
               failure:failure];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"TSPaginator: pattern %@ URL %@", self.pathPattern, self.URL];
}

- (void)cancel
{
    [self.requestOperation cancel];
    
    // TODO: supply an NSError indicating the op is cancelled
    TS_BLOCK_SAFE_RUN(self.failureBlock, self, nil);
}


@end
