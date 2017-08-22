//
//  WTEmoticonInputView.h
//  WTEmotionByYYKit
//
//  Created by wangtao on 2017/8/10.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmotionKeyBoardDelegate <NSObject>

- (void)clickEmotionName:(NSString *)name;
- (void)clickDelete;

@end


@interface WTEmoticonInputView : UIView

/*
 * 键盘的代理
 */
@property(nonatomic, weak) id <EmotionKeyBoardDelegate> delegate;


/*
 * 输入框字体，用来计算表情的大小
 */
@property(nonatomic, strong) UIFont *font;

@end
