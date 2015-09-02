//
//  UIScrollView+Helper.m
//  VictoryWealth
//
//  Created by Jame on 15/1/30.
//  Copyright (c) 2015年 Sage. All rights reserved.
//

#import "UIScrollView+Helper.h"

@implementation UIScrollView (Helper)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!self.dragging)
    {
        [[self nextResponder] touchesBegan:touches withEvent:event];
    }
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!self.dragging)
    {
        [[self nextResponder] touchesMoved:touches withEvent:event];
    }
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!self.dragging)
    {
        [[self nextResponder] touchesEnded:touches withEvent:event];
    }
    [super touchesEnded:touches withEvent:event];
}

- (void)rollToTopAnimationForScrollView
{
    CGPoint toPoint = CGPointMake(0, 0);
    [self setContentOffset:toPoint animated:YES];
}

- (void)rollToBottomAnimationForScrollView
{
    CGPoint toPoint = CGPointMake(0, self.contentSize.height-self.frame.size.height);
    [self setContentOffset:toPoint animated:YES];
}
@end
