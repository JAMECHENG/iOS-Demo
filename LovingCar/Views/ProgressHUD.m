//
//  ProgressHUD.m
//  LovingCar
//
//  Created by Jame on 15/8/11.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "ProgressHUD.h"
@interface ProgressHUD ()
@property (nonatomic, strong)UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *imageView;

@end
@implementation ProgressHUD
@synthesize activityIndicatorView,titleLabel,imageView;
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
        [self initSubviews];
        
    }
    return self;
}
- (void)initSubviews{
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 80)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.numberOfLines = 0;
    [self addSubview:titleLabel];
    
    activityIndicatorView = [[UIActivityIndicatorView alloc] init];
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self addSubview:activityIndicatorView];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [imageView setImage:UIIMAGE_FROM_NAME(@"error")];
    imageView.hidden = YES;
    [self addSubview:imageView];
}

- (void)startHUDAnimationWithTitle:(NSString *)title
{
    titleLabel.text = title;
    [titleLabel automaticAdaptContentTochangeWidth];
    CGRect titleLabelRect = titleLabel.frame;
    CGFloat width = titleLabelRect.size.width + 20;
    if (titleLabelRect.size.width + 20 < 100) {
        width = 100;
    }
    self.frame = CGRectMake(0, 0, width, 100);
    [self resetAllCenter];

    [activityIndicatorView startAnimating];
    [self setNeedsDisplay];
}

- (void)stopHUDAnimationWithTitle:(NSString *)title Success:(BOOL)isSuccess
{
    [activityIndicatorView stopAnimating];
    [imageView setHidden:NO];
    if (isSuccess) {
        [self.superview sendSubviewToBack:self];
    } else {
        titleLabel.text = title;
        imageView.hidden = NO;
        [titleLabel automaticAdaptContentTochangeWidth];
        CGRect titleLabelRect = titleLabel.frame;
        CGFloat width = titleLabelRect.size.width + 20;
        if (titleLabelRect.size.width + 20 < 100) {
            width = 100;
        }
        self.frame = CGRectMake(0, 0, width, 100);
        [self resetAllCenter];
        [self.layer pop_removeAllAnimations];
        [self shakeViewAnimationForViewWithAnimationDirection:AnimationDirectionFromLeft CompletionBlock:^(BOOL finish) {
            [self.superview sendSubviewToBack:self];
            [imageView setHidden:YES];
        }];
    }
}

- (void)showWarningHUDWithTitle:(NSString *)title
{
    [imageView setHidden:NO];
    titleLabel.text = title;
    [titleLabel automaticAdaptContentTochangeWidth];
    CGRect titleLabelRect = titleLabel.frame;
    CGFloat width = titleLabelRect.size.width + 20;
    if (titleLabelRect.size.width + 20 < 100) {
        width = 100;
    }
    self.frame = CGRectMake(0, 0, width, 100);
    [self resetAllCenter];
    [self.layer pop_removeAllAnimations];
    [self shakeViewAnimationForViewWithAnimationDirection:AnimationDirectionFromLeft CompletionBlock:^(BOOL finish) {
        [self.superview sendSubviewToBack:self];
        [imageView setHidden:YES];
    }];
}

- (void)resetAllCenter
{
    self.center = CGPointMake(SCREEN_WIDTH()/2, SCREEN_HEIGHT()/2-40);
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    CGPoint titleLabelPoint = centerPoint;
    titleLabelPoint.y = titleLabelPoint.y + 25;
    titleLabel.center = titleLabelPoint;
    
    CGPoint activityIndicatorViewPoint = centerPoint;
    activityIndicatorViewPoint.y = activityIndicatorViewPoint.y - 10;
    activityIndicatorView.center = activityIndicatorViewPoint;
    imageView.center = activityIndicatorViewPoint;
}
@end
