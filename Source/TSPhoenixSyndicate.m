//
//  TSPhoenixSyndicate.m
//  fuse
//
//  Created by Steve on 19/4/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSPhoenixSyndicate.h"
#import "TSPhoenix.h"
#import "TSPaginator.h"


@interface TSPhoenixSyndicate()

@end

@implementation TSPhoenixSyndicate

- (id)initWithPhoenixClient: (TSPhoenixClient *)client {
    self = [super initWithPhoenixClient:client];
    
    _readOnlyConnection = [client.database newConnection];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(userDidLogout)
                                                 name:kPhoenixIdentityDidLogoutNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(userDidLogin)
                                                 name:kPhoenixIdentityDidLoginNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidResume)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];

    
    
    return self;
}



#pragma mark - Notifications

- (void)appDidResume {
}

- (void)userDidLogin {
}

- (void)userDidLogout {

}

@end
