//
//  UIView+NibLoading.m
//
//  Created by Tyler Casselman on 4/25/12.
//  Copyright (c) 2012 Casselman Consulting. All rights reserved.
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)
+ (UIView *)loadViewFromNibWithId:(NSString *)identifier andOwner:(id)owner
{
    UINib * cellNib = [UINib nibWithNibName:identifier bundle:nil];
    NSArray * topLevelObjects = [cellNib instantiateWithOwner:owner options:nil];
    for (id object in topLevelObjects) {
        if ([object isKindOfClass:[UIView class]]) {
            return object;
        }
    }
    return nil;
}


@end
