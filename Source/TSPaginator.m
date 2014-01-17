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
#import <SOCKit/SOCKit.h>

static NSUInteger TSPaginatorDefaultPerPage = 100;

@interface TSPaginator()

@property (nonatomic, readonly) AFHTTPClient *client;


@property (nonatomic, readonly) SOCPattern *pattern;

@end

@implementation TSPaginator

- (id)initWithRequestPatternPath: (NSString *)patternPath
                      httpClient: (AFHTTPClient *)client{
    self = [super init];
    
    if (self) {
     
        NSParameterAssert(patternPath);
        NSParameterAssert(client);
        
        _pattern = [SOCPattern patternWithString:patternPath];
        _client = client;

        _currentPage = NSNotFound;
        _pageCount = 0;
        _objectCount = 0;
        _perPage = TSPaginatorDefaultPerPage;
        _loadedPages = [NSMutableSet set];
        _isMetadataLoaded = NO;
        _zeroIndexed = NO;
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

- (void)loadNextPage
{
    [self loadPage:self.currentPage + 1];
}

- (void)loadPreviousPage
{
    [self loadPage:self.currentPage - 1];
}

- (void)loadPage:(NSUInteger)pageNumber {
    
    _currentPage = pageNumber;

    NSString *path = [self.pattern stringFromObject:self];
    
    NSURLRequest *request = [self.client requestWithMethod:@"GET"
                                                      path:path
                                                parameters:nil];
    
    AFHTTPRequestOperation *op = [self.client HTTPRequestOperationWithRequest:request
                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                                                          NSAssert([operation isKindOfClass:[AFJSONRequestOperation class]], @"Only JSON request is implemented");
                                                                          
                                                                          AFJSONRequestOperation *jsonOp = (id)operation;
                                                                          NSDictionary *responseDictionary = jsonOp.responseJSON;
                                                                          
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
    [self.client enqueueHTTPRequestOperation:op];
    
    _requestOperation = op;

}

- (void)loadFirstPage {
    if (self.isZeroIndexed)
        [self loadPage:0];
    else
        [self loadPage:1];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"TSPaginator: pattern %@ URL %@", self.pattern, self.URL];
}

- (void)cancel
{
    [self.requestOperation cancel];
    
    // TODO: supply an NSError indicating the op is cancelled
    TS_BLOCK_SAFE_RUN(self.failureBlock, self, nil);
}


@end
