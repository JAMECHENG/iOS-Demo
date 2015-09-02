//
//  AppDocument.h
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface AppDocument : NSObject
/**
 @abstract 一个共享文档的单例.
 **/
+ (AppDocument *)shareDocument;
/**
 @abstract 判断程序能否接入网络.
 **/
@property (nonatomic, assign) BOOL isConnectNetwork;
/**
 @abstract 描述当前程序的网络状态.
 **/
@property (nonatomic, copy) NSString *networkStatus;
/**
 @abstract 当前使用程序的用户.
 **/
@property (nonatomic, strong) UserModel *currentUser;
/**
 @abstract 清楚当前使用程序的用户.
 **/
- (void)clearCurrentUser;

@end
