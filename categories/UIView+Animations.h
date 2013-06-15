//
//  UIView+Animations.h
//  bestbuy_catalog_v4
//
//  Created by Tyler Casselman on 8/29/12.
//  Copyright (c) 2012 Sequence. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kFadeAnimationDuration .5f
typedef void ((^AnimationCompleteBlock)(void));
typedef enum {
    AD_RIGHT,
    AD_LEFT,
    AD_TOP,
    AD_BOTTOM,
    AD_SPECIALBOTTOM
}AnimationDirection;
@interface UIView (Animations)
@property (nonatomic, assign) BOOL hiddenAnimated;
+ (void)afterDelay:(float)delay do:(AnimationCompleteBlock)block;
- (void)show:(BOOL)show direction:(AnimationDirection)direction complete:(AnimationCompleteBlock)complete;
- (void)show:(BOOL)show direction:(AnimationDirection)direction duration:(float)duration complete:(AnimationCompleteBlock)complete;
- (void)showBounceAnimation:(AnimationCompleteBlock)complete;
- (void)hideBounceAnimation:(AnimationCompleteBlock)complete;
- (void)fadeAndScaleToPoint:(CGPoint)point complete:(AnimationCompleteBlock)complete;
- (void)setHiddenAnimated:(BOOL)hiddenAnimated duration:(float)duration onComplete:(AnimationCompleteBlock)complete;
@end
