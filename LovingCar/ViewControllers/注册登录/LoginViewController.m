//
//  LoginViewController.m
//  LovingCar
//
//  Created by Jame on 15/7/16.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "LoginViewController.h"
#import <AdSupport/ASIdentifierManager.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH()/2-100, SCREEN_HEIGHT()/2, 200, 50)];
    [button setTitle:@"输入指纹密码" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(authenticateUser:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (IBAction)authenticateUser:(id)sender{
    SET_VIEW_CONTROLLER_FADE_EFFECT_ANIMATION();
//    [self.navigationController popViewControllerAnimated:NO];
    [self dismissViewControllerAnimated:NO completion:nil];
//    [[TouchIDHelper shareTouchIDHelper] authenticateUserWithTitle:@"HELLO WORLD" CanEvaluate:^(BOOL success, NSError *error) {
//        if (success) {
//            [self dismissViewControllerAnimated:YES completion:nil];
//        } else {
//            DLogObject(error);
//            switch (error.code) {
//                case kLAErrorUserCancel:
//                    DLog(@"用户取消授权");
//                    break;
//                case kLAErrorUserFallback:
//                    DLog(@"重新登录");
//                    break;
//                default:
//                    DLog(@"用户授权失败");
//                    break;
//            }
//        }
//    } CanNotEvaluate:^(NSError *error) {
//        switch (error.code) {
//            case kLAErrorTouchIDNotAvailable:
//                DLog(@"本设备不支持TOUCHID功能");
//                break;
//            case kLAErrorPasscodeNotSet:
//                DLog(@"未设置本机密码");
//                break;
//            default:
//                break;
//        }
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)loginButtonClicked:(id)sender {
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setObject:@"3" forKey:@"app"];
//    [dic setObject:@"1" forKey:@"s"];
//    [dic setObject:usernameTextField.text forKey:@"uId"];
//    [dic setObject:[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] forKey:@"did"];
//    [dic setObject:passwordTextField.text forKey:@"uPwd"];
//    
//    UserService *userService = [ServiceFactory getService:@"userService"];
//    [userService loginWithParameter:dic SuccessBlock:^(id object) {
//        DLogObject(object);
//    } FailedBlock:^(NSString *errorMsg) {
//        ULog(@"%@",errorMsg);
//    }];
    
//    BaseService *baseService = [[BaseService alloc]init];
//    [baseService sendAsynchronousRequestWithFunctionName:@"login.html" Parameter:dic FinishCallBackBlock:^(id object) {
//        DLogObject(object);
//    } FialedCallBackBlock:^(NSString *errorMsg) {
//        DLogObject(errorMsg);
//    }];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
