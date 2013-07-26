//
//  UIView+Layout.h
//
//  Created by Tyler Casselman on 5/8/12.
//  Copyright (c) 2012 Casselman Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 * Easily access attributes of UIView frame and allow for 
 * alignment with another view.
 * WARNING: Don't use 2 of these on the same view in animation block.
 * Animations will only animate the last change you make to a UIView frame
 * Each of these calls sets the frame independently. If you need to call more than 
 * one of these per view in an anim block, just set the frame directly.
 */
@interface UIView (Layout)
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
- (void)centerInView:(UIView *)view;
- (void)horizontalCenterInView:(UIView *)view;
- (void)verticalCenterInView:(UIView *)view;
- (void)verticalCenterInParent;
- (void)horizontalCenterInParent;
- (void)rightAlignWithParent;
- (void)bottomAlignWithParent;

@end
