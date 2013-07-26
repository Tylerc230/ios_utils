//
//  UIStoryboardSegue+Helpers.m
//
//  Created by Tyler Casselman on 10/12/12.
//  Copyright (c) 2012 Casselman Consulting. All rights reserved.
//

#import "UIStoryboardSegue+Helpers.h"

@implementation UIStoryboardSegue (Helpers)
- (BOOL)is:(NSString *)identifier
{
    return [self.identifier isEqualToString:identifier];
}
@end
