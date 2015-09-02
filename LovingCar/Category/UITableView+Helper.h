//
//  UITableView+Helper.h
//  LovingCar
//
//  Created by Jame on 15/8/24.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Helper)
//@property (nonatomic, readwrite)UIView *detailView;
/**
 @abstract 根据animationDirection为初始方向将所有可视的TABLEVIEWCELL按照顺序滑入并且opacity设置为1.
 @param animationDirection 动画开始方向.
 @param animationDuration 动画所需时间.
 **/
- (void)displayCellFromDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration;
/**
 @abstract 根据animationDirection为目标方向将所有可视的TABLEVIEWCELL按照顺序滑出并且opacity设置为0,在动画结束后将opacity设置为1.
 @param animationDirection 动画目标方向.
 @param animationDuration 动画所需时间.
 **/
- (void)disappearCellToDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration;

@end
