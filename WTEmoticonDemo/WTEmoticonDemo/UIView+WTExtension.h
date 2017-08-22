//
//  UIView+WTExtension.h
//  CatEyeInternet
//
//  Created by wangtao on 16/5/25.
//  Copyright © 2016年 wwcj. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (WTExtension)


@property(nonatomic, assign) CGFloat wt_left;
@property(nonatomic, assign) CGFloat wt_right;
@property(nonatomic, assign) CGFloat wt_top;
@property(nonatomic, assign) CGFloat wt_bottom;

@property (nonatomic, assign) CGFloat wt_width;
@property (nonatomic, assign) CGFloat wt_height;
@property (nonatomic, assign) CGFloat wt_x;
@property (nonatomic, assign) CGFloat wt_y;
@property (nonatomic, assign) CGFloat wt_centerX;
@property (nonatomic, assign) CGFloat wt_centerY;
@property (nonatomic, assign) CGSize  wt_size;

@end
