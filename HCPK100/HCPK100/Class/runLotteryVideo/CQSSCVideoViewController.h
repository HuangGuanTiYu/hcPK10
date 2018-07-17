//
//  CQSSCVideoViewController.h
//  Lottery123
//
//  Created by 项目2 on 16/10/22.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQSSCVideoViewController : UIViewController
{
    UIPickerView *myPickView;
    NSMutableArray *dataList;
    int statrCount1;
    int statrCount2;
    int statrCount3;
    int statrCount4;
    int statrCount5;
    
    int stopCount;
    
    NSTimer * startTimer1;
    NSTimer * startTimer2;
    NSTimer * startTimer3;
    NSTimer * startTimer4;
    NSTimer * startTimer5;
    
    
    
    NSTimer * stopTimer;
    
    //背景视图切换
    NSTimer * changeBgTimer;//计时器 0.1s
    BOOL isChangeBG;//判断切换
    UIImageView * sscBgImage;//背景视图
    //中奖球
    int firstBall;
    int secondBall;
    int thirdBall;
    int fourthBall;
    int fifthBall;
}
@property(nonatomic,strong)NSArray * winNumberArr;
@property(nonatomic,copy) NSString * lotteryType;
@property(nonatomic,copy) NSString * lotteryperiod;
@property(nonatomic,copy) NSString * lotteryTime;
@end
