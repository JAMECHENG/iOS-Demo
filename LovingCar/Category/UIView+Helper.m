//
//  UIView+Helper.m
//  LovingCar
//
//  Created by Jame on 15/8/23.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)
#pragma mark - UIVIEW ANIMATION HELPER
- (void)removeAllPOPAnimationFromViewLayer
{
    [self.layer pop_removeAllAnimations];
}

- (void)displayAnimationFromDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration
{
    POPBasicAnimation *displayViewAnimation = [POPBasicAnimation animation];
    displayViewAnimation.duration = animationDuration;
    switch (animationDirection) {
        case AnimationDirectionFromLeft:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            displayViewAnimation.fromValue = @(self.frame.origin.x-self.frame.size.width);
            break;
        case AnimationDirectionFromRight:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            displayViewAnimation.fromValue = @(self.frame.origin.x+self.frame.size.width);
            break;
        case AnimationDirectionFromTop:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            displayViewAnimation.fromValue = @(self.frame.origin.y-self.frame.size.height);
            break;
        case AnimationDirectionFromBottom:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            displayViewAnimation.fromValue = @(self.frame.origin.y+self.frame.size.height);
            break;
        default:
            ULog(@"THERE IS NO THIS DIRECTION");
            break;
    }
    [self.layer pop_addAnimation:displayViewAnimation forKey:@"displayViewAnimation"];
}

- (void)disappearViewToDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration
{
    CGRect orignRect = self.frame;
    POPBasicAnimation *disappearViewAnimation = [POPBasicAnimation animation];
    disappearViewAnimation.duration = animationDuration;
    switch (animationDirection) {
        case AnimationDirectionFromLeft:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            disappearViewAnimation.toValue = @(self.frame.origin.x-self.frame.size.width);
            break;
        case AnimationDirectionFromRight:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            disappearViewAnimation.toValue = @(self.frame.origin.x+self.frame.size.width);
            break;
        case AnimationDirectionFromTop:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            disappearViewAnimation.toValue = @(self.frame.origin.y-self.frame.size.height);
            break;
        case AnimationDirectionFromBottom:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            disappearViewAnimation.toValue = @(self.frame.origin.y+self.frame.size.height);
            break;
        default:
            ULog(@"THERE IS NO THIS DIRECTION");
            break;
    }
    [disappearViewAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        self.frame = orignRect;
    }];
    [self.layer pop_addAnimation:disappearViewAnimation forKey:@"disappearViewAnimation"];
}

- (void)shakeViewAnimationForViewWithAnimationDirection:(AnimationDirection)animationDirection CompletionBlock:(void (^)(BOOL finish))block
{
    POPSpringAnimation *shakeAnimation = [POPSpringAnimation animation];
    switch (animationDirection) {
        case AnimationDirectionFromLeft:
        case AnimationDirectionFromRight:
            shakeAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            break;
        case AnimationDirectionFromTop:
        case AnimationDirectionFromBottom:
            shakeAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            break;
        default:
            break;
    }
    shakeAnimation.velocity = @2000;
    shakeAnimation.springBounciness = 20;
    [shakeAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        if (block) {
            block(finish);
        }
    }];
    [self.layer pop_addAnimation:shakeAnimation forKey:@"shakeAnimation"];
}

- (void)changeBackgroundColorAnimationForViewWithAnimationDuration:(CGFloat)animationDuration ToColor:(UIColor *)toColor CompletionBlock:(void (^)(BOOL finish))block
{
    POPBasicAnimation *alphaAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    alphaAnimation.toValue = toColor;
    alphaAnimation.duration = animationDuration;
    [alphaAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        if (block) {
            block(finish);
        }
    }];
    [self pop_addAnimation:alphaAnimation forKey:@"alphaAnimation"];
}

- (void)displayViewToScreenWithAnimationDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration
{
    [self changeLayerOpacityToDisplayViewWithAnimationDuration:animationDuration];
    POPBasicAnimation *displayViewAnimation = [POPBasicAnimation animation];
    displayViewAnimation.duration = animationDuration;
    switch (animationDirection) {
        case AnimationDirectionFromLeft:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            displayViewAnimation.fromValue = @(-self.frame.size.width);
            break;
        case AnimationDirectionFromRight:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            displayViewAnimation.fromValue = @(SCREEN_WIDTH() + self.frame.size.width);
            break;
        case AnimationDirectionFromTop:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            displayViewAnimation.fromValue = @(-self.frame.size.height);
            break;
        case AnimationDirectionFromBottom:
            displayViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            displayViewAnimation.fromValue = @(SCREEN_HEIGHT() + self.frame.size.height);
            break;
        default:
            ULog(@"THERE IS NO THIS DIRECTION");
            break;
    }
    [self.layer pop_addAnimation:displayViewAnimation forKey:@"displayToScreenAnimation"];
}

- (void)disappearViewFromScreenWithAnimationDirection:(AnimationDirection)animationDirection AnimationDuration:(CGFloat)animationDuration
{
    [self changeLayerOpacityToDisappearViewWithAnimationDuration:animationDuration];
    CGRect orignRect = self.frame;
    POPBasicAnimation *disappearViewAnimation = [POPBasicAnimation animation];
    disappearViewAnimation.duration = animationDuration;
    switch (animationDirection) {
        case AnimationDirectionFromLeft:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            disappearViewAnimation.toValue = @(-self.frame.size.width);
            break;
        case AnimationDirectionFromRight:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            disappearViewAnimation.toValue = @(SCREEN_WIDTH() + self.frame.size.width);
            break;
        case AnimationDirectionFromTop:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            disappearViewAnimation.fromValue = @(-self.frame.size.height);
            break;
        case AnimationDirectionFromBottom:
            disappearViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            disappearViewAnimation.fromValue = @(SCREEN_HEIGHT() + self.frame.size.height);
            break;
        default:
            ULog(@"THERE IS NO THIS DIRECTION");
            break;
    }
    [disappearViewAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        self.frame = orignRect;
    }];
    [self.layer pop_addAnimation:disappearViewAnimation forKey:@"disappearFromScreenAnimation"];
}

- (void)rorateViewWithIsClockwise:(BOOL)isClockwise CompletionBlock:(void (^)(BOOL finish))block
{
    POPBasicAnimation *rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    if (isClockwise) {
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 10000.0 ];
    } else {
        rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 10000.0 ];
    }
    rotationAnimation.duration = 9999;
    [rotationAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        if (finish) {
            block(finish);
        }
    }];
    [self.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)changeLayerOpacityToDisplayViewWithAnimationDuration:(CGFloat)animationDuration
{
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.duration = animationDuration;
    opacityAnimation.fromValue = @(0);
    opacityAnimation.toValue = @(1);
    [self.layer pop_addAnimation:opacityAnimation forKey:@"opacityDisplayAnimation"];
}

- (void)changeLayerOpacityToDisappearViewWithAnimationDuration:(CGFloat)animationDuration
{
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.duration = animationDuration;
    opacityAnimation.fromValue = @(0);
    opacityAnimation.toValue = @(1);
    [self.layer pop_addAnimation:opacityAnimation forKey:@"opacityDisappearAnimation"];
}

- (void)changeLayerOpacity:(CGFloat)opacity AnimationDuration:(CGFloat)animationDuration
{
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(opacity);
    opacityAnimation.duration = animationDuration;
    [self.layer pop_addAnimation:opacityAnimation forKey:@"opacityChangeAnimation"];
}

- (void)scaleViewWithScaleValue:(CGFloat)toValue AnimationDuration:(CGFloat)animationDuration CompletionBlock:(void (^)(BOOL finish))block
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.duration = animationDuration;
    scaleAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(toValue, toValue)];
    [scaleAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        if (block) {
            block(finish);
        }
    }];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

#pragma mark - VIEW LAYER HELPER
- (void)addBorderForViewWithBorderWidth:(CGFloat)borderWidth BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)cornerRadius
{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = cornerRadius;
}

- (void)addShadowForViewWithShadowOffset:(CGSize)shadowOffset ShadowOpacity:(CGFloat)shadowOpacity ShadowRadius:(CGFloat)shadowRadius ShadowColor:(UIColor *)shadowColor{
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOpacity = shadowOpacity;
}
@end
