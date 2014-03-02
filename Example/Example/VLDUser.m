//
//  VLDUser.m
//  Example
//
//  Created by Vladimir Angelov on 3/2/14.
//  Copyright (c) 2014 Vladimir Angelov. All rights reserved.
//

#import "VLDUser.h"

@implementation VLDUser

+ (NSArray *) usersForDictionaries: (NSArray *) dictionaries {
    NSMutableArray *users = [NSMutableArray array];
    
    for(NSDictionary *dictionary in dictionaries) {
        VLDUser *user = [[VLDUser alloc] initWithDictionary: dictionary];
        [users addObject: user];
    }
    
    return users;
    
}

- (id) init {
    return [self initWithDictionary: nil];
}

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if(self) {
        _name = dictionary[@"name"];
        _age = [dictionary[@"age"] integerValue];
    }
    
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat: @"%@, %d", self.name, self.age];
}

@end
