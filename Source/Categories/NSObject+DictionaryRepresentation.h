//
//  NSObject+DictionaryRepresentation.h
//  TSPhoenix
//
//  Created by Steve on 22/7/13.
//  Copyright (c) 2013 Tigerspike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TSDictionaryRepresentation)

/**
 Turns an object into NSDictionary, for API requests
 */
- (NSDictionary *)dictionaryRepresentationWithMapping: (NSDictionary *)mapping;

@end
