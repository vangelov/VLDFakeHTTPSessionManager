//
//  VLDUserService.m
//  Example
//
//  Created by Vladimir Angelov on 3/2/14.
//  Copyright (c) 2014 Vladimir Angelov. All rights reserved.
//

#import "VLDUserService.h"
#import "VLDUser.h"
#import "AFHTTPSessionManager.h"

@implementation VLDUserService

- (void) loadUsersWithCompletionBlock: (void (^)(NSArray *users, NSError *error)) completionBlock {
    [self.httpSessionManager GET: @"users.json"
                      parameters: nil
                         success: ^(NSURLSessionDataTask *task, id responseObject) {
                             NSArray *users = [VLDUser usersForDictionaries: responseObject];
                             
                             if(completionBlock) {
                                 completionBlock(users, nil);
                             }
                         }
                         failure: ^(NSURLSessionDataTask *task, NSError *error) {
                             if(completionBlock) {
                                 completionBlock(nil, error);
                             }
                         }];
}

@end
