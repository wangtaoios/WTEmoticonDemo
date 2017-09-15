//
//  WTEmoticonVC.m
//  WTEmoticonDemo
//
//  Created by wangtao on 2017/8/22.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import "WTEmoticonVC.h"
#import "WTEmoticonInputView.h"

#import <YYTextView.h>
#import <YYText.h>
#import <YYImage.h>

@interface WTEmoticonVC () <YYTextViewDelegate, YYTextKeyboardObserver, EmotionKeyBoardDelegate>

@property (nonatomic, strong) YYTextView *textView;
@property (nonatomic, strong) UIView *toolbar;
@property (nonatomic, strong) UIView *toolbarBackground;
@property (nonatomic, strong) UIButton *toolbarEmoticonButton;

@end

@implementation WTEmoticonVC

- (instancetype)init {
    self = [super init];
    [[YYTextKeyboardManager defaultManager] addObserver:self];
    return self;
}

- (void)dealloc {
    [[YYTextKeyboardManager defaultManager] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([self respondsToSelector:@selector( setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self setupNavBar];
    [self setupTextView];
    [self setupToolbar];
    
    [_textView becomeFirstResponder];
}

- (void)setupNavBar {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem.tintColor = kRedColor;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(sure)];
    self.navigationItem.rightBarButtonItem.tintColor = kRedColor;

    self.navigationItem.title = @"发微博";
}

- (void)setupTextView {
    if (_textView) return;
    _textView = [YYTextView new];
    _textView.wt_size = CGSizeMake(self.view.wt_width, self.view.wt_height);
    _textView.textContainerInset = UIEdgeInsetsMake(12, 16, 12, 16);
    _textView.contentInset = UIEdgeInsetsMake(64, 0, kToolbarHeight, 0);
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _textView.extraAccessoryViewHeight = kToolbarHeight;
    _textView.showsVerticalScrollIndicator = NO;
    _textView.alwaysBounceVertical = YES;
    _textView.allowsCopyAttributedString = NO;
    _textView.font = [UIFont systemFontOfSize:17];
    _textView.delegate = self;
    _textView.placeholderText = @"分享新鲜事…";
    _textView.inputAccessoryView = [UIView new];
    [self.view addSubview:_textView];
    
    NSMutableDictionary *mapper = [NSMutableDictionary new];
    for (int i = 0; i < [WTUtils getEmoticonData].allKeys.count; i ++) {
        NSString *valueString = [NSString stringWithFormat:@"%.0f", ((CGFloat)i)];
        [mapper setObject:[self imageWithName:valueString]
                   forKey:[[WTUtils getEmoticonData] allKeysForObject:valueString][0]];
    }
    
    YYTextSimpleEmoticonParser *parser = [YYTextSimpleEmoticonParser new];
    parser.emoticonMapper = mapper;
    
    _textView.textParser = parser;
    
}

- (UIImage *)imageWithName:(NSString *)name
{
    YYImage *image = [YYImage imageNamed:[NSString stringWithFormat:@"smiley_%@", name]];
    image.preloadAllAnimatedImageFrames = YES;
    return image;
}

- (void)setupToolbar {
    if (_toolbar) return;
    _toolbar = [UIView new];
    _toolbar.backgroundColor = [UIColor whiteColor];
    _toolbar.wt_size = CGSizeMake(self.view.wt_width, kToolbarHeight);
    _toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _toolbarBackground = [UIView new];
    _toolbarBackground.backgroundColor = WTHexColor(0xF9F9F9);
    _toolbarBackground.wt_size = CGSizeMake(_toolbar.wt_width, 46);
    _toolbarBackground.wt_bottom = _toolbar.wt_height;
    _toolbarBackground.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [_toolbar addSubview:_toolbarBackground];
    _toolbarBackground.wt_height = kToolbarHeight; 
    
    UIView *line = [UIView new];
    line.backgroundColor = WTHexColor(0xBFBFBF);
    line.wt_width = _toolbarBackground.wt_width;
    line.wt_height = 1;
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [_toolbarBackground addSubview:line];
    
    _toolbarEmoticonButton = [self _toolbarButtonWithImage:@"compose_emoticonbutton_background"
                                                 highlight:@"compose_emoticonbutton_background_highlighted"];
    
    _toolbarEmoticonButton.wt_left = 10;
    _toolbar.wt_bottom = self.view.wt_height;
    [self.view addSubview:_toolbar];
}

- (UIButton *)_toolbarButtonWithImage:(NSString *)imageName highlight:(NSString *)highlightImageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    button.wt_size = CGSizeMake(46, 46);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    button.wt_centerY = 46 / 2;
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [button addTarget:self action:@selector(_buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_toolbarBackground addSubview:button];
    return button;
}

- (void)cancel {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)sure {
    [self.view endEditing:YES];
}

- (void)_buttonClicked:(UIButton *)button {
    if (_textView.inputView) {
        _textView.inputView = nil;
        [_textView reloadInputViews];
        [_textView becomeFirstResponder];
        
        [_toolbarEmoticonButton setImage:[UIImage imageNamed:@"compose_emoticonbutton_background"] forState:UIControlStateNormal];
        [_toolbarEmoticonButton setImage:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"] forState:UIControlStateHighlighted];
    } else {
        WTEmoticonInputView *emoticonInputView = [[WTEmoticonInputView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kKeyBoardH)];
        emoticonInputView.delegate = self;
        _textView.inputView = emoticonInputView;
        [_textView reloadInputViews];
        [_textView becomeFirstResponder];
        
        [_toolbarEmoticonButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background"] forState:UIControlStateNormal];
        [_toolbarEmoticonButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background_highlighted"] forState:UIControlStateHighlighted];
    }
}


- (void)clickEmotionName:(NSString *)name
{
    NSString *emotionString = [[WTUtils getEmoticonData] allKeysForObject:name][0];
    [_textView replaceRange:_textView.selectedTextRange withText:emotionString];
}

- (void)clickDelete
{
    [self.textView deleteBackward];
}

#pragma mark @protocol YYTextViewDelegate
- (void)textViewDidChange:(YYTextView *)textView {

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark @protocol YYTextKeyboardObserver
- (void)keyboardChangedWithTransition:(YYTextKeyboardTransition)transition {
    CGRect toFrame = [[YYTextKeyboardManager defaultManager] convertRect:transition.toFrame toView:self.view];
    if (transition.animationDuration == 0) {
        _toolbar.wt_bottom = CGRectGetMinY(toFrame);
    } else {
        [UIView animateWithDuration:transition.animationDuration delay:0 options:transition.animationOption | UIViewAnimationOptionBeginFromCurrentState animations:^{
            _toolbar.wt_bottom = CGRectGetMinY(toFrame);
        } completion:NULL];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
