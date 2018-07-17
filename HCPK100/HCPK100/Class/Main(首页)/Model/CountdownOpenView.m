//
//  CountdownOpenView.m
//  Lottery123
//
//  Created by 项目 on 16/9/25.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "CountdownOpenView.h"

@implementation CountdownOpenView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initMainView];
    }
    return self;
}


-(void) _initMainView{
    
    UIView *timeBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    timeBGView.backgroundColor = [UIColor whiteColor];
    [self addSubview:timeBGView];
    
    
    
    lotteryTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 20)];
    lotteryTypeLabel.font = [UIFont systemFontOfSize:16];
    [timeBGView addSubview:lotteryTypeLabel];
    
    // *** 适配5
    CGFloat tempFont = 12;
    if (ScreenW == 320) {
        tempFont = 11;
        lotteryTypeLabel.font = [UIFont systemFontOfSize:14];
    }
    
    
    
    // *** 获取占用大小
    NSDictionary *arrtributeDic = @{ NSFontAttributeName : lotteryTypeLabel.font};
    //b) 通过获取的字体属性，计算content的frame大小
    CGRect frame = [lotteryTypeLabel.text boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:arrtributeDic context:nil];
    
    // *** 当前期数
    lotteryNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 + frame.size.width, 10, ScreenW - 50, 20)];
    lotteryNumLabel.font = [UIFont systemFontOfSize:tempFont];
    [timeBGView addSubview:lotteryNumLabel];
    
    
    // *** 今日输赢
    myWinLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 35, ScreenW - 130 * Scale - 20, 20)];
    myWinLabel.textColor = [UIColor blackColor];
    [timeBGView addSubview:myWinLabel];
    
    
    
    // *** 分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(ScreenW - 130 * Scale, 0, 1, 60)];
    lineView.backgroundColor = MainBGColor;
    [timeBGView addSubview:lineView];
    
    
    UILabel *stopJoinLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 135 * Scale, 5, 135 * Scale, 20)];
    stopJoinLabel.textAlignment = NSTextAlignmentCenter;
    stopJoinLabel.font = [UIFont systemFontOfSize:13];
    stopJoinLabel.text = @"距截止开奖";
    [timeBGView addSubview:stopJoinLabel];
    
    
    
    // *** 适配5
    CGFloat timeFont = 16;
    if (ScreenW == 320) {
        timeFont = 14;
    }
    
    // *** 截止时间
    // *** 时
    self.hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 110 * Scale, 25, 25 * Scale, 27)];
    self.hourLabel.textAlignment = NSTextAlignmentCenter;
    self.hourLabel.font = [UIFont systemFontOfSize:timeFont];
    self.hourLabel.textColor = [UIColor whiteColor];
    self.hourLabel.backgroundColor = HUIRGBCOLOR(65, 65, 65);
    self.hourLabel.layer.cornerRadius = 5;
    self.hourLabel.layer.masksToBounds = YES;
    [timeBGView addSubview:self.hourLabel];
    self.hourLabel.text = @"00";
    
    // *** 分
    self.minuteLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 80 * Scale, 25, 25 * Scale, 27)];
    self.minuteLabel.textAlignment = NSTextAlignmentCenter;
    self.minuteLabel.font = [UIFont systemFontOfSize:timeFont];
    self.minuteLabel.textColor = [UIColor whiteColor];
    self.minuteLabel.backgroundColor = HUIRGBCOLOR(65, 65, 65);
    self.minuteLabel.layer.cornerRadius = 5;
    self.minuteLabel.layer.masksToBounds = YES;
    [timeBGView addSubview:self.minuteLabel];
    self.minuteLabel.text = @"00";
    
    // *** 秒
    self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 50 * Scale, 25, 25 * Scale, 27)];
    self.secondLabel.textAlignment = NSTextAlignmentCenter;
    self.secondLabel.font = [UIFont systemFontOfSize:timeFont];
    self.secondLabel.textColor = [UIColor whiteColor];
    self.secondLabel.backgroundColor = HUIRGBCOLOR(65, 65, 65);
    self.secondLabel.layer.cornerRadius = 5;
    self.secondLabel.layer.masksToBounds = YES;
    [timeBGView addSubview:self.secondLabel];
    self.secondLabel.text = @"00";
    
    
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 85 * Scale, 25, 5 * Scale, 27)];
    tempLabel.text = @":";
    tempLabel.textAlignment = NSTextAlignmentCenter;
    tempLabel.font = [UIFont systemFontOfSize:timeFont];
    [timeBGView addSubview:tempLabel];
    
    
    
    UILabel *tempLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 55 * Scale, 25, 5 * Scale, 27)];
    tempLabel1.text = @":";
    tempLabel1.textAlignment = NSTextAlignmentCenter;
    tempLabel1.font = [UIFont systemFontOfSize:timeFont];
    [timeBGView addSubview:tempLabel1];
    
    
    
}

-(void)refreshCountdownWithDict:(NSDictionary *)countdownDict{
    
    NSString *lotteryType = [countdownDict objectForKey:@"name"];
    
    //字条串是否包含有某字符串
    if ([lotteryType rangeOfString:@" "].location == NSNotFound) {
        lotteryTypeLabel.text = lotteryType;
    } else {
        NSArray *tempArr = [lotteryType componentsSeparatedByString:@" "];
        
        NSRange typerange = [lotteryType rangeOfString:tempArr[1]];
        
        NSMutableAttributedString *typestr = [[NSMutableAttributedString alloc] initWithString:lotteryType];
        [typestr addAttribute:NSForegroundColorAttributeName value:NavBGColor range:typerange];
        lotteryTypeLabel.attributedText = typestr;
    }
    
    
    
    
    // *** 获取占用大小
    CGRect frame = [lotteryTypeLabel.text boundingRectWithSize:CGSizeMake(ScreenW-160, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : lotteryTypeLabel.font} context:nil];
    
    // *** 当前期数
    lotteryNumLabel.frame = CGRectMake(20 + frame.size.width, 10, ScreenW - 50, 20);
    lotteryNumLabel.text = [NSString stringWithFormat:@"%@期",[countdownDict objectForKey:@"period"]];
    
    
    myWinLabel.adjustsFontSizeToFitWidth = NO;;
    // *** 适配5
    CGFloat tempFont = 12;
    if (ScreenW == 320) {
        tempFont = 11;
    }
    myWinLabel.font = [UIFont systemFontOfSize:tempFont];
    
    myWinLabel.text = [NSString stringWithFormat:@"开奖时间：%@",[countdownDict objectForKey:@"prizetime"]];;
    
    // *** 判断是否自动字体大小
    CGRect winLabelFram = [myWinLabel.text boundingRectWithSize:CGSizeMake(ScreenW, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : myWinLabel.font} context:nil];
    if (winLabelFram.size.width > ScreenW - 130 * Scale - 20) {
        myWinLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    
    
    // *** 判断倒计时时间
    int fireTime = [[countdownDict objectForKey:@"countdown"] intValue];
    if (fireTime > 0) {
        // *** 启动倒计时
        [self fireWithTimeIntervar:[[countdownDict objectForKey:@"countdown"] intValue]];
        
    }else{
        
        self.lotteryStopTime = 0;
        
        [self stopCountdown];
        
        self.hourLabel.text = @"00";
        self.minuteLabel.text = @"00";
        self.secondLabel.text = @"00";
    }
    
}



-(void) action{
    
    if (self.lotteryStopTime > 0) {
        
        // *** 显示
        [self updateShowCountdown];
        
        self.lotteryStopTime --;
    }else{
        self.hourLabel.text = @"00";
        self.minuteLabel.text = @"00";
        self.secondLabel.text = @"00";
        
        // 结束的回调
        if (_TimerStopComplete) {
            _TimerStopComplete();
        }
        
        // *** 关闭定时器
        [self stopCountdown];
        
        
    }
}


//刷新倒计时显示
-(void) updateShowCountdown{
    
    int days = (int)(self.lotteryStopTime/(3600*24));
    int hours = (int)((self.lotteryStopTime-days*24*3600)/3600);
    int minute = (int)(self.lotteryStopTime-days*24*3600-hours*3600)/60;
    int second = self.lotteryStopTime-days*24*3600-hours*3600-minute*60;
    
    
    
    hours = hours + days * 24;
    
    if (hours >= 100) {
        self.hourLabel.frame = CGRectMake(ScreenW - 115 * Scale, 25, 30 * Scale, 27);
    }else{
        self.hourLabel.frame = CGRectMake(ScreenW - 110 * Scale, 25, 25 * Scale, 27);
    }
    
    if (hours < 10) {
        self.hourLabel.text = [NSString stringWithFormat:@"0%d",hours];
    }else {
        self.hourLabel.text = [NSString stringWithFormat:@"%d",hours];
    }
    if (minute < 10) {
        self.minuteLabel.text = [NSString stringWithFormat:@"0%d",minute];
    }else{
        self.minuteLabel.text = [NSString stringWithFormat:@"%d",minute];
    }
    if (second < 10) {
        self.secondLabel.text = [NSString stringWithFormat:@"0%d",second];
    }else {
        self.secondLabel.text = [NSString stringWithFormat:@"%d",second];
    }
}

//停止
-(void) stopCountdown{
    [countdownTimer invalidate];
    countdownTimer = nil;
}
/**
 *  根据指定时间间隔开始倒计时
 */
- (void)fireWithTimeIntervar:(NSTimeInterval)timerInterval{
    
    // *** 设置倒计时时间
    self.lotteryStopTime = timerInterval;
    
    [self updateShowCountdown];
    
    
    // *** 设置无效
    [countdownTimer invalidate];
    countdownTimer = nil;
    
    // *** 初始化定时器
    if (countdownTimer == nil) {
        countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
    }
    
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

