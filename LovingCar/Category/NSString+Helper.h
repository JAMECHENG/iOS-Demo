//
//  NSString+Helper.h
//  LovingCar
//
//  Created by Jame on 15/9/1.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)
/**
 @abstract 判断NSString是否为整数格式.
 **/
- (BOOL)validateStringIsIntegerFormate;
/**
 @abstract 判断NSString是否为小数格式.
 **/
- (BOOL)validateStringIsDoubleFormate;
/**
 @abstract 判断NSString是否为油箱格式.
 **/
- (BOOL)validateStringIsEmailFormate;
/**
 @abstract 判断NSString是否为身份证格式.
 **/
- (BOOL)validateStringIsIDCardFormate;
/**
 @abstract 判断NSString是否为手机号码格式.
 **/
- (BOOL)validateStringIsPhoneNumberFormate;
/**
 @abstract 判断NSString是否为车牌号码格式.
 **/
- (BOOL)validateStringIsCarNumberFormate;
/**
 @abstract 判断NSString是否为URL格式.
 **/
- (BOOL)validateStringIsURLFormate;
/**
 @abstract 判断NSString是否为电话号码格式.
 **/
- (BOOL)validateStringIsTeleNumberFormate;
/**
 @abstract 判断NSString是否为中文格式.
 **/
- (BOOL)validateStringIsChineseFormate;
/**
 @abstract 判断NSString是否为formate格式.
 @param formate 需要进行判断的格式.
 **/
- (BOOL)validateStringIsRegexFormate:(NSString *)formate;
@end
