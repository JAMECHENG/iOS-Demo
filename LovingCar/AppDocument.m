//
//  AppDocument.m
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "AppDocument.h"

@interface AppDocument () {
    Reachability *_reachability;
}
@end

@implementation AppDocument

static AppDocument *shareDocument;

+ (AppDocument *)shareDocument
{
    @synchronized(self) {
        if (!shareDocument) {
            shareDocument = [[self alloc] init];
        }
    }
    return shareDocument;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (!shareDocument) {
            shareDocument = [super allocWithZone:zone];
        }
    }
    return shareDocument;
}

- (instancetype)init
{
    @synchronized(self){
        self = [super init];
        if (self) {
            [self startNetworkObserver];
            shareDocument.networkStatus = @"";
            shareDocument.currentUser = nil;
        }
        return self;
    }
}

- (void)startNetworkObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    _reachability = [Reachability reachabilityForInternetConnection];
    self.isConnectNetwork = ([_reachability currentReachabilityStatus] == NotReachable ? NO : YES);
    [_reachability startNotifier];
}

- (void)reachabilityChanged:(NSNotification *)notification
{
    Reachability *currentReachability = [notification object];
    if ([currentReachability isKindOfClass:[Reachability class]]) {
        NetworkStatus currentStatus = [currentReachability currentReachabilityStatus];
        switch (currentStatus) {
            case NotReachable:
                self.networkStatus = @"本机网络不可用";
                break;
            case ReachableViaWiFi:
                self.networkStatus = @"正在使用wifi网络";
                break;
            case ReachableViaWWAN:
                self.networkStatus = @"正在使用移动网络可用";
                break;
            default:
                self.networkStatus = @"未知网络";
                break;
        }
        ULog(@"%@",self.networkStatus);
        self.isConnectNetwork = (currentStatus == NotReachable ? NO : YES);
    }
}

- (void)clearCurrentUser
{
    shareDocument.currentUser = nil;
}


@end
