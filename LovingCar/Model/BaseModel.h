//
//  BaseModel.h
//  ModelHelper
//
//  Created by Jame on 15/5/4.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject<NSCopying, NSCoding>
/**
 @abstract 获得BaseModel的所有keys.
 **/
- (NSArray *)getPropertyKeys;
/**
 @abstract 获得BaseModel的所有values.
 **/
- (NSArray *)getPropertyValues;
/**
 @abstract 将BaseModel转为NSDictionary.
 **/
- (NSDictionary *)convertToDictionary;
/**
 @abstract 根据dictionary初始化一个BaseModel.
 @param dictionary 为初始化的数据来源.
 **/
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
