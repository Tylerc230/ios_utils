//
//  UIView+Animations.m
//  bestbuy_catalog_v4
//
//  Created by Tyler Casselman on 8/29/12.
//  Copyright (c) 2012 Sequence. All rights reserved.
//

#import "UIView+Animations.h"
#define kViewSlideAnimationDuration .5f
#define kBounceScaleStep1 1.1f
#define kBounceScaleStep2 .9f
#define kBounceDurationStep1 .25f
#define kBounceDurationStep2 .25f
@implementation UIView (Animations)

+ (void)afterDelay:(float)delay do:(AnimationCompleteBlock)block
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_current_queue(), block);
}

- (void)setHiddenAnimated:(BOOL)hiddenAnimated
{
    [self setHiddenAnimated:hiddenAnimated duration:kFadeAnimationDuration onComplete:^{}];
}

- (void)setHiddenAnimated:(BOOL)hiddenAnimated duration:(float)duration onComplete:(AnimationCompleteBlock)complete
{
    //If we're already in the desired state, don't run animation
    if (self.hidden == hiddenAnimated) {
        complete();
        return;
    }
    float endAlpha = hiddenAnimated ? 0.f : 1.f;
    float startAlpha = hiddenAnimated ? 1.f : 0.f;
    self.alpha = startAlpha;
    //if we're unhiding it, set it to not hidden before the animation starts
    if (!hiddenAnimated) {
        self.hidden = NO;
    }
    [UIView animateWithDuration:duration animations:^{
        self.alpha = endAlpha;
    } completion:^(BOOL completion){
        //If we're hiding it, set it to hidden after the animation completes
        if (hiddenAnimated) {
            self.hidden = YES;
        }
        complete();
    }];
}

- (BOOL)hiddenAnimated
{
    return self.hidden;
}

- (void)show:(BOOL)show direction:(AnimationDirection)direction complete:(AnimationCompleteBlock)complete
{
    [self show:show direction:direction duration:kViewSlideAnimationDuration complete:complete];
}

- (void)show:(BOOL)show direction:(AnimationDirection)direction duration:(float)duration complete:(AnimationCompleteBlock)complete
{
    if (show) {
        [self showViewFromDirection:direction duration:duration complete:complete];
    } else {
        [self hideViewInDirection:direction duration:duration complete:complete];
    }
}

- (void)showViewFromDirection:(AnimationDirection)direction duration:(float)duration complete:(AnimationCompleteBlock)complete
{
    CGRect onScreenFrame = self.frame;
    CGRect viewFrame = onScreenFrame;
    viewFrame.origin = [self offScreenLocationForPosition:viewFrame.origin inDirection:direction];
    self.frame = viewFrame;
    self.hidden = NO;
    [UIView animateWithDuration:duration animations:^{
        self.frame = onScreenFrame;
    } completion:^(BOOL finished){
        complete();
    }];
    
}

- (void)hideViewInDirection:(AnimationDirection)direction duration:(float)duration complete:(AnimationCompleteBlock)complete
{
    CGRect originalFrame = self.frame;
    __block CGRect viewFrame = self.frame;
    [UIView animateWithDuration:duration animations:^{
        viewFrame.origin = [self offScreenLocationForPosition:viewFrame.origin inDirection:direction];
        self.frame = viewFrame;
    } completion:^(BOOL finished){
        self.hidden = YES;
        self.frame = originalFrame;
        complete();
    }];

}

- (CGPoint)offScreenLocationForPosition:(CGPoint)onScreenPosition inDirection:(AnimationDirection)direction
{
    CGPoint offScreenPosition = onScreenPosition;
    switch (direction) {
        case AD_RIGHT:
            offScreenPosition.x = self.superview.bounds.size.width;
            break;
        case AD_LEFT:
            offScreenPosition.x = -self.bounds.size.width;
            break;
        case AD_TOP:
            offScreenPosition.y = -self.bounds.size.height;
            break;
        case AD_BOTTOM:
            offScreenPosition.y = self.superview.bounds.size.height;
            break;
        case AD_SPECIALBOTTOM:
            offScreenPosition.y = self.superview.bounds.size.height - 2; //Created this guy in order to push the modal view below the bottom bar while keeping the top bar in the correct posistion. hence the magic number. 
        default:
            break;
    }
    return offScreenPosition;
}

- (void)showBounceAnimation:(AnimationCompleteBlock)complete
{
    self.hidden = NO;
    self.transform = CGAffineTransformMakeScale(kBounceScaleStep1, kBounceScaleStep1);
    [UIView animateWithDuration:kBounceDurationStep1 animations:^{
        self.transform = CGAffineTransformMakeScale(kBounceScaleStep2, kBounceScaleStep2);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:kBounceDurationStep2 animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished){
            complete();
        }];
    }];

}

- (void)hideBounceAnimation:(AnimationCompleteBlock)complete
{
    [UIView animateWithDuration:kBounceDurationStep2 animations:^{
        self.transform = CGAffineTransformMakeScale(kBounceScaleStep2, kBounceScaleStep2);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:kBounceDurationStep1 animations:^{
            self.transform = CGAffineTransformMakeScale(kBounceScaleStep1, kBounceScaleStep1);
        } completion:^(BOOL finished){
            self.hidden = YES;
            self.transform = CGAffineTransformIdentity;
            complete();
        }];
    }];
}

- (void)fadeAndScaleToPoint:(CGPoint)point complete:(AnimationCompleteBlock)complete
{
    float xDelta = point.x - self.center.x;
    float yDelta = point.y - self.center.y;
    CGAffineTransform transform = CGAffineTransformMakeTranslation(xDelta, yDelta);
    transform = CGAffineTransformScale(transform, .00001f, .00001f);
    [UIView animateWithDuration:kViewSlideAnimationDuration animations:^{
        self.transform = transform;
    } completion:^(BOOL finished){
        complete();
        self.transform = CGAffineTransformIdentity;
    }];
}

@end
