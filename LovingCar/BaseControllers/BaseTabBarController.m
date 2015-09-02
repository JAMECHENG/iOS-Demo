//
//  BaseTabBarController.m
//  LovingCar
//
//  Created by Jame on 15/7/16.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.tabBar.tintColor = [UIColor redColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(needLogin:) name:NOTIFICATION_SESSION_TIME_OUT object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    if([viewController isKindOfClass:[BaseNavigationController class]]&&[[(BaseNavigationController *)viewController visibleViewController] isKindOfClass:[PersonViewController class]]){
//        UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"注册登录" bundle:nil];
//        BaseNavigationController *loginNavigationController = (BaseNavigationController *)[loginStoryboard instantiateViewControllerWithIdentifier:@"loginNavigationController"];
//        [self presentViewController:loginNavigationController animated:YES completion:nil];
//        return NO;
//    }
    return YES;
}

- (void)needLogin:(NSNotification *)notification{
    
}


@end
