//
//  TouchIDHelper.m
//  LovingCar
//
//  Created by Jame on 15/8/14.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "TouchIDHelper.h"

@implementation TouchIDHelper
static TouchIDHelper *sharedTouchIDHelper;
+ (TouchIDHelper *)sharedTouchIDHelper
{
    @synchronized(self) {
        if (!sharedTouchIDHelper) {
            sharedTouchIDHelper = [[self alloc] init];
            
        }
    }
    return sharedTouchIDHelper;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (!sharedTouchIDHelper) {
            sharedTouchIDHelper = [super allocWithZone:zone];
            
        }
    }
    return sharedTouchIDHelper;
}

- (instancetype)init
{
    @synchronized(self){
        self = [super init];
        if (self) {
            
        }
        return self;
    }
}

- (void)authenticateUserWithTitle:(NSString *)title CanEvaluate:(void (^)(BOOL success,NSError *error))canEvaluateBlock
                      CanNotEvaluate:(void (^)(NSError *error))canNotEvaluateBlock
{
    LAContext *context = [LAContext new];
    context.maxBiometryFailures = @3;
    context.localizedFallbackTitle = @"重新登录";
    NSError *canEvaluateError;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&canEvaluateError])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:title reply:^(BOOL success, NSError *evaluateError) {
            if (canEvaluateBlock) {
                canEvaluateBlock(success,evaluateError);
            }
        }];
    } else {
        if (canNotEvaluateBlock) {
            canNotEvaluateBlock(canEvaluateError);
        }
    }
}
@end
