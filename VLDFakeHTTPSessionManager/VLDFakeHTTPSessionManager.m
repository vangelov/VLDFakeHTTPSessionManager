//
//  KGMockHTTPSessionManager.m
//  Kate's Good
//
//  Created by Vladimir Angelov on 1/27/14.
//  Copyright (c) 2014 Despark. All rights reserved.
//

#import "VLDFakeHTTPSessionManager.h"

@implementation VLDFakeHTTPSessionManager

- (NSURLSessionDataTask *) dataTaskWithRequest: (NSURLRequest *)request
                             completionHandler: (void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    
    NSURLSessionDataTask *task = [super dataTaskWithRequest: request completionHandler: completionHandler];
    
    // Uses NSSelectorFromString to avoid 'Undeclared selector ...' warning
    SEL delegateForTaskSelector = NSSelectorFromString(@"delegateForTask:");
    
    // Uses the IMP pointer to avoid 'performSelector may cause leak ...' warning
    IMP methodIMP = [self methodForSelector: delegateForTaskSelector];
    id (*method)(id, SEL, NSURLSessionTask *) = (void *) methodIMP;
    id delegate = method(self, delegateForTaskSelector, task);
    
    void (^delegateCompletionHandler)(NSURLResponse *response, id responseObject, NSError *error) = [delegate performSelector: @selector(completionHandler)];
        
    delegateCompletionHandler(nil, self.responseObject, self.error);
    
    return task;
}

- (void) useJSONResponseFromFile: (NSString *) file {
    NSURL *url = [[NSBundle bundleForClass: self.class] URLForResource: file
                                                         withExtension: @"json"];
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &error];
    
    if(!jsonObject) {
        NSLog(@"Error when parsing test file: %@: %@", file, error);
    }
    
    self.responseObject = jsonObject;
}


@end
