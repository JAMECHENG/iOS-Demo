//
//  NetworkHelper.h
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject
/**
 @abstract
 @param
 **/
+ (NSString *)getWholeURLWithFunctionName:(NSString *)functionName;
/**
 @abstract 将jsonString转换为NSDictionary.
 @param jsonString 一个json的字符串.
 @returns 返回一个NSDictionary.
 **/
+ (id)getResponseWithJsonString:(NSString *)jsonString;
@end
