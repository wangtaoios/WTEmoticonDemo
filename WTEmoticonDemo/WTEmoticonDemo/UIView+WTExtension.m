//
//  UIView+WTExtension.m
//  CatEyeInternet
//
//  Created by wangtao on 16/5/25.
//  Copyright © 2016年 wwcj. All rights reserved.
//

#import "UIView+WTExtension.h"
#import <CoreText/CoreText.h>

@implementation UIView (WTExtension)


- (void)setWt_left:(CGFloat)wt_left
{
    CGRect frame = self.frame;
    frame.origin.x = wt_left;
    self.frame = frame;
}

- (CGFloat)wt_left
{
    return self.frame.origin.x;
}

- (void)setWt_right:(CGFloat)wt_right
{
    CGRect frame = self.frame;
    frame.origin.x = wt_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)wt_right
{
    return (self.frame.origin.x + self.frame.size.width);
}

- (void)setWt_top:(CGFloat)wt_top
{
    CGRect frame = self.frame;
    frame.origin.y = wt_top;
    self.frame = frame;
}

- (CGFloat)wt_top
{
    return self.frame.origin.y;
}

- (void)setWt_bottom:(CGFloat)wt_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = wt_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)wt_bottom
{
    return (self.frame.origin.y + self.frame.size.height);
}

- (void)setWt_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)wt_size
{
    return self.frame.size;
}

- (void)setWt_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setWt_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setWt_x:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setWt_y:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWt_centerX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setWt_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)wt_centerY
{
    return self.center.y;
}

- (CGFloat)wt_centerX
{
    return self.center.x;
}

- (CGFloat)wt_width
{
    return self.frame.size.width;
}

- (CGFloat)wt_height
{
    return self.frame.size.height;
}

- (CGFloat)wt_x
{
    return self.frame.origin.x;
}

- (CGFloat)wt_y
{
    return self.frame.origin.y;
}



@end
