//
//  VLDUserService.h
//  Example
//
//  Created by Vladimir Angelov on 3/2/14.
//  Copyright (c) 2014 Vladimir Angelov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface VLDUserService : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *httpSessionManager;

- (void) loadUsersWithCompletionBlock: (void (^)(NSArray *users, NSError *error)) completionBlock;

@end
