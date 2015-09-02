//
//  GCDHelper.m
//  LovingCar
//
//  Created by Jame on 15/9/1.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "GCDHelper.h"

@interface GCDHelper()
@property (nonatomic, readwrite, strong) dispatch_source_t timer;
@property (nonatomic, readwrite, strong) dispatch_block_t block;
@end

@implementation GCDHelper

+ (void)runSelectorInMainQueue:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (void)runSelectorInGlobalQueue:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

+ (void)runSelectorJustOnce:(dispatch_block_t)block
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,block);
}

+ (void)runSelectorWithDelay:(CGFloat)delay InMainQueue:(dispatch_block_t)block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(),block);
}

+ (void)runMultipleBlock:(dispatch_block_t)returnBlock Blocks:(dispatch_block_t)firstBlock, ...
{
    va_list args;
    va_start(args, firstBlock);
    dispatch_group_t group = dispatch_group_create();
    for (dispatch_block_t block = firstBlock; block != nil; block = va_arg(args, dispatch_block_t)) {
        dispatch_group_async(group, dispatch_get_global_queue(0,0), block);
    }
    va_end(args);
    if (returnBlock) {
        dispatch_group_notify(group, dispatch_get_global_queue(0,0),returnBlock);
    }
}

+ (void)runTimerWithTotalDuration:(CGFloat)totalDuration AfterTime:(CGFloat)afterTimer EachBlock:(void(^)(int leftDuration))eachBlock FinalBlock:(dispatch_block_t)finalBlock
{
    __block double timeout = totalDuration;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 0), afterTimer * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if(timeout <= 0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(),finalBlock);
        } else {
            dispatch_async(dispatch_get_main_queue(),^{
                if (eachBlock) {
                    eachBlock(timeout);
                }
            });
            timeout = timeout - afterTimer;
        }  
    });  
    dispatch_resume(timer);
}

+ (GCDHelper *)repeatRunSelectorWithTimeInterval:(CGFloat)timerInterval Queue:(dispatch_queue_t)queue EachBlock:(dispatch_block_t)eachBlock
{
    if (queue == nil) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    if (!eachBlock) {
        return nil;
    }
    GCDHelper *helper = [[self alloc] init];
    helper.block = eachBlock;
    helper.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_resume(helper.timer);
    
    dispatch_source_set_timer(helper.timer, dispatch_time(DISPATCH_TIME_NOW, 0), timerInterval * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(helper.timer,^{
        dispatch_async(dispatch_get_main_queue(),eachBlock);
    });
    return helper;
}

- (void)cancelRepeatSelector
{
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
    self.block = nil;
}

- (void)dealloc
{
    [self cancelRepeatSelector];
}
@end
