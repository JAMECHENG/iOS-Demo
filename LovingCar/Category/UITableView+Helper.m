//
//  UITableView+Helper.m
//  LovingCar
//
//  Created by Jame on 15/8/24.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "UITableView+Helper.h"
#import <objc/runtime.h>
#define kValueForEachCellDelayDuration 0.1
@implementation UITableView (Helper)
//@dynamic detailView;
//static char detailViewKey;
//- (UIView *)detailView
//{
//    return objc_getAssociatedObject(self, &detailViewKey);
//}
//
//- (void)setDetailView:(UIView *)detailView
//{
//    objc_setAssociatedObject(self, &detailViewKey, detailView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
- (void)displayCellFromDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration
{
    UITableViewCell *cell;
    NSArray *array = [self indexPathsForVisibleRows];
    for (int i=0; i<array.count; i++) {
        [self cellForRowAtIndexPath:[array objectAtIndex:i]].layer.opacity = 0;
    }
    for (int i=0; i<array.count; i++) {
        cell = [self cellForRowAtIndexPath:[array objectAtIndex:i]];
        [GCDHelper runSelectorWithDelay:i*kValueForEachCellDelayDuration InMainQueue:^{
            [cell displayAnimationFromDirection:animationDirection AnimationDuration:animationDuration];
            [cell changeLayerOpacityToDisplayViewWithAnimationDuration:animationDuration];
        }];
    }
}

- (void)disappearCellToDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration
{
    UITableViewCell *cell;
    NSArray *array = [self indexPathsForVisibleRows];
    for (int i=0; i<array.count; i++) {
        cell = [self cellForRowAtIndexPath:[array objectAtIndex:array.count-i-1]];
        [GCDHelper runSelectorWithDelay:i*kValueForEachCellDelayDuration InMainQueue:^{
            [cell disappearViewToDirection:animationDirection AnimationDuration:animationDuration];
            [cell changeLayerOpacityToDisappearViewWithAnimationDuration:animationDuration];
        }];
    }
}


@end
