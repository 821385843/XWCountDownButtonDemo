//
//  XWCountDownButton.m
//  XWCountDownDemo
//
//  Created by huanlv on 2017/7/19.
//  Copyright © 2017年 Wade Xie. All rights reserved.
//

#import "XWCountDownButton.h"

@interface XWCountDownButton() {
    dispatch_queue_t _queue ;
    dispatch_source_t _timer;
    NSString *_title;
    NSInteger _count;
}

@end

@implementation XWCountDownButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.totalTime = 60;
        self.countDownType = XWCountDownTypeDefault;
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    
    if (!_count) {
        _title = title;
        _count++;
    }
}
/**
 button title 60s倒计时
 */
- (void)startCountDown {
    self.userInteractionEnabled = NO;
    // 倒计时时间
    __block int timeout = self.totalTime - 1;
    _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,_queue);
    // 每秒执行
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0);
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        // 倒计时结束，关闭
        if (timeout <= 0) {
            dispatch_source_cancel(self->_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.userInteractionEnabled = YES;
                [weakSelf setTitle:self->_title forState:UIControlStateNormal];
            });
        } else {
            int seconds = timeout % weakSelf.totalTime;
            NSString *strTime = [weakSelf getTimeTypeWithSeconds:seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitle:[NSString stringWithFormat:@"%@",strTime] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
- (NSString *)getTimeTypeWithSeconds:(int)seconds {
    switch (self.countDownType) {
        case XWCountDownTypeDefault:
            return [NSString stringWithFormat:@"%d", seconds];
            
            break;
        case XWCountDownTypeOne:
            return [NSString stringWithFormat:@"%ds", seconds];
            
            break;
        case XWCountDownTypeTwo:
            return [NSString stringWithFormat:@"%.2d", seconds];
            break;
        case XWCountDownTypeThree:
            return [NSString stringWithFormat:@"%.2ds", seconds];
            break;
            
        default:
            break;
    }
}

@end
