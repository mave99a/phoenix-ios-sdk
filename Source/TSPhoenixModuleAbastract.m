//
//  TSPhoenixModuleAbastract.m
//  TSPhoenix
//
//  Created by Steve on 15/1/14.
//  Copyright (c) 2014 Tigerspike. All rights reserved.
//

#import "TSPhoenixModuleAbastract.h"
#import "TSPhoenixClient.h"

@implementation TSPhoenixModuleAbastract

- (id)initWithPhoenixClient: (TSPhoenixClient *)client {
    self = [self init];
    
    _client = client;
    
    
    return self;
}


@end
