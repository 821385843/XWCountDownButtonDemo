//
//  XWCountDownButton.h
//  XWCountDownDemo
//
//  Created by huanlv on 2017/7/19.
//  Copyright © 2017年 Wade Xie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    XWCountDownTypeDefault,
    XWCountDownTypeOne,
    XWCountDownTypeTwo,
    XWCountDownTypeThree
} XWCountDownType;

@interface XWCountDownButton : UIButton
/**
 倒计时的总时间
 注：不设置，则默认倒计时的总时间是60s
 */
@property (nonatomic,assign) int totalTime;
/**
 倒计时显示的样式
 eg:
 XWCountDownDefault -- 5
 XWCountDownOne -- 5s
 XWCountDownTwo -- 05
 XWCountDownThree -- 05s
 */
@property (nonatomic,assign) XWCountDownType countDownType;
/**
 开始倒计时
 */
- (void)startCountDown;

@end
