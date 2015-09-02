//
//  NSDictionary+Helper.m
//  LovingCar
//
//  Created by Jame on 15/8/31.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (BOOL)validateValueIsNilForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (object == nil || object == [NSNull null]) {
        return YES;
    }
    return NO;
}

- (BOOL)validateValueForKey:(NSString *)key Class:(Class)theClass
{
    id object = [self objectForKey:key];
    BOOL result = YES;
    if ([self validateValueIsNilForKey:key]||[object isKindOfClass:theClass] == NO) {
        return NO;
    }
    return result;
}

- (NSString *)getNSStringObjectForKey:(NSString *)key DefaultValue:(NSString *)defaultValue
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSString class]]) {
        return object;
    } else {
        return defaultValue;
    }
}

- (NSString *)getNSStringObjectForKey:(NSString *)key
{
    return [self getNSStringObjectForKey:key DefaultValue:@""];
}

- (int)getIntValueForKey:(NSString *)key DefaultValue:(int)defaultValue
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSNumber class]]) {
        return [object intValue];
    } else {
        return defaultValue;
    }
}

- (int)getIntValueForKey:(NSString *)key
{
    return [self getIntValueForKey:key DefaultValue:0];
}

- (long)getLongValueForKey:(NSString *)key DefaultValue:(long)defaultValue
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSNumber class]]) {
        return [object longValue];
    } else {
        return defaultValue;
    }
}

- (long)getLongValueForKey:(NSString *)key
{
    return [self getLongValueForKey:key DefaultValue:0L];
}

- (double)getDoubleValueForKey:(NSString *)key DefaultValue:(double)defaultValue
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSNumber class]]) {
        return [object doubleValue];
    } else {
        return defaultValue;
    }
}

- (double)getDoubleValueForKey:(NSString *)key
{
    return [self getDoubleValueForKey:key DefaultValue:0.0];
}

- (BOOL)getBOOLValueForKey:(NSString *)key DefaultValue:(BOOL)defaultValue
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSNumber class]]) {
        return [object boolValue];
    } else {
        return defaultValue;
    }
}

- (BOOL)getBOOLValueForKey:(NSString *)key
{
    return [self getBOOLValueForKey:key DefaultValue:NO];
}

- (NSDate *)getNSDateObjectForKey:(NSString *)key DefaultValue:(NSDate *)defaultValue
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSDate class]]) {
        return object;
    } else if ([object isKindOfClass:[NSString class]]){
        return [AppHelper dateFromString:object];
    } else {
        return defaultValue;
    }
}

- (NSDate *)getNSDateObjectForKey:(NSString *)key
{
    return [self getNSDateObjectForKey:key DefaultValue:[NSDate date]];
}

- (NSArray *)getNSArrayObjectForKey:(NSString *)key DefaultValue:(NSArray *)defaultValue
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSArray class]]) {
        return object;
    } else {
        return defaultValue;
    }
}

- (NSArray *)getNSArrayObjectForKey:(NSString *)key
{
    return [self getNSArrayObjectForKey:key DefaultValue:[NSArray array]];
}

- (Class)getClassObjectForKey:(NSString *)key OtherClass:(Class)otherClass
{
    id object = [self objectForKey:key];
    if ([self validateValueForKey:key Class:[NSArray class]]) {
        return object;
    } else {
        ULog(@"THE VALUE IS NOT THE CLASS");
        return nil;
    }
}
@end
