//
//  SATHackerUniversalAnimation.h
//  SATHacker
//
//  Created by Kedan Li on 14-6-19.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SATHackerUniversalAnimation : NSObject


+ (void)move :(id)deleg :(id)sender :(NSString*)key :(double)x :(double)y :(double)duration :(double)timeWaiting :(bool)reverse;

+ (void)alphaChangeAnimation:(id)deleg : (id)sender :(NSString*)key :(double)alphaTo :(double)duration :(double)timeWaiting;

+ (void)easyMove:(UIView*)btn :(CGFloat)duration :(CGFloat)delay :(double)x :(double)y;

+ (void)easyAlphaChange:(UIView*)btn :(CGFloat)duration :(CGFloat)delay :(double)alpha;

+ (void)bigToSmall:(id)deleg : (id)sender :(NSString*)key :(double)duration :(double)timeWaiting;

+ (void)smallToBig:(id)deleg : (id)sender :(NSString*)key :(double)duration :(double)timeWaiting;

+ (void)signUpCreate:(id)deleg : (id)sender :(NSString*)key ;

@end
