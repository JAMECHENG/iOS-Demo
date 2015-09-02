//
//  UserService.m
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "UserService.h"

@implementation UserService
- (void)loginWithParameter:(NSMutableDictionary *)parameter SuccessBlock:(void (^)(id object))successBlock FailedBlock:(void (^)(NSString *errorMsg))failedBlock{
    [self sendAsynchronousRequestWithFunctionName:@"login.html" Parameter:parameter FinishCallBackBlock:^(id object) {
        if (successBlock) {
            successBlock(object);
        }
    } FialedCallBackBlock:^(NSString *errorMsg) {
        if (failedBlock) {
            failedBlock(errorMsg);
        }
    }];
}
@end
