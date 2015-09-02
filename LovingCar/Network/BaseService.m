//
//  BaseService.m
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseService.h"
#import "NetworkHelper.h"
@implementation BaseService
- (void)sendAsynchronousRequestWithFunctionName:(NSString *)functionName Parameter:(NSDictionary *)parameter FinishCallBackBlock:(void(^)(id object))finishBlock FialedCallBackBlock:(void(^)(NSString *errorMsg))failedBlock{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *functionURL = [NSURL URLWithString:[NetworkHelper getWholeURLWithFunctionName:functionName]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:functionURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"text/plain,text/jplain" forHTTPHeaderField:@"Accept"];
    NSMutableData *postBody = [NSMutableData data];
    NSArray *keysArray = [parameter allKeys];
    NSInteger fieldCount = [keysArray count];
    for (int i = 0; i < fieldCount; i++) {
        NSString *key = [keysArray objectAtIndex:i];
        NSString *value = [parameter objectForKey:key];
        if([value isKindOfClass:[NSString class]]){
            value = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        if ([key isKindOfClass:[NSString class]]) {
            key = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        if (i==0)
        {
            [postBody appendData:[[NSString stringWithFormat:@"%@=%@", key, value]
                                  dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else
        {
            [postBody appendData:[[NSString stringWithFormat:@"&%@=%@", key, value]
                                  dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    [request setHTTPBody:postBody];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (!connectionError&&[(NSHTTPURLResponse *)response statusCode] == 200) {
            NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *responseDic = [NetworkHelper getResponseWithJsonString:responseStr];
            if (finishBlock&&responseDic) {
                NSInteger responseCode = [[responseDic objectForKey:@"c"] integerValue];
                if (responseCode == 100) {
                    finishBlock(responseDic);
                } else if (responseCode == 400){
                    NSNotification *notification = [NSNotification notificationWithName:NOTIFICATION_SESSION_TIME_OUT object:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                } else {
                    NSString *message = [responseDic objectForKey:@"m"];
                    if (failedBlock) {
                        failedBlock(message);
                    }
                }
            } else {
                ULog(@"请求路径不存在");
            }
        } else {
            if (failedBlock) {
                NSString *message = [connectionError.userInfo objectForKey:@"NSLocalizedDescription"];
                failedBlock(message);
            }
        }
    }];
}

- (void)sendSynchronousRequestWithFunctionName:(NSString *)functionName Parameter:(NSDictionary *)parameter FinishCallBackBlock:(void(^)(id object))finishBlock FialedCallBackBlock:(void(^)(NSString *errorMsg))failedBlock{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *functionURL = [NSURL URLWithString:[NetworkHelper getWholeURLWithFunctionName:functionName]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:functionURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"text/plain,text/jplain" forHTTPHeaderField:@"Accept"];
    NSMutableData *postBody = [NSMutableData data];
    NSArray *keysArray = [parameter allKeys];
    NSInteger fieldCount = [keysArray count];
    for (int i = 0; i < fieldCount; i++) {
        NSString *key = [keysArray objectAtIndex:i];
        NSString *value = [parameter objectForKey:key];
        if([value isKindOfClass:[NSString class]]){
            value = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        if ([key isKindOfClass:[NSString class]]) {
            key = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        if (i==0)
        {
            [postBody appendData:[[NSString stringWithFormat:@"%@=%@", key, value]
                                  dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else
        {
            [postBody appendData:[[NSString stringWithFormat:@"&%@=%@", key, value]
                                  dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    [request setHTTPBody:postBody];
    NSURLResponse *response;
    NSError *connectionError;
    NSData *repsonseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&connectionError];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    if (!connectionError&&[(NSHTTPURLResponse *)response statusCode] == 200) {
        NSString *responseStr = [[NSString alloc] initWithData:repsonseData encoding:NSUTF8StringEncoding];
        NSDictionary *responseDic = [NetworkHelper getResponseWithJsonString:responseStr];
        if (finishBlock&&responseDic) {
            NSInteger responseCode = [[responseDic objectForKey:@"c"] integerValue];
            if (responseCode == 100) {
                finishBlock(responseDic);
            } else if (responseCode == 400){
                NSNotification *notification = [NSNotification notificationWithName:NOTIFICATION_SESSION_TIME_OUT object:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            } else {
                NSString *message = [responseDic objectForKey:@"m"];
                if (failedBlock) {
                    failedBlock(message);
                }
            }
        } else {
            ULog(@"请求路径不存在");
        }
    } else {
        if (failedBlock) {
            NSString *message = [connectionError.userInfo objectForKey:@"NSLocalizedDescription"];
            failedBlock(message);
        }
    }
}
@end
