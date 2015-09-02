//
//  ServiceFactory.h
//  JRJC
//
//  Created by Jame on 14/12/16.
//  Copyright (c) 2014年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceFactory : NSObject
/**
 @abstract 根据serviceName来获取一个service类.
 @param serviceName service类的名称,必须在service.plist中申明或注册程序中已注册.
 @returns 返回一个service类的对象.
 **/
+ (instancetype)getService:(NSString *)serviceName;
/**
 @abstract 根据serviceName和className来注册一个Serive.
 @param serviceName 一个服务的名称.
 @param className 需要注册的Class类型名称.
 **/
+ (void)registerServiceName:(NSString *)serviceName forClassName:(NSString *)className;
@end
