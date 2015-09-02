//
//  UserModel.m
//  ModelHelper
//
//  Created by Jame on 15/5/14.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
@synthesize userName,userId;
- (instancetype)init{
    self = [super init];
    if (self) {
        self.userId = @"";
        self.userName = @"";
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"userId"];
    }
}

- (void)setNilValueForKey:(NSString *)key{
    if ([key isEqualToString:@"userId"]) {
        self.userId = @"";
    }
}

- (id)copyWithZone:(NSZone *)zone{
    UserModel *copy = [[[self class]allocWithZone:zone]init];
    copy.userId = self.userId;
    copy.userName = self.userName;
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [super encodeWithCoder:coder];
    [coder encodeObject:userId forKey:@"userId"];
    [coder encodeObject:userName forKey:@"userName"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
    }
    return (self);
}

@end