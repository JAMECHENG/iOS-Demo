//
//  BaseModel.m
//  ModelHelper
//
//  Created by Jame on 15/5/4.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>
@implementation BaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [self init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return (self);
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    NSError *error;
    if ([self validateValue:&value forKey:key error:&error]) {
        [super setValue:value forKey:key];
    }
    else{
        ULog(@"Error Value For Key[%@]",key);
        [super setValue:nil forKey:key];
    }
    if (error) {
        ULog(@"Error is %@",error);
    }
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseModel *copyModel;
    copyModel = [[[self class]allocWithZone:zone]init];
    return (copyModel);
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    return self;
}

- (void)convertDataFromString:(id *)value
{
    if (*value == nil) {
        *value = [NSDate date];
    }
    if ([*value isKindOfClass:[NSNull class]]) {
        *value = [NSDate date];
    }
    else if([*value isKindOfClass:[NSString class]]){
        static NSString *format = @"yyyy-MM-dd HH:mm:ss";
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        [dateFormatter setLocale:locale];
        [dateFormatter setDateFormat:format];
        *value = [dateFormatter dateFromString:*value];
        ULog(@"date is %@",*value);
    }
}

- (NSArray *)getPropertyKeys
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
    }
    free(properties);
    return keys;
}

- (NSArray *)getPropertyValues
{
    return [[self convertToDictionary] allValues];
}

- (NSDictionary *)convertToDictionary
{
    return [self dictionaryWithValuesForKeys:[self getPropertyKeys]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",[self dictionaryWithValuesForKeys:[self getPropertyKeys]]];
}
@end
