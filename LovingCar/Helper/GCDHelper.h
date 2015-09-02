//
//  GCDHelper.h
//  LovingCar
//
//  Created by Jame on 15/9/1.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDHelper : NSObject
/**
 @abstract 在主线程中执行Block中的方法且为异步方法不会闭塞主线程.
 **/
+ (void)runSelectorInMainQueue:(dispatch_block_t)block;
/**
 @abstract 在多线程中执行Block中的方法且为异步方法不会闭塞主线程.
 **/
+ (void)runSelectorInGlobalQueue:(dispatch_block_t)block;
/**
 @abstract 确保Block中的方法在程序中只能执行一次.
 **/
+ (void)runSelectorJustOnce:(dispatch_block_t)block;
/**
 @abstract 在主线程中延迟delay秒执行Block中的方法.
 @param delay 延迟执行的秒数.
 **/
+ (void)runSelectorWithDelay:(CGFloat)delay InMainQueue:(dispatch_block_t)block;
/**
 @abstract 
 @param
 @param
 **/
+ (void)runMultipleBlock:(dispatch_block_t)returnBlock Blocks:(dispatch_block_t)block,...;
/**
 @abstract 使用GCD的倒计时.
 @param
 @param
 @param
 @param
 **/
+ (void)runTimerWithTotalDuration:(CGFloat)totalDuration AfterTime:(CGFloat)afterTimer EachBlock:(void(^)(int leftDuration))eachBlock FinalBlock:(dispatch_block_t)finalBlock;
/**
 @abstract
 @param
 @param
 @param
 @param
 **/
+ (GCDHelper *)repeatRunSelectorWithTimeInterval:(CGFloat)timeInterval Queue:(dispatch_queue_t)queue EachBlock:(dispatch_block_t)eachBlock;
/**
 @abstract
 **/
- (void)cancelRepeatSelector;
@end
