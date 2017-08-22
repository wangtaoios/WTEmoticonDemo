//
//  WTEmoticonInputView.m
//  WTEmotionByYYKit
//
//  Created by wangtao on 2017/8/10.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import "WTEmoticonInputView.h"
#import "WTEmoticonPageView.h"

#define sendBtnW 60

#define rows 3


@interface WTEmoticonInputView ()<UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *baseView;

@property(nonatomic, strong) UIPageControl *pageControl;

/*
 * 用来判断是否是仅取消文字键盘的第一响应,不处理控件的改变;
 * 只有在键盘切换时候赋值为yes，其他任何情况都是no;
 * 用来解决切换键盘闪动的问题
 */
//@property(nonatomic, assign) BOOL onlyHideSysKboard;

@end

@implementation WTEmoticonInputView

#pragma mark ==== 懒加载 ====


- (UIPageControl *)pageControl {
    
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControl.hidesForSinglePage = YES;
    }
    return _pageControl;
}



//根视图（最底部滚动视图）
- (UIScrollView *)baseView {
    
    if (!_baseView) {
        _baseView = [[UIScrollView alloc]init];
        _baseView.pagingEnabled = YES;
        _baseView.bounces = NO;
        _baseView.delegate = self;
        _baseView.showsHorizontalScrollIndicator = NO;
    }
    return _baseView;
}

#pragma mark ==== 重载系统方法 ====

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self methods];
    }
    return self;
}
#pragma mark ==== 自定义方法 ====

+ (instancetype)showKeyBoardInView:(UIView *)view {
    
    if (!view) {return nil;}
    WTEmoticonInputView *keyboard = [[WTEmoticonInputView alloc]init];
    [view addSubview:keyboard];
    return keyboard;
}
- (void)methods {
    
    [self initSomeThing];
    [self configureSubViews];
    [self initSubViewFrames];
    [self creatPageViews];
}

//初始化参数
- (void)initSomeThing {
    
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor whiteColor];
}
//配置子视图
- (void)configureSubViews {
    
    [self addSubview:self.baseView];
    [self addSubview:self.pageControl];
}

- (void)initSubViewFrames {
    
    CGFloat kPageH = (kMainScreenWidth - EmotionRowCount * EmotionBtnW) / (EmotionRowCount + 1);
    _pageControl.numberOfPages = ceilf([WTUtils getEmoticonData].allKeys.count / 20.f);
    
    self.frame = CGRectMake(0, kMainScreenHeight, kMainScreenWidth, kKeyBoardH - 40);
    self.baseView.frame = CGRectMake(0, 0, kMainScreenWidth, rows * kEmotionW +(rows + 1) * kPageH);
    self.baseView.contentSize = CGSizeMake(kMainScreenWidth * _pageControl.numberOfPages + 1, rows * kEmotionW +(rows + 1) * kPageH);
    self.pageControl.frame = CGRectMake(0, CGRectGetMaxY(self.baseView.frame) + 0, kMainScreenWidth, 10);
}

//根据页数（通过拥有的表情的个数除以每页表情数计算出来）创建pageView
- (void)creatPageViews {
    
    CGFloat kPageH = (kMainScreenWidth - EmotionRowCount * EmotionBtnW) / (EmotionRowCount + 1);
    
    for (int i = 0; i < _pageControl.numberOfPages; i ++) {
        WTEmoticonPageView *pageView = [[WTEmoticonPageView alloc]init];
        pageView.page = i;
        [self.baseView addSubview:pageView];
        pageView.frame = CGRectMake(i * kMainScreenWidth, 0, kMainScreenWidth, rows * kEmotionW +(rows + 1) * kPageH);
        __weak typeof (self) weakSelf = self;
        [pageView setDeleteButtonClick:^(WTEmoticonButton *deleteButton) {
            if ([weakSelf.delegate respondsToSelector:@selector(clickDelete)]) {
                [weakSelf.delegate clickDelete];
            }
        }];
        [pageView setEmotionButtonClick:^(WTEmoticonButton *emotionButton) {
            if ([weakSelf.delegate respondsToSelector:@selector(clickEmotionName:)]) {
                [weakSelf.delegate clickEmotionName:emotionButton.emotionName];
            }
        }];
    }
}


#pragma mark ==== scrollView代理 ====
//改变pageControl
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
}




@end
