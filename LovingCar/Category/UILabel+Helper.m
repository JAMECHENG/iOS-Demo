//
//  UILabel+Helper.m
//  LovingCar
//
//  Created by Jame on 15/8/28.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "UILabel+Helper.h"

@implementation UILabel (Helper)

- (void)changeHeightWithContent:(NSString *)string LineSpace:(CGFloat)lineSpace
{
    CGRect rect = self.frame;
    [self setNumberOfLines:0];
    [self sizeToFit];
    NSMutableAttributedString *finalStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [finalStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [finalStr length])];
    [self setAttributedText:finalStr];
    CGSize maxLabelSize = CGSizeMake(rect.size.width, MAXFLOAT);
    CGSize finalLabelSize = [self sizeThatFits:maxLabelSize];
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, finalLabelSize.height);
}
- (void)automaticAdaptContentTochangeHeight
{
    [self changeHeightWithContent:self.text LineSpace:8];
}
- (void)changeWidthWithContent:(NSString *)string
{
    CGRect rect = self.frame;
    [self setNumberOfLines:0];
    [self sizeToFit];
    CGSize maxLabelSize = CGSizeMake(MAXFLOAT, rect.size.height);
    CGSize finalLabelSize = [self sizeThatFits:maxLabelSize];
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, finalLabelSize.width, rect.size.height);
}
- (void)automaticAdaptContentTochangeWidth
{
    [self changeWidthWithContent:self.text];
}

- (void)changeTextColorAnimationWithAnimationDuration:(CGFloat)animationDuration ToColor:(UIColor *)toColor
{
    POPBasicAnimation *textColorAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLabelTextColor];
    textColorAnimation.duration = animationDuration;
    textColorAnimation.fromValue = self.textColor;
    textColorAnimation.toValue = toColor;
    [self pop_addAnimation:textColorAnimation forKey:@"labelTextColorAnimation"];
}
@end
