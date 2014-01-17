//
//  TSPhoenix.h
//  fuse
//
//  Created by Steve on 19/4/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#ifndef TSPhoenix_h
#define TSPhoenix_h

/**
 Header file to be imported by SDK user.
 */

#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>

#import <YapDatabase/YapDatabase.h>

// Singleton entrance to Phoenix
// [TSPhoenixClient sharedInstance]
#import "TSPhoenixClient.h"

// Modules
#import "TSPhoenixSyndicate.h"
#import "TSPhoenixIdentity.h"
#import "TSPhoenixMedia.h"
#import "TSPhoenixMessaging.h"
#import "TSPhoenixAnalytics.h"

#import "TSPhoenixModels.h"


// Helpers
#import "TSPaginator.h"
#import "TSPhoenixFilter.h"
#import "TSPhoenixParameter.h"

// Categories
#import "NSObject+DictionaryRepresentation.h"
#import "NSArray+Mapping.h"

// Check a block is not nil before running it
#define TS_BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil

#endif
