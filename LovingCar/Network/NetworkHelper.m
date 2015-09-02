//
//  NetworkHelper.m
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "NetworkHelper.h"

#define APP_SERVER_BASE_URL @"https://www.51jiecai.com"

#define APP_SERVER_URL [NSString stringWithFormat:@"%@/api/open",APP_SERVER_BASE_URL]

#define APP_LOAGIN_SERVER_URL [NSString stringWithFormat:@"%@/passport/api/open",APP_SERVER_BASE_URL]

#define APP_SOURCE_URL [NSString stringWithFormat:@"%@/m",APP_SERVER_BASE_URL]

#define APP_JCB_URL [NSString stringWithFormat:@"%@/jcb/api/open",APP_SERVER_BASE_URL]

@implementation NetworkHelper
+ (NSString *)getWholeURLWithFunctionName:(NSString *)functionName{
    NSString *URLPath;
    if (![functionName isEqualToString:@""])
    {
        //不同的接口URL不同，并有一些特定接口不需要Ticket
        //登录接口, URL地址不同, 并且不需要Ticket
        if ([functionName isEqualToString:@"login.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //请求发送短信
        else if ([functionName isEqualToString:@"u_exist.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/reg/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //请求发送短信
        else if ([functionName isEqualToString:@"sendCode.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/reg/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //验证短信验证码
        else if ([functionName isEqualToString:@"validateCode.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/reg/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //用户注册接口, URL地址为服务器地址, 并且不需要Ticket
        else if ([functionName isEqualToString:@"logout.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //用户注册接口, URL地址为服务器地址, 并且不需要Ticket
        else if ([functionName isEqualToString:@"register.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/reg/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //忘记登录密码获取短信校验码
        else if ([functionName isEqualToString:@"forgetLoginPwd.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/sms/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //忘记登录密码验证短信校验码
        else if ([functionName isEqualToString:@"validateLoginPwd.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/sms/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //忘记支付密码获取短信校验码
        else if ([functionName isEqualToString:@"forgetPayPwd.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/sms/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //忘记支付密码校验短信校验码
        else if ([functionName isEqualToString:@"validatePayPwd.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/sms/%@",APP_LOAGIN_SERVER_URL,functionName];
        }
        //修改用户登录密码接口, URL地址为服务器地址, 并且不需要Ticket
        else if ([functionName isEqualToString:@"changeUserLoginPwd.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_SERVER_URL,functionName];
        }
        //获取APP版本号
        else if ([functionName isEqualToString:@"version.html"])
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_SOURCE_URL,functionName];
        }
        //获取红包列表
        else if ([functionName isEqualToString:@"rb/api/open/list.html"]){
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_SERVER_BASE_URL,functionName];
        }
        
        else if ([functionName isEqualToString:@"jcbIndex.html"]){
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_JCB_URL,functionName];
        }
        
        else if([functionName isEqualToString:@"getJcUserBaoInfo.html"]){
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_JCB_URL,functionName];
        }
        
        else if([functionName isEqualToString:@"tenderJcBao.html"]){
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_JCB_URL,functionName];
        }
        
        else if([functionName isEqualToString:@"getShowUpInfoByPage.html"]){
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_SERVER_URL,functionName];
        }
        else if([functionName isEqualToString:@"getJcbaoTradeInfo.html"]){
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_JCB_URL,functionName];
        }
        else
        {
            URLPath = [NSMutableString stringWithFormat:@"%@/%@",APP_SERVER_URL,functionName];
        }
    }
    return URLPath;
}

+ (id)getResponseWithJsonString:(NSString *)jsonString{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    if (jsonObject != nil && [jsonObject isKindOfClass:[NSDictionary class]]){
        return jsonObject;
    }
    else{
        return nil;
    }
}
@end
