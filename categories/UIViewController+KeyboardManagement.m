//
//  UIViewController+KeyboardManagement.m
//
//  Created by Tyler Casselman
//  Copyright (c) 2014 13bit consulting, Inc. All rights reserved.
//

#import "UIViewController+KeyboardManagement.h"
#define kPadding 10.0

@implementation UIViewController (KeyboardManagement)
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)unregisterForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (UIView *)viewToShow
{
    return nil;
}

#pragma mark - private methods
- (void)_keyboardWillShow:(NSNotification *)notif
{
    UIView *viewToShow = [self viewToShow];
    if (viewToShow) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        CGRect frameToDisplay = [window convertRect:viewToShow.frame fromView:viewToShow.superview];
        CGRect keyboardFrame = [[[notif userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        if (CGRectIntersectsRect(frameToDisplay, keyboardFrame)) {
            CGFloat targetY = keyboardFrame.origin.y - frameToDisplay.size.height - kPadding;
            CGRect windowBounds = window.bounds;
            windowBounds.origin.y = frameToDisplay.origin.y - targetY;
            [self _animationForUserInfo:[notif userInfo] toAnimate:^{
                window.bounds = windowBounds;
            }];
        }
    }
}

- (void)_keyboardWillHide:(NSNotification *)notif
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect bounds = window.bounds;
    bounds.origin.y = 0.f;
    [self _animationForUserInfo:[notif userInfo] toAnimate:^{
        window.bounds = bounds;
    }];

}

- (void)_animationForUserInfo:(NSDictionary *)userInfo toAnimate:(void (^)())animationBlock
{
    NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    UIViewAnimationOptions options = [userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    [UIView animateWithDuration:duration delay:0.f options:options animations:animationBlock completion:nil];
}

@end
