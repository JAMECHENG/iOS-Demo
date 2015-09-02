//
//  SecurityTextField.m
//  LovingCar
//
//  Created by Jame on 15/8/6.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "SecurityTextField.h"

@implementation SecurityTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
        return NO;
    if (action == @selector(select:))
        return NO;
    if (action == @selector(selectAll:))
        return NO;
    return [super canPerformAction:action withSender:sender];
}

@end
