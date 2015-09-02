//
//  ServiceFactory.m
//  JRJC
//
//  Created by Jame on 14/12/16.
//  Copyright (c) 2014年 Jame. All rights reserved.
//

#import "ServiceFactory.h"
#pragma clang diagnostic ignored "-Wunused-value"
@implementation ServiceFactory
static NSMutableDictionary* serviceDictionary;
+ (void)initialize {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Service" ofType:@"plist"];
    serviceDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    for (NSString *serviceKey in serviceDictionary) {
        NSString *serviceName = [serviceDictionary objectForKey:serviceKey];
        Class serviceClass = NSClassFromString(serviceName);
        if (serviceClass == nil) {
            DLog(@"error : %@ not loaded", serviceName);
        } else {
            [[serviceClass alloc] init];
        }
    }
}

+ (void)registerServiceName:(NSString *)serviceName forClassName:(NSString *)className {
    [serviceDictionary setObject:className forKey:serviceName];
    Class serviceClass = NSClassFromString(className);
    if (serviceClass == nil) {
        DLog(@"error : %@ not loaded", className);
    } else {
        [[serviceClass alloc] init];
    }
}

+ (instancetype) getService:(NSString*)serviceName {
    NSString *className = [serviceDictionary objectForKey:serviceName];
    Class serviceClass = NSClassFromString(className);
    return [[serviceClass alloc] init];
}

@end
