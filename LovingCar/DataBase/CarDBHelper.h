//
//  CarDBHelper.h
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarModel.h"
@interface CarDBHelper : NSObject
/**
 * 向Database里插入一个CarModel的类，如果已存在则更新数据
 **/
+ (BOOL)insertCarToDataBase:(CarModel *)carModel;
/**
 * 根据UserId从CarList表中找到对应的Car
 **/
+ (NSArray *)getCarsByUserId:(NSString *)userId;
@end
