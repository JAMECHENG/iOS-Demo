//
//  ProgressHUD.h
//  LovingCar
//
//  Created by Jame on 15/8/11.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressHUD : UIView
/**
 @abstract 开始HUD动画.
 @param title 为HUD的显示给用户的描述内容.
 */
- (void)startHUDAnimationWithTitle:(NSString *)title;
/**
 @abstract 结束HUD动画，如果为success，立即结束，如果为failed，延迟一秒消失，显示Title
 @param title 为HUD的显示给用户的描述内容.
 @param isSuccess 是否为成功.
 **/
- (void)stopHUDAnimationWithTitle:(NSString *)title Success:(BOOL)isSuccess;
/**
 @abstract 根据title内容来显示警示HUD，
 @param title 为HUD的显示给用户的描述内容.
 **/
- (void)showWarningHUDWithTitle:(NSString *)title;
@end
