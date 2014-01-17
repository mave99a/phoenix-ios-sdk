//
//  TSPhoenixModuleAbastract.h
//  TSPhoenix
//
//  Created by Steve on 15/1/14.
//  Copyright (c) 2014 Tigerspike. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSPhoenixClient;

@interface TSPhoenixModuleAbastract : NSObject

- (id)initWithPhoenixClient: (TSPhoenixClient *)client;

@property (weak) TSPhoenixClient *client;

@end
