//
//  WTEmoticonButton.m
//  WestDevelopment
//
//  Created by wangtao on 2017/8/10.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import "WTEmoticonButton.h"

@implementation WTEmoticonButton

- (void)setEmotionName:(NSString *)emotionName {
    
    _emotionName = emotionName;
    
    NSString *name = [NSString stringWithFormat:@"smiley_%@", emotionName];
    UIImage *image = [UIImage imageNamed:name];
    if (image) {[self setImage:image forState:UIControlStateNormal];}
    self.userInteractionEnabled = image == nil ? NO : YES;
}


@end
