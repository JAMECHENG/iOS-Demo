//
//  NSDictionary+Helper.h
//  LovingCar
//
//  Created by Jame on 15/8/31.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)
/**
 @abstract 
 @param
 @returns
 **/
- (BOOL)validateValueIsNilForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (BOOL)validateValueForKey:(NSString *)key Class:(Class)theClass;
/**
 @abstract
 @param
 @returns
 **/
- (NSString *)getNSStringObjectForKey:(NSString *)key DefaultValue:(NSString *)defaultValue;
/**
 @abstract
 @param
 @returns
 **/
- (NSString *)getNSStringObjectForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (int)getIntValueForKey:(NSString *)key DefaultValue:(int)defaultValue;
/**
 @abstract
 @param
 @returns
 **/
- (int)getIntValueForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (long)getLongValueForKey:(NSString *)key DefaultValue:(long)defaultValue;
/**
 @abstract
 @param
 @returns
 **/
- (long)getLongValueForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (double)getDoubleValueForKey:(NSString *)key DefaultValue:(double)defaultValue;
/**
 @abstract
 @param
 @returns
 **/
- (double)getDoubleValueForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (BOOL)getBOOLValueForKey:(NSString *)key DefaultValue:(BOOL)defaultValue;
/**
 @abstract
 @param
 @returns
 **/
- (BOOL)getBOOLValueForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (NSDate *)getNSDateObjectForKey:(NSString *)key DefaultValue:(NSDate *)defaultValue;
/**
 @abstract
 @param
 @returns
 **/
- (NSDate *)getNSDateObjectForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (NSArray *)getNSArrayObjectForKey:(NSString *)key DefaultValue:(NSArray *)defaultValue;
/**
 @abstract
 @param
 @returns
 **/
- (NSArray *)getNSArrayObjectForKey:(NSString *)key;
/**
 @abstract
 @param
 @returns
 **/
- (Class)getClassObjectForKey:(NSString *)key OtherClass:(Class)otherClass;

@end
