//
//  UserModel.h
//  ModelHelper
//
//  Created by Jame on 15/5/14.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel
/**
 @abstract UserModel类的用户id.
 **/
@property (nonatomic,copy)NSString *userId;
/**
 @abstract UserModel类的用户名称.
 **/
@property (nonatomic,copy)NSString *userName;
@end
