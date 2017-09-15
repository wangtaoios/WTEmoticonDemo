//
//  Common.h
//  WTEmoticonDemo
//
//  Created by wangtao on 2017/8/22.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#ifndef Common_h
#define Common_h



#define WTHexColor(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0xFF00) >> 8))/255.0f blue:((float)(rgbValue & 0xFF))/255.0f alpha:1.0f]   //  HEXCOLOR(0xfde802)


/**
 *  系统方法
 */

#define WTWS(weakSelf)          __weak __typeof(self)weakSelf = self;
#define WTSS(strongSelf)        __strong __typeof(weakSelf)strongSelf = weakSelf;

#define kMainScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight       [UIScreen mainScreen].bounds.size.height



// 键盘

//表情按钮宽高
#define kEmotionW           (kMainScreenWidth * 0.0875)
//表情按钮宽高
#define kPageControlH       20
//键盘高度
#define kKeyBoardH          (3 * kEmotionW + 4 * ((kMainScreenWidth - 7 * kEmotionW ) / 8) + kPageControlH)

#define kEmotionDelete      @"expression_delete"


#define kToolbarHeight      (35 + 46)






#define kRedColor               [UIColor redColor]
#define kOrangeColor            [UIColor orangeColor]
#define kYellowColor            [UIColor yellowColor]
#define kGreenColor             [UIColor greenColor]
#define kBlueColor              [UIColor blueColor]
#define kCyanColor              [UIColor cyanColor]
#define kPurpleColor            [UIColor purpleColor]
#define kMagentaColor           [UIColor magentaColor]
#define kBrownColor             [UIColor brownColor]

#define kClearColor             [UIColor clearColor]
#define kBlackColor             [UIColor blackColor]
#define kDarkGrayColor          [UIColor darkGrayColor]
#define kGrayColor              [UIColor grayColor]
#define kLightGrayColor         [UIColor lightGrayColor]
#define kWhiteColor             [UIColor whiteColor]



#endif /* Common_h */
