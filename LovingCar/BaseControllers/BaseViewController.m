//
//  BaseViewController.m
//  LovingCar
//
//  Created by Jame on 15/7/16.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    NSDictionary *textAttributesDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                                       [UIFont boldSystemFontOfSize:19], NSFontAttributeName,
                                       [UIColor grayColor], NSForegroundColorAttributeName,
                                       nil];
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributesDic];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
