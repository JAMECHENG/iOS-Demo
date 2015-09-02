//
//  CarModel.m
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel
@synthesize carName,carId,userId;
- (instancetype)init{
    self = [super init];
    if (self) {
        self.carId= @"";
        self.carName = @"";
        self.userId = @"";
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"carId"];
    }
}

- (void)setNilValueForKey:(NSString *)key{
    if ([key isEqualToString:@"carId"]) {
        self.carId = @"";
    }
}

- (instancetype)copyWithZone:(NSZone *)zone{
    CarModel *copy = [[[self class]allocWithZone:zone]init];
    copy.carId = self.carId;
    copy.carName = self.carName;
    copy.userId = self.userId;
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [super encodeWithCoder:coder];
    [coder encodeObject:carId forKey:@"carId"];
    [coder encodeObject:carName forKey:@"carName"];
    [coder encodeObject:userId forKey:@"userId"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.carName = [aDecoder decodeObjectForKey:@"carName"];
        self.carId = [aDecoder decodeObjectForKey:@"carId"];
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
    }
    return (self);
}
@end
