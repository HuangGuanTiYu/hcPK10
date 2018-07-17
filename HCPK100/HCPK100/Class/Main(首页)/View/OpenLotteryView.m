//
//  OpenLotteryView.m
//  Lottery123
//
//  Created by 项目2 on 16/10/15.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "OpenLotteryView.h"
@interface OpenLotteryView()
{
    CGFloat ballW;
    NSTimer * timer;
    int countTime;
    UILabel * whatLotteryLabel;//  种
    UILabel * runLotteryTime;//下棋开奖倒计时
    UILabel * countDownLabel;//倒计时时间
    
    
    ///////
    NSString * dayStr;
    NSString * hourStr;
    NSString * minutesStr;
    NSString * secondStr;
    
    
}
@end
@implementation OpenLotteryView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        ballW = 25 * Scale;
        //  种
        whatLotteryLabel = [[UILabel alloc]init];
        whatLotteryLabel.font = [UIFont systemFontOfSize:16 * Scale];
        [self addSubview:whatLotteryLabel];//  种
        //下期开奖倒计时label
        runLotteryTime = [[UILabel alloc]init];
        [self addSubview:runLotteryTime];//下期开奖倒计时
        runLotteryTime.textColor = [UIColor grayColor];
        runLotteryTime.font = [UIFont systemFontOfSize:12 * Scale];
        runLotteryTime.text = @"下期开奖倒计时";
        //倒计时label
        countDownLabel = [[UILabel alloc]init];
        countDownLabel.textColor = NavBGColor;
        countDownLabel.font = [UIFont systemFontOfSize:12 * Scale];
        [self addSubview:countDownLabel];//倒计时时间
        
        UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(20 * Scale, 90 * Scale - 1, ScreenW -20 * Scale, 1)];
        lineLabel.backgroundColor = SeparateLineColor;
        [self addSubview:lineLabel];
        
    }
    return self;
}

- (void)createdControls:(NSDictionary *)dict {
    
    runLotteryTime.text = [NSString stringWithFormat:@"%@开奖倒计时",dict[@"period"]];
    countTime = [dict[@"countdown"] intValue];
    
    
    
    int tempFont;//字体大小
    //开奖球
    float tempBallW;
    if (ScreenW == 320) {
        tempBallW = 25;
        tempFont = 10;
    }else{
        tempBallW = 30;
        tempFont = 13;
    }
    
    
    // *** 数字数据
    NSMutableArray * ballArr = dict[@"prizecode"];
    
    int tempCount = ballArr.count;
    
    // *** 判断是否运算
    if ([[dict objectForKey:@"prizetype"] isEqualToString:@"add"]) {
        tempCount ++;
        
        // *** 计算和
        NSNumber *sum = [ballArr valueForKeyPath:@"@sum.floatValue"];
        
        // *** 添加和
        ballArr = [[NSMutableArray alloc] initWithArray:ballArr];
        [ballArr addObject:[NSString stringWithFormat:@"%d",sum.intValue]];
        
    }
    
    // *** 颜色数组
    NSArray *ballColorArr = dict[@"prizecolor"];
    
    for (int i = 0; i < ballArr.count; i ++) {
        
        // *** 球
        UILabel  * ballLabel = [self viewWithTag:i+928];
        if (ballLabel == nil) {
            ballLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + i * (tempBallW + 3), 15 * Scale, tempBallW, tempBallW)];
            ballLabel.font = [UIFont systemFontOfSize:15];//字体
            ballLabel.textColor = [UIColor whiteColor];//颜色
            ballLabel.textAlignment = 1;//居中
            ballLabel.layer.cornerRadius = tempBallW/2.00;//圆角
            ballLabel.layer.masksToBounds = YES;
            ballLabel.tag = i + 928;//标记值
            [self addSubview:ballLabel];
        }else{
            ballLabel.hidden = NO;
        }
        
        // *** 运算符
        UILabel *operatorLabel = [self viewWithTag:i+828];
        
        if ([[dict objectForKey:@"prizetype"] isEqualToString:@"add"]) {
            
            ballLabel.frame = CGRectMake(15 + i * (tempBallW + 15), 15 * Scale, tempBallW, tempBallW);
            
            // *** 判断运算符
            if (operatorLabel == nil) {
                operatorLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + tempBallW + 3 + i * (tempBallW + 15), 15 * Scale, 10, tempBallW)];
                operatorLabel.font = [UIFont systemFontOfSize:15];//字体
                operatorLabel.textAlignment = 1;//居中
                operatorLabel.tag = i + 828;//标记值
                [self addSubview:operatorLabel];
            }else{
                operatorLabel.hidden = NO;
            }
            
            // *** 判断显示运算符
            if (i == ballArr.count - 2) {
                operatorLabel.text = @"=";
            }else if (i < ballArr.count - 2){
                operatorLabel.text = @"+";
            }else{
                operatorLabel.text = @"";
            }
            
        }else{
            ballLabel.frame = CGRectMake(15 + i * (tempBallW + 4), 15 * Scale, tempBallW, tempBallW);
            
            if (operatorLabel != nil) {
                operatorLabel.hidden = YES;
            }
        }
        
        ballLabel.text = [NSString stringWithFormat:@"%@",ballArr[i]];//数字
        
        ballLabel.backgroundColor = HUIColorFromRGB(@"0xE72F17");
        
        // *** 判断是否会越界
        if (i < ballColorArr.count) {
            NSString *ballColorStr = ballColorArr[i];
            if (ballColorStr == nil || [ballColorStr isEqualToString:@""]) {
                ballColorStr = @"0xE72F17";
            }
            ballLabel.backgroundColor = HUIColorFromRGB(ballColorStr);
        }
    }
    
    
    
    
    
    if (tempIndex > ballArr.count) {
        for (int i = (int) ballArr.count; i < tempIndex; i ++) {
            
            UILabel *tempLabel = [self viewWithTag:928 + i];
            tempLabel.hidden = YES;
            
        } 
    }
    tempIndex = (int)ballArr.count;
    
    
    //开奖  种名字
    NSString * whatLotteryStr = dict[@"title"];
    whatLotteryLabel.frame = CGRectMake(23 * Scale,  + 55 * Scale, 110 * Scale, 25 * Scale);
    whatLotteryLabel.text = whatLotteryStr;
    //开奖时间
    runLotteryTime.frame = CGRectMake(CGRectGetMaxX(whatLotteryLabel.frame)+ 10 * Scale, 55 * Scale, 130 * Scale, 25 * Scale);
       [self addSubview:runLotteryTime];
    //倒计时
    countDownLabel.frame = CGRectMake(CGRectGetMaxX(runLotteryTime.frame)+ 10 * Scale,  + 55 * Scale, 90 * Scale, 25 * Scale);

    [timer invalidate];
    if (countTime > 0){
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownTime) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refershNewLottery" object:nil];
    }
}
- (void)countDownTime{
    countTime --;
    [self updateShowCountdown:countTime];
    if (countTime < 1) {
        [timer invalidate];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refershNewLottery" object:nil];
    }
}

//倒计时时间显示
-(void) updateShowCountdown:(int) lotteryOpenTime{
    int days = (int)(lotteryOpenTime/(3600*24));
    int hours = (int)((lotteryOpenTime-days*24*3600)/3600);
    int minute = (int)(lotteryOpenTime-days*24*3600-hours*3600)/60;
    int second = lotteryOpenTime-days*24*3600-hours*3600-minute*60;
    hours = hours + days * 24;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (hours < 10) {
            hourStr = [NSString stringWithFormat:@"0%d",hours];
        }else {
            hourStr = [NSString stringWithFormat:@"%d",hours];
        }
        if (minute < 10) {
            minutesStr = [NSString stringWithFormat:@"0%d",minute];
        }else{
            minutesStr = [NSString stringWithFormat:@"%d",minute];
        }
        if (second < 10) {
            secondStr = [NSString stringWithFormat:@"0%d",second];
        }else {
            secondStr = [NSString stringWithFormat:@"%d",second];
        }
        countDownLabel.text = [NSString stringWithFormat:@"%@:%@:%@",hourStr,minutesStr,secondStr];
    });
}






@end
