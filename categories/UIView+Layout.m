//
//  UIView+Layout.m
//
//  Created by Tyler Casselman on 5/8/12.
//  Copyright (c) 2012 Casselman Consulting. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)
@dynamic x, y;

- (void)setOrigin:(CGPoint)origin
{
    CGRect newFrame = self.frame;
    newFrame.origin = origin;
    self.frame = newFrame;
}

- (void)setSize:(CGSize)size
{
    CGRect newFrame = self.frame;
    newFrame.size = size;
    self.frame = newFrame;
}

- (void)setWidth:(float)width
{
    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    self.frame = newFrame;
}

- (void)setHeight:(float)height
{
    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    self.frame = newFrame;
}

- (void)setX:(float) x
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = x;
    self.frame = newFrame;
}

- (void)setY:(float)y
{
    CGRect newFrame = self.frame;
    newFrame.origin.y = y;
    self.frame = newFrame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGSize)size
{
    return self.frame.size;
}

- (float)width
{
    return self.frame.size.width;
}

- (float)height
{
    return self.frame.size.height;
}

- (float)x
{
    return self.frame.origin.x;
}

- (float)y
{
    return self.frame.origin.y;
}

- (void)horizontalCenterInView:(UIView *)view
{
    CGPoint center = self.center;
    center.x = view.center.x;
    self.center = center;
}

- (void)verticalCenterInView:(UIView *)view
{
    CGPoint center = self.center;
    center.y = view.center.y;
    self.center = center;
}

- (void)centerInView:(UIView *)view
{
    [self verticalCenterInView:view];
    [self horizontalCenterInView:view];
}

- (void)verticalCenterInParent
{
    self.y = self.superview.height/2 - self.height/2;
}

- (void)horizontalCenterInParent
{
    self.x = self.superview.width/2 - self.width/2;
}

- (void)bottomAlignWithParent
{
    self.y = self.superview.height - self.height;
}

- (void)rightAlignWithParent
{
    self.x = self.superview.width - self.width;
}

#pragma AutoLayout

- (void)addFillConstraints {
    [self addConstraintFlushWithEdge:NSLayoutAttributeBottom];
    [self addConstraintFlushWithEdge:NSLayoutAttributeTop];
    [self addConstraintFlushWithEdge:NSLayoutAttributeLeft];
    [self addConstraintFlushWithEdge:NSLayoutAttributeRight];
}

- (void)addConstraintFlushWithEdge:(NSLayoutAttribute)edge {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:edge
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.superview
                                                                  attribute:edge
                                                                 multiplier:1.0
                                                                   constant:0.0];
    [self.superview addConstraint:constraint];
}

@end
