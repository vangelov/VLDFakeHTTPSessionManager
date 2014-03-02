//
//  AppDelegate.h
//  Example
//
//  Created by Vladimir Angelov on 2/23/14.
//  Copyright (c) 2014 Vladimir Angelov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VLDUserService;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) VLDUserService *userService;

@end
