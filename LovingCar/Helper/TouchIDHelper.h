//
//  TouchIDHelper.h
//  LovingCar
//
//  Created by Jame on 15/8/14.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
@interface TouchIDHelper : NSObject
/**
 @abstract
 @returns
 **/
+ (TouchIDHelper *)sharedTouchIDHelper;
/**
 @abstract 
 @param
 @param
 @returns
 **/
- (void)authenticateUserWithTitle:(NSString *)title CanEvaluate:(void (^)(BOOL success,NSError *error))canEvaluateBlock
                   CanNotEvaluate:(void (^)(NSError *error))canNotEvaluateBlock;
@end
