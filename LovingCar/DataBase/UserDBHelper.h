//
//  UserDBHelper.h
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface UserDBHelper : NSObject
/**
 @abstract 向Database里插入一个UserModel的类，如果已存在则更新数据
 @param
 @returns
 **/
+ (BOOL)insertUserToDataBase:(UserModel *)userModel;

+ (UserModel *)getCurrentUserFromDatabase;
@end
