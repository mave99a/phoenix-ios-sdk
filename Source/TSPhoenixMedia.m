//
//  TSPhoenixMedia.m
//  TSPhoenix
//
//  Created by Steve on 31/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import "TSPhoenixMedia.h"
#import "TSPaginator.h"
#import "TSPhoenix.h"

@interface TSPhoenixMedia()

@property (strong) NSMutableSet *paginators;

@end

@implementation TSPhoenixMedia

- (id)initWithPhoenixClient: (TSPhoenixClient *)client {
    self = [super initWithPhoenixClient:client];
    
    self.paginators = [NSMutableSet new];
    
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
    [self.paginators removeAllObjects];


}



@end
