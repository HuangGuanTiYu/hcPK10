//
//  HomeDetailController.m
//  HBFrame
//
//  Created by   on 2018/7/2.
//  Copyright © 2018年 guahibo. All rights reserved.
//

#import "HomeDetailController.h"
#import "HomeDetailViewModel.h"
#import "CountdownOpenView.h"
#import "HomeDetailHeaderView.h"
#import "BJSCVideoViewController.h"
#import "CQSSCVideoViewController.h"

@interface HomeDetailController (){
    
    //倒计时
    CountdownOpenView *countdownView;
    
    HomeDetailHeaderView *headerView;
}

/** 倒计时时间 */
@property (assign, nonatomic) int lotteryStopTime;

/** 本期数据 */
@property (retain, nonatomic) NSDictionary *currentDict;

/** 上期开奖数据 */
@property (retain, nonatomic) NSDictionary *previousDict;

@end

@implementation HomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = MainBGColor;
    
    self.title = self.deailName;
    
    // *** 倒计时开奖
    countdownView = [[CountdownOpenView alloc] initWithFrame:CGRectMake(0, 10, ScreenW, 60)];
    [self.view addSubview:countdownView];
    
    int tempOpenVideoLength = 0;
    
    if (![self.lotteryType isEqualToString:@"bjsc"] && ![self.lotteryType isEqualToString:@"cqssc"]) {
        tempOpenVideoLength = 30;
    }
    
    __weak __typeof(self)weakSelf = self;

    // *** 上期开奖
    headerView = [[HomeDetailHeaderView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(countdownView.frame) + 10, ScreenW, 205 - tempOpenVideoLength)];
    [self.view addSubview:headerView];
    
    headerView.resultButtonBlock = ^{

        if ([weakSelf.lotteryType isEqualToString:@"bjsc"]) {
            BJSCVideoViewController * bjscVc = [[BJSCVideoViewController alloc]init];
            bjscVc.lotteryperiod = self.previousDict[@"period"];
            bjscVc.lotteryType = self.lotteryType;
            [self.navigationController pushViewController:bjscVc animated:NO];
        }else if([weakSelf.lotteryType isEqualToString:@"cqssc"]){
            CQSSCVideoViewController * cqsscVc = [[CQSSCVideoViewController alloc]init];
            cqsscVc.lotteryperiod = self.previousDict[@"period"];
            cqsscVc.lotteryType = self.lotteryType;
            cqsscVc.lotteryTime = self.currentDict[@"prizetime"];
            [self.navigationController pushViewController:cqsscVc animated:NO];
        }else{            
            
            
        }
    };

    [self setUpData];

    // *** 倒计时结束
    countdownView.TimerStopComplete = ^(){
        
        [weakSelf setUpData];
        
    };
}

- (void) setUpData
{
    static BOOL requestStatus = NO;
    
    if (requestStatus) {
        return;
    }
    requestStatus = YES;
    
    [HomeDetailViewModel getBuyLotteryListWithType:self.lotteryType andPlayType:nil andMarketType:self.marketType blockCompletion:^(NSDictionary * _Nullable currentDict, NSDictionary * _Nullable previousDict, NSArray * _Nullable lotteryArr, NSArray * _Nullable buyTypeArr) {
        
        requestStatus = NO;
        
        // *** 刷新倒计时显示
        self.currentDict = currentDict;
        [countdownView refreshCountdownWithDict:currentDict];
        countdownView.hidden = NO;
        
        // *** 上期开奖
        self.previousDict = previousDict;
        
        // *** 判断类型是否空
        if (self.playType == nil) {
            self.playType = buyTypeArr[0][@"type"];
        }
        
        [headerView refreshOnLotteryWithDict:self.previousDict andHeaderView:nil andLotteryType:self.lotteryType];

        
    } withError:^(NSString * _Nullable errorMessage) {
        
        
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

@end
