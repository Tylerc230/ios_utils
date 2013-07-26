//
//  UIView+NibLoading.h
//
//  Created by Tyler Casselman on 11/16/12  .
//  Copyright (c) 2012 Casselman Consulting. All rights reserved.
//

/*
 * Facilitates loading a view from a nib. Nib should only have 1 view
 * at the top level.
 */

@interface UIView (NibLoading)
+ (UIView *)loadViewFromNibWithId:(NSString *)identifier andOwner:(id)owner;
@end
