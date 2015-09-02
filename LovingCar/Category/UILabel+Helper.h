//
//  UILabel+Helper.h
//  LovingCar
//
//  Created by Jame on 15/8/28.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Helper)
/**
 @abstract 根据string和lineSpace来调节UILABEL自身的高度.
 @param string 为UILABEL的text内容.
 @param lineSpace 为UILABEL多行情况下的行间距.
 **/
- (void)changeHeightWithContent:(NSString *)string LineSpace:(CGFloat)lineSpace;
/**
 @abstract 根据UILABEL自身的内容来调节UILABEL自身的高度，行间距默认为8.
 **/
- (void)automaticAdaptContentTochangeHeight;
/**
 @abstract 根据string来调节UILABEL自身的宽度.
 @param string 为UILABEL的text内容.
 **/
- (void)changeWidthWithContent:(NSString *)string;
/**
 @abstract 根据UILABEL自身的内容来调节UILABEL自身的宽度.
 **/
- (void)automaticAdaptContentTochangeWidth;
/**
 @abstract 根据animationDuration和toColor来改变UILABEL的字体颜色.
 @param animationDuration 动画所需时间.
 @param toColor UILABEL最终的字体颜色.
 **/
- (void)changeTextColorAnimationWithAnimationDuration:(CGFloat)animationDuration ToColor:(UIColor *)toColor;
@end
