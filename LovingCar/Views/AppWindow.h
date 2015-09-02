//
//  AppWindow.h
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppWindow : UIWindow
/**
 @abstract 开始HUD动画.
 @param needlock 是否需要锁屏.
 @param title 为HUD的显示给用户的描述内容.
 **/
- (void)showProgressHUDWithTitle:(NSString *)title NeedLock:(BOOL)needLock;
/**
 @abstract 结束HUD动画,如果为success,立即结束,如果为failed,延迟一秒消失,显示Title.
 @param needlock 是否需要锁屏.
 @param title 为HUD的显示给用户的描述内容.
 @param isSuccess 是否为成功.
 **/
- (void)hideProgressHUDWithTitle:(NSString *)title NeedLock:(BOOL)needLock Success:(BOOL)isSuccess;
/**
 @abstract 根据title来显示WarningHUD.
 @param needlock 是否需要锁屏.
 **/
- (void)showWarningProgressHUDWithTitle:(NSString *)title;
@end
