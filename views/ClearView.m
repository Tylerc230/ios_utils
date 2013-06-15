//
//  ClearView.m
//  CalmApp
//
//  Created by Tyler Casselman on 11/13/12.
//  Copyright (c) 2012 Calm. All rights reserved.
//

#import "ClearView.h"

@implementation ClearView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView * tappedView = [super hitTest:point withEvent:event];
    if (tappedView == self) {
        return nil;
    } else {
        return tappedView;
    }
}
@end
