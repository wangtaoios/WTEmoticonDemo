//
//  WTEmoticonPageView.m
//  WestDevelopment
//
//  Created by wangtao on 2017/8/10.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import "WTEmoticonPageView.h"

@implementation WTEmoticonPageView

- (void)setPage:(NSUInteger)page {
    
    _page = page;
    self.backgroundColor = [UIColor whiteColor];
    [self addEmotionButtons];
}

- (void)addEmotionButtons {
    
    int row = 1;
    CGFloat space = (kMainScreenWidth - EmotionRowCount * kEmotionW) / (EmotionRowCount + 1);
    for (int i = 0; i < EmotionPageCount; i ++) {
        
        row = i / EmotionRowCount + 1;
        WTEmoticonButton *btn = [[WTEmoticonButton alloc]init];
        btn.frame = CGRectMake((1 + i - (EmotionRowCount * (row - 1))) * space + (i - (EmotionRowCount * (row - 1))) * kEmotionW, space * row + (row - 1) * kEmotionW, kEmotionW, kEmotionW);
        if (i == EmotionPageCount - 1) {
            [btn setImage:[UIImage imageNamed:kEmotionDelete] forState:UIControlStateNormal];
            btn.wt_size = CGSizeMake(kEmotionW + space, kEmotionW + space);
            CGFloat X = btn.wt_x;
            CGFloat Y = btn.wt_y;
            btn.wt_x = X - space / 3;
            btn.wt_y = Y - space / 3;
            [btn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }else {
            btn.emotionName = [NSString stringWithFormat:@"%.f",((CGFloat)i + 0 + 20 * self.page)];
            [btn addTarget:self action:@selector(emotionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:btn];
    }
}

//删除按钮事件
- (void)deleteBtnClick:(WTEmoticonButton *)deleteButton {
    
    if (self.deleteButtonClick) {
        self.deleteButtonClick(deleteButton);
    }
}

//表情事件
- (void)emotionButtonClick:(WTEmoticonButton *)emotionButton {
    
    if (self.emotionButtonClick) {
        self.emotionButtonClick(emotionButton);
    }
}



@end
