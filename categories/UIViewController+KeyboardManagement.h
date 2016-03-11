//
//  UIViewController+KeyboardManagement.h
//
//  Created by Tyler Casselman
//  Copyright (c) 2014 13bit consulting, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Category to help move the view's contents when the keyboard is displayed.
 *  
 */
@interface UIViewController (KeyboardManagement)
/**
 *  Registers the view controller to be notified when the keyboard is displayed
 */
- (void)registerForKeyboardNotifications;
- (void)unregisterForKeyboardNotifications;
/**
 *  The view the user is typing into which needs to be visible on screen
 *  This method should be overridden in the View controller subclass and shoudl
 *  should return the first responder
 *
 *  @return the view to make visible
 */
- (UIView *)viewToShow;
@end
