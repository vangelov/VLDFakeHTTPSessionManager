//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Vladimir Angelov on 2/23/14.
//  Copyright (c) 2014 Vladimir Angelov. All rights reserved.
//

#import "VLDUserService.h"
#import "VLDFakeHTTPSessionManager.h"
#import <XCTest/XCTest.h>

@interface ExampleTests : XCTestCase

@property (strong, nonatomic) VLDFakeHTTPSessionManager *fakeHttpSessionManager;
@property (strong, nonatomic) VLDUserService *userService;

@end

@implementation ExampleTests

- (void) setUp {
    [super setUp];
    
    self.fakeHttpSessionManager = [[VLDFakeHTTPSessionManager alloc] init];
    
    self.userService = [[VLDUserService alloc] init];
    self.userService.httpSessionManager = self.fakeHttpSessionManager;
}

- (void) tearDown {
    [super tearDown];
}

- (void) testLoadingUsersSuccess {
    [self.fakeHttpSessionManager useJSONResponseFromFile: @"users"];
    
    __block NSArray *loadedUsers = nil;
    NSArray *userDictionaries = self.fakeHttpSessionManager.responseObject;
   
    [self.userService loadUsersWithCompletionBlock: ^(NSArray *users, NSError *error) {
        loadedUsers = users;
    }];
    
    XCTAssertNotNil(loadedUsers);
    XCTAssertEqual(loadedUsers.count, userDictionaries.count);
    XCTAssertEqualObjects([loadedUsers valueForKey: @"name"], [userDictionaries valueForKey: @"name"]);
}

- (void) testLoadingUsersFailure {
    __block NSError *responseError = nil;

    self.fakeHttpSessionManager.error = [NSError errorWithDomain: @"Test" code: 0 userInfo: nil];
    
    [self.userService loadUsersWithCompletionBlock: ^(NSArray *users, NSError *error) {
        responseError = error;
    }];
    
    XCTAssertNotNil(responseError);
    XCTAssertEqualObjects(responseError, self.fakeHttpSessionManager.error);
}

@end
