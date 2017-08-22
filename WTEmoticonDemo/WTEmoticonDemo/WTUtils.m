//
//  WTUtils.m
//  WTEmoticonDemo
//
//  Created by wangtao on 2017/8/22.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import "WTUtils.h"

@implementation WTUtils

+ (NSDictionary *)getEmoticonData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emotion" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    return dic;
}

@end
