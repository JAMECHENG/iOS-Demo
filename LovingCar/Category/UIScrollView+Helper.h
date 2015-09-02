//
//  UIScrollView+Helper.h
//  VictoryWealth
//
//  Created by Jame on 15/1/30.
//  Copyright (c) 2015年 Sage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Helper)
/**
 @abstract 快速滚动到UISCROLLVIEW的顶部.
**/
 - (void)rollToTopAnimationForScrollView;
/**
 @abstract 快速滚动到UISCROLLVIEW的底部.
 **/
- (void)rollToBottomAnimationForScrollView;
@end
