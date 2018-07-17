//
//  BJSCVideoViewController.h
//  Lottery123
//
//  Created by 项目2 on 16/10/19.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BJSCVideoViewController : UIViewController
{
    UIScrollView * mainScView;//跑道
    NSMutableArray * carImageArr;//车的数组
    int carTime;//车运行时间
    CGFloat scrollViewW;//跑道滚动的距离
    
    //每四秒运动距离数组【顺序】
    NSArray * carFarOne;
    NSArray * carFarTwo;
    NSArray * carFarThree;
    NSArray * carFarFour;
    NSArray * carFarFive;
    NSArray * carFarSix;
    NSArray * carFarSeven;
    NSArray * carFarEight;
    NSArray * carFarNine;
    NSArray * carFarTen;
    //跑到倒计时
    NSTimer * paodaoTimer;
    //排列名次后  总数组
    NSMutableArray * totalArr;
    //////////龙虎
    UILabel * tigerLabel1;
    UILabel * tigerLabel2;
    UILabel * tigerLabel3;
    UILabel * tigerLabel4;
    UILabel * tigerLabel5;
    NSArray * tigerLabelArr;
    //////////总和
    UILabel * totalLabel1;
    UILabel * totalLabel2;
    UILabel * totalLabel3;
    NSArray * totalLabelArr;
    ////////期数
    UILabel * periodLabel;
    ////////时间
    UILabel * timeLabel;
}
@property(nonatomic,copy) NSString * lotteryType;
@property(nonatomic,copy) NSString * lotteryperiod;
@end
