//
//  UIView+Helper.h
//  LovingCar
//
//  Created by Jame on 15/8/23.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 @abstact UIVIEW的类拓展，主要为POP动画效果的拓展,UIVIEW的边框和UIVIEW的阴影设置.
 **/
@interface UIView (Helper)
/**
 @abstract 删除layer层的所有POP动画效果.
 **/
- (void)removeAllPOPAnimationFromViewLayer;
/**
 @abstract 根据animationDirection为初始方向滑入，距离为UIVIEW的宽度或者高度，并且opacity设置为1，animation的结束frame为初始化的frame.
 @param animationDirection 动画开始方向.
 @param animationDuration 动画所需时间.
 **/
- (void)displayAnimationFromDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 根据animationDirection为目标方向滑出，距离为UIVIEW的宽度或者高度，并且opacity设置为0，动画结束后回到原本的位置.
 @param animationDirection 动画目标方向.
 @param animationDuration 动画所需时间.
 **/
- (void)disappearViewToDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 根据animationDirection为初始方向滑入屏幕，并且opacity设置为1，animation的结束frame为初始化的frame.
 @param animationDirection 动画开始方向.
 @param animationDuration 动画所需时间.
 **/
- (void)displayViewToScreenWithAnimationDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 根据animationDirection为目标方向滑出屏幕，并且opacity设置为0，动画结束后回到原本的位置.
 @param animationDirection 动画目标方向.
 @param animationDuration 动画所需时间.
 **/
- (void)disappearViewFromScreenWithAnimationDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 使UIVIEW出现左右，或者上下晃动效果.
 @param animationDirection 动画开始方向.
 @param block 动画完成后的block.
 **/
- (void)shakeViewAnimationForViewWithAnimationDirection:(AnimationDirection)animationDirection CompletionBlock:(void (^)(BOOL finish))block;
/**
 @abstract 改变UIVIEW的backgroundColor的动画.
 @param animationDuration 动画所需时间.
 @param toColor 为动画结束后的UIVIEW的backgroundColor.
 @param block 动画完成后的block.
 **/
- (void)changeBackgroundColorAnimationForViewWithAnimationDuration:(CGFloat)animationDuration ToColor:(UIColor *)toColor CompletionBlock:(void (^)(BOOL finish))block;
/**
 @abstract 使UIVIEW进行顺时针或者逆时针旋转.
 @param isClockwise 是否为顺时针方向旋转.
 @param block 动画完成后的block.
 **/
- (void)rorateViewWithIsClockwise:(BOOL)isClockwise CompletionBlock:(void (^)(BOOL finish))block;
/**
 @abstract 在一定时间内放大或缩小一个UIVIEW.
 @param animationDuration 动画所需时间.
 @param toValue 放大或缩小的倍数.
 @param block 动画完成后的block.
 **/
- (void)scaleViewWithScaleValue:(CGFloat)toValue AnimationDuration:(CGFloat)animationDuration CompletionBlock:(void (^)(BOOL finish))block;
/**
 @abstract 改变UIVIEW的Layer层的Opacity值来显示UIVIEW.
 @param animationDuration 动画所需时间.
 **/
- (void)changeLayerOpacityToDisplayViewWithAnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 改变UIVIEW的Layer层的Opacity值来隐藏UIVIEW.
 @param animationDuration 动画所需时间.
 **/
- (void)changeLayerOpacityToDisappearViewWithAnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 改变UIVIEW的Layer层的Opacity值.
 @param opacity 最终的opacity值.
 @param animationDuration 动画所需时间.
 **/
- (void)changeLayerOpacity:(CGFloat)opacity AnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 根据borderWidth,borderColor和cornerRadius为UIVIEW添加边框.
 @param borderWidth 边框的宽度.
 @param borderColor 边框的颜色.
 @param cornerRadius UIVIEW的圆角度.
 **/
- (void)addBorderForViewWithBorderWidth:(CGFloat)borderWidth BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)cornerRadius;
/**
 @abstract 根据shadowOffset,shadowOpacity,shadowRadius和shadowColor为UIVIEW添加阴影.
 @param shadowOffset 阴影的位置.
 @param shadowOpacity 阴影的透明度.
 @param shadowRadius 阴影的边框圆角度.
 @param shadowColor 阴影的颜色.
 **/
- (void)addShadowForViewWithShadowOffset:(CGSize)shadowOffset ShadowOpacity:(CGFloat)shadowOpacity ShadowRadius:(CGFloat)shadowRadius ShadowColor:(UIColor *)shadowColor;
@end
