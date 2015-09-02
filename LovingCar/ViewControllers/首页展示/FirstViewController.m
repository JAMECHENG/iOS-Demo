//
//  FirstViewController.m
//  LovingCar
//
//  Created by Jame on 15/7/16.
//  Copyright (c) 2015年 Jame. All rights reserved.
//
#import "FirstViewController.h"

@interface FirstViewController ()
{
    UIButton *button;
    GCDHelper *helper1;
    GCDHelper *helper2;
    GCDHelper *helper3;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH()/2-100, SCREEN_HEIGHT()/2, 200, 50)];
    [button setTitle:@"输入指纹密码" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button addBorderForViewWithBorderWidth:1.5 BorderColor:[UIColor grayColor] CornerRadius:2];
    [button addShadowForViewWithShadowOffset:CGSizeMake(4, 4) ShadowOpacity:4 ShadowRadius:4 ShadowColor:[UIColor blueColor]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH()/2 - 100, SCREEN_WIDTH()/2-80, 200, 50)];
    [self.view addSubview:label];
//
//    [GCDHelper runTimerWithTotalDuration:30 AfterTime:1 EachBlock:^(int leftDuration) {
//        NSLog(@"%d******",leftDuration);
//    } FinalBlock:^{
//      
//    }];
//
    helper1 = [GCDHelper repeatRunSelectorWithTimeInterval:0.01 Queue:nil EachBlock:^{
         NSLog(@"1_____");
    }];
    
    helper2 = [GCDHelper repeatRunSelectorWithTimeInterval:0.01 Queue:nil EachBlock:^{
        NSLog(@"2_____");
    }];
    
    helper3 = [GCDHelper repeatRunSelectorWithTimeInterval:0.01 Queue:nil EachBlock:^{
        NSLog(@"3_____");
    }];
//    [GCDHelper runTimerWithTotalDuration:30 AfterTime:1 EachBlock:^(int leftDuration) {
//        NSLog(@"%d______",leftDuration);
//    } FinalBlock:^{
//        NSLog(@"Success");
//    }];
//    
//    [GCDHelper runTimerWithTotalDuration:30 AfterTime:1 EachBlock:^(int leftDuration) {
//        NSLog(@"%dxxxxxx",leftDuration);
//    } FinalBlock:^{
//        NSLog(@"Success");
//    }];
    
//    [GCDHelper runMultipleBlock:^{
//        NSLog(@"3");
//    } Blocks:^{
//        NSLog(@"1");
//    }, ^{
//        NSLog(@"2");
//    },nil];
//
//
    
    
//    SHOW_PROGRESS_HUD_WITH_TITLE_NEEDLOCK(@"HELLO WORLD", NO);
//    [[GCDHelper sharedGCDHelper] runSelectorWithDelay:2 InMainQueue:^{
//        HIDE_PROGRESS_HUD_WITH_ERROR_NEEDLOCK(@"YES...", NO);
//    }];
//    
//    [[GCDHelper sharedGCDHelper] runSelectorWithName:@"test" TimeInterval:10 Queue:nil Action:^{
//        DLog(@"13962624420");
//    }];
    
    //    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    formatter.numberStyle = kCFNumberFormatterSpellOutStyle;
//    NSString *string = [formatter stringFromNumber:[NSNumber numberWithDouble:12345678987654321.343231]];
//    ULog(@"Formatted number string:%@",string);
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:@[@2.4f,@""] forKeys:@[@"1",@"2"]];
    DLog(@"%lf",[dic getDoubleValueForKey:@"1"]);
    
}

- (IBAction)buttonClicked:(id)sender
{
    [helper1 cancelRepeatSelector];
    [helper2 cancelRepeatSelector];
    [helper3 cancelRepeatSelector];
    
//    [[GCDHelper sharedGCDHelper] cancelAllRunSelectors];
//    [[GCDHelper sharedGCDHelper] cancelRunSelectorWithName:@"te1st"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
