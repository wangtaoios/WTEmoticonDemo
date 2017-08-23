//
//  ViewController.m
//  WTEmoticonDemo
//
//  Created by wangtao on 2017/8/22.
//  Copyright © 2017年 xikaijinfu. All rights reserved.
//

#import "ViewController.h"
#import "WTEmoticonVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"点击界面发微博";

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    WTEmoticonVC *vc = [[WTEmoticonVC alloc] init];
    UINavigationController *uina = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:uina animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
