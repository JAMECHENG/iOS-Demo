//
//  NSString+Helper.m
//  LovingCar
//
//  Created by Jame on 15/9/1.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)
- (BOOL)validateStringIsIntegerFormate
{
    NSString *regex = @"([0-9]+)";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsDoubleFormate
{
    NSString *regex = @"^[0-9]+([.]{1}[0-9]+){0,1}$";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsEmailFormate
{
    NSString *regex = @"\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsIDCardFormate
{
    NSString *regex = @"\\d{15}|\\d{17}[0-9Xx]";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsPhoneNumberFormate
{
    NSString *regex = @"(13\\d|14[57]|15[^4,\\D]|17[678]|18\\d)\\d{8}|170[059]\\d{7}";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsCarNumberFormate
{
    NSString *regex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsURLFormate
{
    NSString *regex = @"[a-zA-z]+://[^\\s]*";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsTeleNumberFormate
{
    NSString *regex = @"^(\\d{3,4}-)\\d{7,8}$";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsChineseFormate
{
    NSString *regex = @"^[\u4e00-\u9fa5]*";
    return [self validateStringIsRegexFormate:regex];
}
- (BOOL)validateStringIsRegexFormate:(NSString *)formate
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",formate];
    return [predicate evaluateWithObject:self];
}
@end
