//
//  UIImage+Helpers.m
//
//  Created by Tyler Casselman on 12/3/12.
//  Copyright (c) 2012 Casselman Consulting. All rights reserved.
//

#import "UIImage+Helpers.h"

@implementation UIImage (Helpers)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [UIImage imageWithColor:color size:CGSizeMake(1, 2)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)imageSize
{
    CGRect rect = CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);

    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
