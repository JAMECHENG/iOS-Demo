//
//  AppWindow.m
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "AppWindow.h"

@interface AppWindow()
{
    int _ignoreTouchCount;
}
@property (nonatomic, strong)ProgressHUD *progressHUD;
@end

@implementation AppWindow
@synthesize progressHUD;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initProgressHUD];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (_ignoreTouchCount > 0) {
        return nil;
    } else {
        _ignoreTouchCount = 0;
        return [super hitTest:point withEvent:event];
    }
}

- (void)initProgressHUD
{
    progressHUD = [[ProgressHUD alloc]initWithFrame:CGRectMake(SCREEN_WIDTH()/2-50, SCREEN_HEIGHT()/3, 100, 100)];
    progressHUD.layer.cornerRadius = 4;
    progressHUD.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    progressHUD.layer.shadowColor = [UIColor grayColor].CGColor;
    progressHUD.layer.shadowOpacity = 0.5;
    progressHUD.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    [self addSubview:progressHUD];
}

- (void)showProgressHUDWithTitle:(NSString *)title NeedLock:(BOOL)needLock
{
    if (needLock) {
        _ignoreTouchCount +=1;
        if (_ignoreTouchCount>0) {
            [self bringSubviewToFront:progressHUD];
            [progressHUD startHUDAnimationWithTitle:title];
        }
    }
    else{
        [self bringSubviewToFront:progressHUD];
        [progressHUD startHUDAnimationWithTitle:title];
    }
}
- (void)hideProgressHUDWithTitle:(NSString *)title NeedLock:(BOOL)needLock Success:(BOOL)success
{
    if (needLock) {
        _ignoreTouchCount -= 1;
        if (_ignoreTouchCount<=0) {
            [progressHUD stopHUDAnimationWithTitle:title Success:success];
        }
    }
    else{
        [progressHUD stopHUDAnimationWithTitle:title Success:success];
    }
}

- (void)showWarningProgressHUDWithTitle:(NSString *)title
{
    [self bringSubviewToFront:progressHUD];
    [progressHUD showWarningHUDWithTitle:title];
}
@end
