//
//  ViewController.m
//  XWCountDownButtonDemo
//
//  Created by 谢伟 on 2018/11/16.
//  Copyright © 2018 谢伟. All rights reserved.
//

#import "ViewController.h"
#import "XWCountDownButton_OC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUIWithFrame: CGRectMake(50, 100, 150, 50) CountDownType: XWCountDownTypeDefault BorderColor: [UIColor redColor].CGColor];
    [self setupUIWithFrame: CGRectMake(50, 170, 150, 50) CountDownType: XWCountDownTypeOne BorderColor: [UIColor purpleColor].CGColor];
    [self setupUIWithFrame: CGRectMake(50, 240, 150, 50) CountDownType: XWCountDownTypeTwo BorderColor: [UIColor yellowColor].CGColor];
    [self setupUIWithFrame: CGRectMake(50, 310, 150, 50) CountDownType: XWCountDownTypeThree BorderColor: [UIColor blueColor].CGColor];
}

- (void)setupUIWithFrame:(CGRect)frame CountDownType:(XWCountDownType)countDownType BorderColor:(CGColorRef)borderColor {
    XWCountDownButton *btn = [[XWCountDownButton alloc] initWithFrame:frame];
    btn.totalTime = 12;
    btn.countDownType = countDownType;
    [btn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    btn.layer.borderColor = borderColor;
    btn.layer.borderWidth = 5.0f;
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick:(XWCountDownButton *)btn {
    [btn startCountDown];
}

@end
