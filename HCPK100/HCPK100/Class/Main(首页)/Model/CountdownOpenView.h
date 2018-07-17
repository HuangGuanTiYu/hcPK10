//
//  CountdownOpenView.h
//  Lottery123
//
//  Created by 项目 on 16/9/25.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownOpenView : UIView{
    
    UILabel *lotteryTypeLabel;
    
    //期数
    UILabel *lotteryNumLabel;
    
    //输赢
    UILabel *myWinLabel;
    
    
    //
    NSTimer *countdownTimer;
    
    
}

/**
 *  结束的回调
 */
@property (nonatomic, copy) void (^TimerStopComplete)();


/** 倒计时时间 */
@property (assign, nonatomic) int lotteryStopTime;

/** 小时 */
@property (retain, nonatomic) UILabel *hourLabel;
/** 分钟 */
@property (retain, nonatomic) UILabel *minuteLabel;
/** 秒 */
@property (retain, nonatomic) UILabel *secondLabel;



/**
 *  更新显示信息
 */
-(void) refreshCountdownWithDict:(NSDictionary*)countdownDict;

/**
 *  暂停
 */
-(void) stopCountdown;

@end
