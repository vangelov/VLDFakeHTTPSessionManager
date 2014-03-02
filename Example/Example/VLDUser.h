//
//  VLDUser.h
//  Example
//
//  Created by Vladimir Angelov on 3/2/14.
//  Copyright (c) 2014 Vladimir Angelov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VLDUser : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

- (id) initWithDictionary: (NSDictionary *) dictionary;

+ (NSArray *) usersForDictionaries: (NSArray *) dictionaries;

@end
