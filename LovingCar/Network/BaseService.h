//
//  BaseService.h
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseService : NSObject
/**
 @abstract Block的异步网络请求
 @param functionName 方法的名称.
 @param parameter 请求参数.
 @param finishBlock 请求完成后的Block.
 @param failedBlock 请求失败后的Block.
 **/
- (void)sendAsynchronousRequestWithFunctionName:(NSString *)functionName Parameter:(NSDictionary *)parameter FinishCallBackBlock:(void(^)(id object))finishBlock FialedCallBackBlock:(void(^)(NSString *errorMsg))failedBlock;
/**
 @abstract Block的同步网络请求
 @param functionName 方法的名称.
 @param parameter 请求参数.
 @param finishBlock 请求完成后的Block.
 @param failedBlock 请求失败后的Block.
 **/
- (void)sendSynchronousRequestWithFunctionName:(NSString *)functionName Parameter:(NSDictionary *)parameter FinishCallBackBlock:(void(^)(id object))finishBlock FialedCallBackBlock:(void(^)(NSString *errorMsg))failedBlock;
@end
