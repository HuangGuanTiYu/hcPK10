//
//  CQSSCVideoViewController.m
//  Lottery123
//
//  Created by 项目2 on 16/10/22.
//  Copyright © 2016年 项目. All rights reserved.
//

#define ScaleW [UIScreen mainScreen].bounds.size.height/667.00

#import <AVFoundation/AVFoundation.h>
#import "CQSSCVideoViewController.h"
#import "LotteryVideoModel.h"

@interface CQSSCVideoViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UILabel * thisPeriodLabel;//本期
    UILabel * nextPeriodLabel;//下一期
    UILabel * nextPeriodTimeLabel;//下一期时间
    UILabel * resultLabel;//结果label
    UIButton * againBtn;//重新播放按钮
    NSDictionary * resultDict;//结果数据
}
@property (nonatomic,retain) AVAudioPlayer *movePlayer;
@end

@implementation CQSSCVideoViewController
/******         显示与隐藏 状态栏 客服按钮 禁止与开启左侧滑  *****/
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hiddenAssistButton" object:nil];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showAssistButton" object:nil];
    //取消所有计时器
    [startTimer1 invalidate];
    [startTimer2 invalidate];
    [startTimer3 invalidate];
    [startTimer4 invalidate];
    [startTimer5 invalidate];
    [stopTimer invalidate];
    [changeBgTimer invalidate];
    [self.movePlayer stop];
}
/*******************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //进行界面横屏设置
    self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    self.view.bounds = CGRectMake(0, 0, ScreenH, ScreenW);
    //整体背景
    UIImageView * bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenH, ScreenW)];
    bgImage.image = [UIImage imageNamed:@"cqssc_bg"];
    [self.view addSubview:bgImage];
    //开奖背景
    sscBgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 550 * ScaleW, 262 * ScaleW)];
    sscBgImage.center = CGPointMake(self.view.center.y, self.view.center.x);
    sscBgImage.image = [UIImage imageNamed:@"cqssc_bg_bai"];
    [self.view addSubview:sscBgImage];
    changeBgTimer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changerBgAction) userInfo:nil repeats:YES];
    //期数
    thisPeriodLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 25 * ScaleW, 550 * ScaleW, 30 * ScaleW)];
    thisPeriodLabel.text = [NSString stringWithFormat:@"第%@期",self.lotteryperiod];
    thisPeriodLabel.font = [UIFont boldSystemFontOfSize:25 * ScaleW];
    thisPeriodLabel.textColor = [UIColor whiteColor];
    thisPeriodLabel.textAlignment = 1;
    [sscBgImage addSubview:thisPeriodLabel];
    //下一期
    nextPeriodLabel = [[UILabel alloc]initWithFrame:CGRectMake(40 * ScaleW, 225 * ScaleW, 470 * ScaleW, 20 * ScaleW)];
    nextPeriodLabel.text = [NSString stringWithFormat:@"下一期:%d期",[self.lotteryperiod intValue] + 1];
    nextPeriodLabel.font = [UIFont systemFontOfSize:18 * ScaleW];
    nextPeriodLabel.textColor = [UIColor whiteColor];
    nextPeriodLabel.textAlignment = 0;
    [sscBgImage addSubview:nextPeriodLabel];
    //下一期时间
    nextPeriodTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(40 * ScaleW, 225 * ScaleW, 470 * ScaleW, 20 * ScaleW)];
    nextPeriodTimeLabel.text = [NSString stringWithFormat:@"开奖时间: %@",self.lotteryTime ];
    nextPeriodTimeLabel.font = [UIFont systemFontOfSize:18 * ScaleW];
    nextPeriodTimeLabel.textColor = [UIColor whiteColor];
    nextPeriodTimeLabel.textAlignment = 2;
    [sscBgImage addSubview:nextPeriodTimeLabel];
    //结果
    resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, ScreenW - 40 * Scale, ScreenH, 40 * Scale)];
    resultLabel.text = @"祝君好运!";
    resultLabel.textAlignment = 1;
    resultLabel.font = [UIFont systemFontOfSize:20 * ScaleW ];
    [self.view addSubview:resultLabel];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //默认滚动数组
    dataList = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0", nil];
    myPickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 467 * ScaleW, 85 * ScaleW)];
    myPickView.center = CGPointMake(self.view.center.y, self.view.center.x + 6.0 * ScaleW);
    myPickView.backgroundColor = [UIColor clearColor];
    myPickView.delegate = self;
    myPickView.dataSource = self;
    myPickView.userInteractionEnabled = NO;
    //在当前选择上显示一个透明窗口
    myPickView.showsSelectionIndicator = YES;
    [self.view addSubview:myPickView];
    //初始化，自动转一圈，避免第一次是数组第一个值造成留白
    [myPickView selectRow:[dataList count] inComponent:0 animated:YES];
    [myPickView selectRow:[dataList count] inComponent:1 animated:YES];
    [myPickView selectRow:[dataList count] inComponent:2 animated:YES];
    [myPickView selectRow:[dataList count] inComponent:3 animated:YES];
    [myPickView selectRow:[dataList count] inComponent:4 animated:YES];
    //创建五个imagev  显示结果大小
    UIView * attributeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 467 * ScaleW, 140 * ScaleW)];
    attributeView.center = CGPointMake(self.view.center.y + 1.0 * ScaleW, self.view.center.x + 6.0 * ScaleW);
    attributeView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:attributeView];
    //循环创建属性图片
    for (int i = 0; i < 5; i ++) {
        UIImageView * attributeImage = [[UIImageView alloc]initWithFrame:CGRectMake(93 * i * ScaleW, 0, 91 * ScaleW, 140 * ScaleW)];
        attributeImage.tag = i + 28;
        [attributeView addSubview:attributeImage];
    }
    
    
    stopCount = 0;
    
    //logo
    UIImageView * logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenH/2 - 110 * ScaleW, 11 * ScaleW, 220 * ScaleW, 40 * ScaleW)];
    logoImage.image = [UIImage imageNamed:@"cqssc_title"];
    [self.view addSubview:logoImage];
    //回退按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backBtn.frame = CGRectMake(24 * ScaleW, 13 * ScaleW, 30 * ScaleW, 30 * ScaleW);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"cqssc_back_btn"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchDown];
    //重新播放
    againBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    againBtn.frame = CGRectMake(ScreenH - 54 * ScaleW, 13 * ScaleW, 30 * ScaleW, 30 * ScaleW);
    [againBtn setBackgroundImage:[UIImage imageNamed:@"cqssc_replay_btn"] forState:UIControlStateNormal];
    againBtn.hidden = YES;
    [self.view addSubview:againBtn];
    [againBtn addTarget:self action:@selector(clickAgainBtn) forControlEvents:UIControlEventTouchDown];
    
    
    
    [self startTimerAction];
    
    [self getXinLotteryResultMessage];
}
//取数据
- (void)getXinLotteryResultMessage{
    [LotteryVideoModel getNextLotteryInfoWithLotteryType:self.lotteryType AndPeroid:self.lotteryperiod blockCompletion:^(NSDictionary * _Nullable lotteryDic) {
        resultDict = lotteryDic;
        //取到数据 进行赋值
        self.winNumberArr = lotteryDic[@"current"][@"prizecode"];
        firstBall = [self.winNumberArr[0] intValue];
        secondBall = [self.winNumberArr[1] intValue];
        thirdBall = [self.winNumberArr[2] intValue];
        fourthBall = [self.winNumberArr[3] intValue];
        fifthBall = [self.winNumberArr[4] intValue];
        //数值赋值成功后  开启停止倒计时器
        [self stopTimerAction];
    } withError:^{
        //未取到数据  则继续取
        [self performSelector:@selector(getXinLotteryResultMessage) withObject:nil afterDelay:3];
    }];
}
//停止
- (void)stopTimerAction{
    stopTimer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollStopTimer) userInfo:nil repeats:YES];
}
//取到结果后立马停止计时器
- (void)scrollStopTimer{
    stopCount ++;
    switch (stopCount) {
        case 10:
        {
            [startTimer1 invalidate];
            [myPickView selectRow:[dataList count] + firstBall - 1 inComponent:0 animated:NO];
            UIImageView * imageView1 = [self.view viewWithTag:28];
            if (imageView1) {
                imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"attribute_%d",firstBall]];
            }
        }
            break;

        case 20:
        {
            [startTimer2 invalidate];
            [myPickView selectRow:[dataList count] + secondBall - 1 inComponent:1 animated:NO];
            UIImageView * imageView2 = [self.view viewWithTag:29];
            if (imageView2) {
                imageView2.image = [UIImage imageNamed:[NSString stringWithFormat:@"attribute_%d",secondBall]];
            }
        }
            break;
            
        case 30:
        {
            [startTimer3 invalidate];
            [myPickView selectRow:[dataList count] + thirdBall - 1 inComponent:2 animated:NO];
            UIImageView * imageView3 = [self.view viewWithTag:30];
            if (imageView3) {
                imageView3.image = [UIImage imageNamed:[NSString stringWithFormat:@"attribute_%d",thirdBall]];
            }
        }
            break;
            
        case 40:
        {
            [startTimer4 invalidate];
            [myPickView selectRow:[dataList count] + fourthBall - 1 inComponent:3 animated:NO];
            UIImageView * imageView4 = [self.view viewWithTag:31];
            if (imageView4) {
                imageView4.image = [UIImage imageNamed:[NSString stringWithFormat:@"attribute_%d",fourthBall]];
            }
        }
            break;
            
        case 50:
        {
            [startTimer5 invalidate];
            [stopTimer invalidate];
            [myPickView selectRow:[dataList count] + fifthBall - 1 inComponent:4 animated:NO];
            UIImageView * imageView5 = [self.view viewWithTag:32];
            if (imageView5) {
                imageView5.image = [UIImage imageNamed:[NSString stringWithFormat:@"attribute_%d",fifthBall]];
            }
            
            [self getResultStr:resultDict];
            againBtn.hidden = NO;
            [self playerMP3FromthreeSecond];
        }
            break;
        default:
            break;
    }
}

- (void)startTimerAction{
    //初始化，自动转一圈，避免第一次是数组第一个值造成留白
    [myPickView selectRow:[dataList count] inComponent:0 animated:NO];
    [myPickView selectRow:[dataList count] inComponent:1 animated:NO];
    [myPickView selectRow:[dataList count] inComponent:2 animated:NO];
    [myPickView selectRow:[dataList count] inComponent:3 animated:NO];
    [myPickView selectRow:[dataList count] inComponent:4 animated:NO];
    stopCount = 0;
    statrCount1 = (int)[dataList count];
    statrCount2 = (int)[dataList count];
    statrCount3 = (int)[dataList count];
    statrCount4 = (int)[dataList count];
    statrCount5 = (int)[dataList count];
    startTimer1 =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollStartTimer1) userInfo:nil repeats:YES];
    startTimer2 =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollStartTimer2) userInfo:nil repeats:YES];
    startTimer3 =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollStartTimer3) userInfo:nil repeats:YES];
    startTimer4 =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollStartTimer4) userInfo:nil repeats:YES];
    startTimer5 =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollStartTimer5) userInfo:nil repeats:YES];
}
//五个轮播图计时器的开始
-(void)scrollStartTimer1{
    statrCount1 ++;
    [myPickView selectRow:statrCount1%([dataList count]*50) inComponent:0 animated:YES];
}
-(void)scrollStartTimer2{
    statrCount2 ++;
    [myPickView selectRow:statrCount2%([dataList count]*50) inComponent:1 animated:YES];
}
-(void)scrollStartTimer3{
    statrCount3 ++;
    [myPickView selectRow:statrCount3%([dataList count]*50) inComponent:2 animated:YES];
}
-(void)scrollStartTimer4{
    statrCount4 ++;
    [myPickView selectRow:statrCount4%([dataList count]*50) inComponent:3 animated:YES];
}
-(void)scrollStartTimer5{
    statrCount5 ++;
    [myPickView selectRow:statrCount5%([dataList count]*50) inComponent:4 animated:YES];
}
//重新观看
- (void)clickAgainBtn{
    [self startTimerAction];
    [self performSelector:@selector(stopTimerAction) withObject:nil afterDelay:5];
}
//回退按钮
- (void)clickBackBtn{
    [self.navigationController popViewControllerAnimated:YES];//退出当前界面
}
//切换背景视图
- (void)changerBgAction{
    if (isChangeBG) {
        sscBgImage.image = [UIImage imageNamed:@"cqssc_bg_bai"];

    }else{
        sscBgImage.image = [UIImage imageNamed:@"cqssc_bg_huang"];
    }
    isChangeBG = !isChangeBG;
}
#pragma mark --- pickview delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 65 * ScaleW;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [dataList count]*50;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [dataList objectAtIndex:(row%[dataList count])];
}
//选中picker cell,save ArrayIndex
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSUInteger max = 0;
    NSUInteger base10 = 0;
    if(component == 0)
    {
        max = [dataList count]*50;
        base10 = (max/2)-(max/2)%[dataList count];
        [pickerView selectRow:[pickerView selectedRowInComponent:component]%[dataList count]+base10 inComponent:component animated:false];
    }
}
//用图片代替文字
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIImageView * vieview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
    vieview.image = [UIImage imageNamed:[NSString stringWithFormat:@"figure_%@",[dataList objectAtIndex:(row%[dataList count])]]];
    //隐藏上下线
    ((UIView *)[myPickView.subviews objectAtIndex:1]).backgroundColor = [UIColor clearColor];
    ((UIView *)[myPickView.subviews objectAtIndex:2]).backgroundColor = [UIColor clearColor];
    return vieview;
}
- (void)getResultStr:(NSDictionary *)dict{
    
    NSDictionary * dict2 = dict[@"current"];
    
    
    NSString * helloStr =[NSString stringWithFormat:@"总和: %@  总和单双: %@  总和大小: %@  总和龙虎: %@",dict2[@"info"][0],dict2[@"info"][1],dict2[@"info"][2],dict2[@"info"][3]];
    // ***
    NSRange range1 = [helloStr rangeOfString:[NSString stringWithFormat:@" %@",dict2[@"info"][0]]];
    NSRange range2 = [helloStr rangeOfString:[NSString stringWithFormat:@" %@",dict2[@"info"][1]]];
    NSRange range3 = [helloStr rangeOfString:[NSString stringWithFormat:@" %@",dict2[@"info"][2]]];
    NSRange range4 = [helloStr rangeOfString:[NSString stringWithFormat:@" %@",dict2[@"info"][3]]];
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:helloStr];
    [str addAttribute:NSForegroundColorAttributeName value:NavBGColor range:range1];
    [str addAttribute:NSForegroundColorAttributeName value:NavBGColor range:range2];
    [str addAttribute:NSForegroundColorAttributeName value:NavBGColor range:range3];
    [str addAttribute:NSForegroundColorAttributeName value:NavBGColor range:range4];
    resultLabel.attributedText = str;
}

//播放音乐
-(void) playerMP3FromthreeSecond{
    NSString *thesoundFilePath = [[NSBundle mainBundle] pathForResource:@"kaijiang" ofType:@"mp3"];    //创建音乐文件路径
    if (thesoundFilePath == nil) {
        return;
    }
    NSURL *moveMP3=[NSURL fileURLWithPath:thesoundFilePath];
    NSError *err=nil;
    self.movePlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:moveMP3 error:&err];
    self.movePlayer.volume=0.5f;
    [self.movePlayer prepareToPlay];
    if (err!=nil) {
        NSLog(@"move player init error:%@",err);
    }else {
        [self.movePlayer play];
    }
}
#pragma mark ---- others
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
