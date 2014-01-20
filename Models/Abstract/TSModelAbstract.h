//
//  TSModelAbstract.h
//  TSPhoenix
//
//  Created by Steve on 28/10/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSModelAbstract : NSObject <NSCoding, NSCopying>

- (id)initWithDictionary: (NSDictionary *)dict;

- (NSString *)dbKey;

+ (NSString *)dbKeyWithID: (NSNumber *)identifier;

- (NSString *)dbCollection;

+ (NSString *)dbCollection;

+ (NSDictionary *)mappingDictionary;

@end
