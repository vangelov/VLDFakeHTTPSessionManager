//
//  AppDelegate.m
//  Example
//
//  Created by Vladimir Angelov on 2/23/14.
//  Copyright (c) 2014 Vladimir Angelov. All rights reserved.
//

#import "AppDelegate.h"
#import "VLDUserService.h"
#import "AFHTTPSessionManager.h"
#import "VLDFakeHTTPSessionManager.h"

@implementation AppDelegate

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSLog(@"HERE");
    
    [self initUserService];
    [self loadUsers];
    
    return YES;
}

- (void) initUserService {
    NSURL *url = [NSURL URLWithString: @"http://dl.dropboxusercontent.com/u/25695112"];
    
    AFHTTPSessionManager *httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL: url];
    httpSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"text/plain", @"application/json", nil]; // 'text/plain' is added because of dropbox
    
    self.userService = [[VLDUserService alloc] init];
    self.userService.httpSessionManager = httpSessionManager;
}

- (void) loadUsers {
    [self.userService loadUsersWithCompletionBlock: ^(NSArray *users, NSError *error) {
        if(!error) {
            NSLog(@"Users:\n %@", users);
        }
        else {
            NSLog(@"Loading error: %@", error);
        }
    }];
}

@end
