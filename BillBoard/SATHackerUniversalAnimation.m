//
//  SATHackerUniversalAnimation.m
//  SATHacker
//
//  Created by Kedan Li on 14-6-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import "SATHackerUniversalAnimation.h"

@implementation SATHackerUniversalAnimation

+ (void)easyAlphaChange:(UIView*)btn :(CGFloat)duration :(CGFloat)delay :(double)alpha{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay: delay];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [btn setAlpha:alpha];
    [UIView commitAnimations];
    
}

+ (void)easyMove:(UIView*)btn :(CGFloat)duration :(CGFloat)delay :(double)x :(double)y{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay: delay];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [btn setFrame:CGRectMake(x, y, btn.frame.size.width, btn.frame.size.height)];
    [UIView commitAnimations];
    
}


+ (void)move :(id)deleg :(id)sender :(NSString*)key :(double)x :(double)y :(double)duration :(double)timeWaiting :(bool)reverse {
    
    UIView *btn = (UIView*)sender;
    CATransform3D positionTransform = CATransform3DMakeTranslation(x, y, 0); //位置移动
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:positionTransform];
    animation.duration = duration;
    animation.autoreverses = reverse;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    animation.beginTime = CACurrentMediaTime() + timeWaiting;
    animation.delegate = deleg;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [btn.layer addAnimation:animation forKey:key];
}

+ (void)alphaChangeAnimation:(id)deleg : (id)sender :(NSString*)key :(double)alphaTo :(double)duration :(double)timeWaiting {
    
    UIView *btn = (UIView*)sender;
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.toValue = [NSNumber numberWithFloat:alphaTo];
    animation.duration = duration;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    animation.beginTime = CACurrentMediaTime() + timeWaiting;
    animation.delegate = deleg;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [btn.layer addAnimation:animation forKey:key];
}

+ (void)bigToSmall:(id)deleg : (id)sender :(NSString*)key :(double)duration :(double)timeWaiting {
    
    UIView *btn = (UIView*)sender;

    CATransform3D scaleTransform = CATransform3DMakeScale(0.001, 0.001, 1);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:scaleTransform];
    animation.duration = duration;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    animation.beginTime = CACurrentMediaTime() + timeWaiting;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = deleg;
    
    [btn.layer addAnimation:animation forKey:key];
    
    
}

+ (void)smallToBig:(id)deleg : (id)sender :(NSString*)key :(double)duration :(double)timeWaiting {
    
    UIView *btn = (UIView*)sender;
    
    CATransform3D scaleTransform = CATransform3DMakeScale(1000, 1000, 1);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:scaleTransform];
    animation.duration = duration;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    animation.beginTime = CACurrentMediaTime() + timeWaiting;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = deleg;
    
    [btn.layer addAnimation:animation forKey:key];
    
    
}

+ (void)signUpCreate:(id)deleg : (id)sender :(NSString*)key {
    
    UIView *btn = (UIView*)sender;
    
    CATransform3D scaleTransform = CATransform3DMakeScale(2, 2, 1);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:scaleTransform];
    animation.duration = 0.5;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = deleg;
    
    [btn.layer addAnimation:animation forKey:key];
    
    
}

@end
