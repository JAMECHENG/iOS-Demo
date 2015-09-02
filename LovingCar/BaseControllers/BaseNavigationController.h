//
//  BaseNavigationController.h
//  LovingCar
//
//  Created by Jame on 15/7/16.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController
@property (nonatomic, strong)UIView *detailView;
/**
 @abstract 根据alpha设置导航栏底部的透明度.
 @param alpha 需要达到的透明度.
 **/
- (void)setNavigationBarBackgroundAlpha:(CGFloat)alpha;
/**
 @abstract 根据color和animationDuration来改变NavigationBar的tintColor
 @param color 需要改变到的颜色.
 @param animationDuration 动画所需时间.
 **/
- (void)changeNavigationBarTintColor:(UIColor *)color AnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 根据opacity和animationDuration来改变NavigationBar的底部透明度.
 @param opacity 需要达到的透明度.
 @param animationDuration 动画所需时间.
 **/
- (void)changeNavigationBarBackgroundLayOpacity:(CGFloat)opacity AnimationDuration:(CGFloat)animationDuration;
@end
