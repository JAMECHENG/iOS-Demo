//
//  BaseNavigationController.m
//  LovingCar
//
//  Created by Jame on 15/7/16.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationBarBackgroundAlpha:(CGFloat)alpha{
    NSArray *subviews = self.navigationBar.subviews;
    NSString *subviewName;
    for (id view in subviews) {
        subviewName = [[view class] description];
        if ([subviewName isEqualToString:@"_UINavigationBarBackground"]) {
            UIView *tmpView = (UIView *)view;
            tmpView.alpha = alpha;
        }
    }
}

- (void)changeNavigationBarTintColor:(UIColor *)color AnimationDuration:(CGFloat)animationDuration
{
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPNavigationBarBarTintColor];
    basicAnimation.fromValue = self.navigationBar.tintColor;
    basicAnimation.toValue = color;
    basicAnimation.duration = animationDuration;
    [self.navigationBar pop_addAnimation:basicAnimation forKey:@"navigationBarTintColorAnimation"];
}

- (void)changeNavigationBarBackgroundLayOpacity:(CGFloat)opacity AnimationDuration:(CGFloat)animationDuration
{
    NSArray *subviews = self.navigationBar.subviews;
    NSString *subviewName;
    for (id view in subviews) {
        subviewName = [[view class] description];
        if ([subviewName isEqualToString:@"_UINavigationBarBackground"]) {
            UIView *backgroundView = (UIView *)view;
            [backgroundView changeLayerOpacity:opacity AnimationDuration:animationDuration];
        }
    }
}

@end
