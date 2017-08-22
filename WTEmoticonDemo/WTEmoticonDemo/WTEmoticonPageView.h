//
//  WTEmoticonPageView.h
//  WestDevelopment
//
//  Created by wangtao on 2017/8/10.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTEmoticonButton.h"

@interface WTEmoticonPageView : UIView
/*
 * 当前page的页数
 */
@property(nonatomic, assign) NSUInteger page;
/*
 * 表情按钮的回调事件
 * 参数button是当前点击按钮的对象
 */
@property(nonatomic, copy)void (^emotionButtonClick)(WTEmoticonButton *button);
/*
 * 键盘上删除按钮的回调事件
 * 参数button是当前点击的删除按钮
 */
@property(nonatomic, copy)void (^deleteButtonClick)(WTEmoticonButton *button);

@end
