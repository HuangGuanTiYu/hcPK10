//
//  BJSCVideoViewController.m
//  Lottery123
//
//  Created by 项目2 on 16/10/19.
//  Copyright © 2016年 项目. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>

#import "BJSCVideoViewController.h"
#import "LotteryVideoModel.h"
#import "CarVideoDoneView.h"//开奖结果视图
//横向比例
#define ScaleW [UIScreen mainScreen].bounds.size.height/667.00
//纵向比例
#define ScaleH [UIScreen mainScreen].bounds.size.width/375.00

@interface BJSCVideoViewController (){
    //新一期的开奖结果
    NSArray * xinLotteryResultArr;
    //新一期开奖结果及 下一期的开奖时间等信息字典
    NSDictionary * xinLotteryDict;
    //轨迹字典
    NSDictionary * guiJiDic;
    //开始倒计时
    NSTimer * startTimer;
    //三秒倒计时
    int  threeSecond;
    //三秒倒计时tupian
    UIImageView * threeSecondImage;
    //遮挡层
    UIView * keepOutView;
    //启动一个两秒计时器  用来排列显示车的名次
    NSTimer * carMingciTimer;
    //结果图层
    CarVideoDoneView * carVideoDoneView;
}
@property (nonatomic,retain) AVAudioPlayer *movePlayer;
@end

@implementation BJSCVideoViewController
/******         显示与隐藏 状态栏 客服按钮 禁止与开启左侧滑  *****/
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hiddenAssistButton" object:nil];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showAssistButton" object:nil];
    //取消所有定时器
    [startTimer invalidate];
    [carMingciTimer invalidate];
    [paodaoTimer invalidate];
    [self.movePlayer stop];
}
/*******************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HUIRGBCOLOR(231, 203, 75);//设置背景色
    //进行界面横屏设置
    self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    self.view.bounds = CGRectMake(0, 0, 667  * ScaleW, 375  * ScaleH);
    //初始化倒计时
    threeSecond = 3;
    
    //////初始化一个赛车名词运动轨迹数组
    NSArray * kongArr  = @[@"0"];
    totalArr = [NSMutableArray new];
    for (int i = 0; i < 10 ; i++) {
        [totalArr addObject:kongArr];
    }
    
    /***车的运动轨迹数组 [倒数 第二次结束时  每辆车距离相等  防止视觉误差]*/
    carFarOne =       @[@"640",@"640",@"640",@"640",@"740"];
    carFarTwo =       @[@"600",@"720",@"640",@"600",@"710"];
    carFarThree =     @[@"700",@"620",@"620",@"620",@"680"];
    carFarFour =      @[@"640",@"720",@"600",@"600",@"650"];
    carFarFive =      @[@"580",@"660",@"660",@"660",@"620"];
    carFarSix =       @[@"640",@"640",@"680",@"600",@"590"];
    carFarSeven =     @[@"630",@"630",@"630",@"670",@"560"];
    carFarEight =     @[@"750",@"600",@"600",@"610",@"530"];
    carFarNine =      @[@"660",@"620",@"660",@"620",@"500"];
    carFarTen =       @[@"580",@"620",@"660",@"700",@"470"];
    /****** 将车的轨迹按名次存入字典 用于名次取运动轨迹**********/
    guiJiDic = [NSDictionary dictionaryWithObjectsAndKeys:carFarOne,@"ranking01",carFarTwo,@"ranking02",carFarThree,@"ranking03",carFarFour,@"ranking04",carFarFive,@"ranking05",carFarSix,@"ranking06",carFarSeven,@"ranking07",carFarEight,@"ranking08",carFarNine,@"ranking09",carFarTen,@"ranking10", nil];
    
    
    //北京赛车logo
    UIImageView * logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(58* ScaleW, 5* ScaleH, 72* ScaleW, 16* ScaleH)];
    logoImage.image = [UIImage imageNamed:@"bjsc_logo"];
    [self.view addSubview:logoImage];
    
    //本期期数
    UILabel * qishuLabel = [[UILabel alloc]initWithFrame:CGRectMake(58* ScaleW, 21* ScaleH, 100* ScaleW, 14* ScaleH)];
    qishuLabel.text = [NSString stringWithFormat:@"本期: %@",self.lotteryperiod];
    qishuLabel.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:qishuLabel];
    
    //名次图片
    for (int i = 0; i < 10 ; i++) {
        UIImageView * carRankingImage = [[UIImageView alloc]initWithFrame:CGRectMake(170* ScaleW + 35 * i * ScaleH,5* ScaleH, 30* ScaleH, 30* ScaleH)];
        carRankingImage.tag = i + 520;
        carRankingImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_card_%d",i + 1]];
        [self.view addSubview:carRankingImage];
    }
    
    //跑道  scrollView
    mainScView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40 * ScaleH, 667 * ScaleW, 284 * ScaleH)];
    mainScView.showsVerticalScrollIndicator = NO;
    mainScView.showsHorizontalScrollIndicator = NO;
    mainScView.backgroundColor = [UIColor clearColor];
    mainScView.userInteractionEnabled = NO;
    [self.view addSubview:mainScView];
    mainScView.contentSize = CGSizeMake(6670, 284);//设置滚动视图的内容区域
    //跑道
    for (int i = 0; i < 10 ; i++) {
        UIImageView * roadImage = [[UIImageView alloc]initWithFrame:CGRectMake(667 * i * ScaleW ,0, 667 * ScaleW, 284 * ScaleH)];
        if (i == 0) {
            roadImage.image  = [UIImage imageNamed:@"bjsc_road_ start"];
        }else{
            roadImage.image  = [UIImage imageNamed:@"bjsc_road_ on"];
        }
        [mainScView addSubview:roadImage];
    }
    //终点图
    UIImageView * winImage = [[UIImageView alloc]initWithFrame:CGRectMake(3000 * ScaleW, 63* ScaleH, 20 * ScaleW, 215 * ScaleH)];
    winImage.image = [UIImage imageNamed:@"bjsc_end"];
    [mainScView addSubview:winImage];
    //车号图  [汽车运动时  保持不动]
    UIImageView * carNumberImage = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenH - 20* ScaleW, 110* ScaleH,12* ScaleW, 208 * ScaleH)];
    carNumberImage.image = [UIImage imageNamed:@"bjsc_car_ number"];
    [self.view addSubview:carNumberImage];
    
    carImageArr = [NSMutableArray new];//初始化赛车图片数组
    //汽车图片 60 * 21.5
    for (int i = 0; i < 10 ; i++) {
        UIImageView * tempImage = [self.view viewWithTag:i + 2012];
        if (tempImage) {
            tempImage.frame = CGRectMake(20 * ScaleW, (63 + 21.5 * i) * ScaleH, 60 * ScaleW, 21.5 * ScaleH);
            tempImage.image  = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_car_%d",i + 1]];
        }else{
            UIImageView * carImage = [[UIImageView alloc]initWithFrame:CGRectMake(20 * ScaleW, (63 + 21.5 * i) * ScaleH, 60 * ScaleW, 21.5 * ScaleH)];
            carImage.tag = i + 2012;
            carImage.image  = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_car_%d",i + 1]];
            [mainScView addSubview:carImage];
            [carImageArr addObject:carImage];
        }
    }

    [self createdOtherControls];
    
    
    //遮挡层
    keepOutView = [[UIView alloc]initWithFrame:CGRectMake(0, 40 * ScaleH, 667 * ScaleW, 284 * ScaleH)];
    keepOutView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
    [self.view addSubview:keepOutView];
    //在遮挡层上添加加载显示器
    UIActivityIndicatorView * activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 667 * ScaleW, 284 * ScaleH)];
    [keepOutView addSubview:activityIndicator];
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [activityIndicator startAnimating];
    //回退按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backBtn.frame = CGRectMake(10* ScaleW, 5* ScaleH, 30* ScaleH, 30 * ScaleH);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"cqssc_back_btn"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(clickBackBtnAction) forControlEvents:UIControlEventTouchDown];
    
    
    //三秒倒计时
    threeSecondImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 491, 119)];
    threeSecondImage.center = CGPointMake(self.view.center.y, self.view.center.x);
    threeSecondImage.hidden = YES;
    threeSecondImage.image = [UIImage imageNamed:@"threeSecoond_3"];
    [self.view addSubview:threeSecondImage];
    
/*******************控件创建   数值初始化  完成*****************************/
    
    //数据获取  赋值
    
    [LotteryVideoModel getLotteryInfoWithLotteryType:self.lotteryType AndPeroid:self.lotteryperiod blockCompletion:^(NSDictionary * _Nullable lotteryDic) {
        
        [self setResultsMessage:lotteryDic];
        [self getNewlotteryRunResult];
    }];
    
    
    
    
}
////////////获取最新一期开奖结果
- (void)getNewlotteryRunResult{
    
    [LotteryVideoModel getNextLotteryInfoWithLotteryType:self.lotteryType AndPeroid:self.lotteryperiod blockCompletion:^(NSDictionary * _Nullable lotteryDic) {
        //取到结果
        xinLotteryDict = lotteryDic;//进行结果赋值
        //有结果并且成功了
        xinLotteryResultArr = lotteryDic[@"current"][@"prizecode"];
        //进行轨迹赋值
        //通过获取的最新结果 进行运动轨迹排序
        for (int  i = 0; i < xinLotteryResultArr.count; i ++) {
            NSString * str;
            if (i + 1 < 10) {
                str = [NSString stringWithFormat:@"0%d",i + 1];
            }else
                str = [NSString stringWithFormat:@"%d",i + 1];
            int tempIndex = (int)[xinLotteryResultArr indexOfObject:str];
            NSString * str2;
            if (tempIndex + 1 < 10) {
                str2 = [NSString stringWithFormat:@"0%d",tempIndex + 1];
            }else
                str2 = [NSString stringWithFormat:@"%d",tempIndex + 1];
            NSArray * arr = guiJiDic[[NSString stringWithFormat:@"ranking%@",str2]];
            [totalArr replaceObjectAtIndex:i withObject:arr];
        }
        //完成后 进行倒计时
        startTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(threeSecondStartTimerAction) userInfo:nil repeats:YES];
        [self playerMP3FromthreeSecond];
        //显示倒计时图层 隐藏加载图层
        threeSecondImage.hidden = NO;
        keepOutView.hidden = YES;
        //创建结果图层
        __block BJSCVideoViewController * weakSelf = self;
        carVideoDoneView =[[CarVideoDoneView alloc]initWith:lotteryDic];
        carVideoDoneView.hidden = YES;
        carVideoDoneView.typeActionBlock = ^(NSString * type){
            if ([type isEqualToString:@"back"]) {
                [weakSelf clickBackBtnAction];
            }else{
                [weakSelf theInitialPosition];
                //完成后 进行倒计时
                startTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(threeSecondStartTimerAction) userInfo:nil repeats:YES];
                keepOutView.hidden = YES;
                carVideoDoneView.hidden = YES;
                threeSecondImage.hidden = NO;
                threeSecondImage.image = [UIImage imageNamed:@"threeSecoond_3"];
                threeSecond = 3;
                [self playerMP3FromthreeSecond];

            }
        };
        [self.view addSubview:carVideoDoneView];
        
    } withError:^{
        //取不到结果则继续取
        [self performSelector:@selector(getNewlotteryRunResult) withObject:nil afterDelay:3];
    }];
}



- (void)clickBackBtnAction{
    [self.navigationController popViewControllerAnimated:NO];
}
//开始  重新观看
- (void)startTimerAction{

    [self scrollViewScrollAction];
    //跑道计时器
//    paodaoTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(scrollViewScrollAction) userInfo:nil repeats:YES];
    //获取当前排名计时器
    carMingciTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(getCarMingciMessage) userInfo:nil repeats:YES];
    //车移动动画
    [self carMoveAction];
}
- (void)theInitialPosition{
    keepOutView.hidden = YES;
    for (int i = 0; i < 10; i ++) {
        UIImageView * tempImage = [self.view viewWithTag:520 + i];
        if (tempImage) {
            tempImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_card_%d",i + 1]];
        }
    }
    if (carVideoDoneView) {
        carVideoDoneView.hidden = YES;
    }
    [paodaoTimer invalidate];
    carTime = 0;
    scrollViewW = 0;
    //高度 375 车大小为  60 * 30
    for (int i = 0; i < 10 ; i++) {
        UIImageView * tempImage = [self.view viewWithTag:i + 2012];
        if (tempImage) {
            tempImage.frame = CGRectMake(20 * ScaleW, (63 + 21.5 * i) * ScaleH, 60 * ScaleW, 21.5 * ScaleH);
            tempImage.image  = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_car_%d",i + 1]];
        }else{
            UIImageView * carImage = [[UIImageView alloc]initWithFrame:CGRectMake(20 * ScaleW, (63 + 21.5 * i) * ScaleH, 60 * ScaleW, 21.5 * ScaleH)];
            carImage.tag = i + 2012;
            carImage.image  = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_car_%d",i + 1]];
            [mainScView addSubview:carImage];
            [carImageArr addObject:carImage];
        }
    }
    [mainScView setContentOffset:CGPointMake(0, 0) animated:NO];
}
//跑道移动
-(void)scrollViewScrollAction{
    [UIView animateWithDuration:21 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//        scrollViewW = scrollViewW + 7.2 * ScaleW;
        [mainScView setContentOffset:CGPointMake(2900 * ScaleW, 0) animated:NO];
//        if (scrollViewW > 2900 * ScaleW) {
//            [paodaoTimer invalidate];
//        }
    } completion:^(BOOL finished) {
    }];
}
//车的移动动画
- (void)carMoveAction{
    
    [UIView animateWithDuration:4 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        for (UIImageView * labelCar in carImageArr) {
                labelCar.center = CGPointMake(labelCar.center.x  + [totalArr[labelCar.tag- 2012][carTime] intValue] * ScaleW, labelCar.center.y);
            }
            carTime ++;
    } completion:^(BOOL finished) {
        if (carTime < 5) {
            [self  carMoveAction];
        }else{
            // 车移动结束  进行数据赋值  并弹出框   显示重放  退出按钮
            [self setResultsMessage:xinLotteryDict];
            [self performSelector:@selector(carVideoDoneControls) withObject:nil afterDelay:2];
            [self.movePlayer stop];
        }
    }];
}

//创建底部显示控件
- (void)createdOtherControls{
    int tempFont;
    if (ScreenW < 330) {
        tempFont = 12;
    }else if(ScreenW > 600){
        tempFont = 18;
    }else{
        tempFont = 14;
    }
    
    //底部期数
    UIImageView * periodImage = [[UIImageView alloc]initWithFrame:CGRectMake(10* ScaleW, ScreenW - 46* ScaleH , 243* ScaleW, 41* ScaleH)];
    periodImage.image = [UIImage imageNamed:@"bjsc_box"];
    [self.view addSubview:periodImage];
    ///////////期数标题
    UILabel * periodTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 243* ScaleW, 20* ScaleH)];//标题
    periodTitleLabel.text = @"时间/期数";
    periodTitleLabel.font = [UIFont systemFontOfSize:tempFont];
    periodTitleLabel.textAlignment = NSTextAlignmentCenter;
    [periodImage addSubview:periodTitleLabel];
    ////////时间
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 21* ScaleH, 160* ScaleW, 20* ScaleH)];//时间
    timeLabel.text = @"8888-88-88 88:88";
    timeLabel.font = [UIFont systemFontOfSize:tempFont];
    timeLabel.textColor = HUIRGBCOLOR(251, 243, 235);
    timeLabel.textAlignment = NSTextAlignmentCenter;
    [periodImage addSubview:timeLabel];
    ////////分割线
    UIImageView * separatedImage = [[UIImageView alloc]initWithFrame:CGRectMake(160* ScaleW, 21* ScaleH , 2, 18* ScaleH)];
    separatedImage.image = [UIImage imageNamed:@"bjsc_separated"];
    [periodImage addSubview:separatedImage];
    ////////期数
    periodLabel = [[UILabel alloc]initWithFrame:CGRectMake(163* ScaleW, 21* ScaleH, 80* ScaleW, 20* ScaleH)];//时间
    periodLabel.text = @"888888";
    periodLabel.font = [UIFont systemFontOfSize:tempFont];
    periodLabel.textColor = HUIRGBCOLOR(251, 243, 235);
    periodLabel.textAlignment = NSTextAlignmentCenter;
    [periodImage addSubview:periodLabel];
    
    //冠亚军和
    UIImageView * totalImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(periodImage.frame) + 10* ScaleW, ScreenW - 46* ScaleH , 142* ScaleW, 41* ScaleH)];
    totalImage.image = [UIImage imageNamed:@"bjsc_box"];
    [self.view addSubview:totalImage];
    
    UILabel * totalTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 142* ScaleW, 20* ScaleH)];//标题
    totalTitleLabel.text = @"冠亚军和";
    totalTitleLabel.font = [UIFont systemFontOfSize:tempFont];
    totalTitleLabel.textAlignment = NSTextAlignmentCenter;
    [totalImage addSubview:totalTitleLabel];
    
    totalLabel1 = [[UILabel alloc]init];
    totalLabel2 = [[UILabel alloc]init];
    totalLabel3 = [[UILabel alloc]init];
    totalLabelArr = @[totalLabel1,totalLabel2,totalLabel3];
    for (int  i = 0; i < totalLabelArr.count; i ++) {
        UILabel * label = totalLabelArr[i];
        label.frame = CGRectMake(i * 142/3.0* ScaleW, 21* ScaleH, 142/3.0* ScaleW,20* ScaleH);
        label.textAlignment = 1;
        label.text = @"赢";
        label.font = [UIFont systemFontOfSize:tempFont];
        label.textColor = HUIRGBCOLOR(251, 243, 235);
        [totalImage addSubview:label];
        //分隔线
        if (i > 0) {
            UIImageView * separatedImage = [[UIImageView alloc]initWithFrame:CGRectMake(i * 142/3.0* ScaleW - 2.0, 21* ScaleH , 2, 18* ScaleH)];
            separatedImage.image = [UIImage imageNamed:@"bjsc_separated"];
            [totalImage addSubview:separatedImage];
        }
    }
    
    //龙虎榜
    UIImageView * tigerImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(totalImage.frame) + 10 * ScaleW, ScreenW - 46* ScaleH, 243* ScaleW, 41* ScaleH)];
    tigerImage.image = [UIImage imageNamed:@"bjsc_box"];
    [self.view addSubview:tigerImage];
    
    UILabel * tigerTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 243* ScaleW, 20* ScaleH)];//标题
    tigerTitleLabel.text = @"1~5 龙虎";
    tigerTitleLabel.font = [UIFont systemFontOfSize:tempFont];
    tigerTitleLabel.textAlignment = NSTextAlignmentCenter;
    [tigerImage addSubview:tigerTitleLabel];
    
    tigerLabel1 = [[UILabel alloc]init];
    tigerLabel2 = [[UILabel alloc]init];
    tigerLabel3 = [[UILabel alloc]init];
    tigerLabel4 = [[UILabel alloc]init];
    tigerLabel5 = [[UILabel alloc]init];
    tigerLabelArr = @[tigerLabel1,tigerLabel2,tigerLabel3,tigerLabel4,tigerLabel5];
    for (int  i = 0; i < tigerLabelArr.count; i ++) {
        UILabel * label = tigerLabelArr[i];
        label.frame = CGRectMake(i * 243/5.0 * ScaleW, 21 * ScaleH, 243/5.0 * ScaleW,20* ScaleH);
        label.textAlignment = 1;
        label.text = @"赢";
        label.font = [UIFont systemFontOfSize:tempFont];
        label.textColor = HUIRGBCOLOR(251, 243, 235);
        [tigerImage addSubview:label];
        //分隔线
        if (i > 0) {
            UIImageView * separatedImage = [[UIImageView alloc]initWithFrame:CGRectMake(i * 243/5.0* ScaleW - 2.0, 21* ScaleH ,2, 18* ScaleH)];
            separatedImage.image = [UIImage imageNamed:@"bjsc_separated"];
            [tigerImage addSubview:separatedImage];
        }
    }
}
//结果赋值
- (void)setResultsMessage:(NSDictionary * )dict{
    //时间  期数
    periodLabel.text = [NSString stringWithFormat:@"%@",dict[@"current"][@"period"]];
    timeLabel.text = [NSString stringWithFormat:@"%@",dict[@"current"][@"prizetime"]];
    
    //判断传进来的 结果类型 是否有值 [有可能上期也没有开奖 贸然赋值 有可能导致数据崩溃]
    NSArray * tempArr = dict[@"current"][@"info"];
    if (tempArr.count > 0) {
        //冠亚军和
        totalLabel1.text = [NSString stringWithFormat:@"%@",dict[@"current"][@"info"][0]];
        //大小
        totalLabel2.text = [NSString stringWithFormat:@"%@",dict[@"current"][@"info"][1]];
        //单双
        totalLabel3.text = [NSString stringWithFormat:@"%@",dict[@"current"][@"info"][2]];
        //龙虎
        for (int i = 0; i < tigerLabelArr.count; i ++) {
            UILabel * label = tigerLabelArr[i];
            label.text = [NSString stringWithFormat:@"%@",dict[@"current"][@"info"][i+3]];
        }
    }
}
//视频播放完毕
- (void)carVideoDoneControls{
    keepOutView.hidden = NO;
    carVideoDoneView.hidden = NO;
}
//三秒倒计时
- (void)threeSecondStartTimerAction{
    threeSecond --;

    if (threeSecond != -1) {
        threeSecondImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"threeSecoond_%d",threeSecond]];
    }

    if (threeSecond == -1) {
        [startTimer invalidate];
        threeSecondImage.hidden = YES;
        [self startTimerAction];
    }
}
//通过轨迹获取当前时间段车的顺序排值
- (void)getCarMingciMessage{

    NSMutableArray * mingCiArr = [NSMutableArray new];
    for (UIImageView * imageView in carImageArr) {
        //获取图片的tag值  跟最大maxX值
        NSString * imageViewMaxX = [NSString stringWithFormat:@"%f",CGRectGetMaxX(imageView.frame)];
        NSString * imageViewTag = [NSString stringWithFormat:@"%d",(int)imageView.tag - 2012];
        NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:imageViewTag,@"imageTag",imageViewMaxX,@"imageMax", nil];
        //获取数据 存入字典 进行排序
        [mingCiArr addObject:dict];
    }
    NSSortDescriptor *firstDescriptor = [[NSSortDescriptor alloc] initWithKey:@"imageMax" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:firstDescriptor, nil];
    NSArray *sortedArray = [mingCiArr sortedArrayUsingDescriptors:sortDescriptors];
    for (int i = 0; i < 10; i ++) {
        UIImageView * tempImage = [self.view viewWithTag:520 + i];
        NSString * tagStr = sortedArray[9 - i][@"imageTag"];
        tempImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_card_%d",[tagStr intValue]+ 1]];
    }
}
#pragma mark --- other
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//播放音乐
-(void) playerMP3FromthreeSecond{
    NSString *thesoundFilePath = [[NSBundle mainBundle] pathForResource:@"3miaodaojishi" ofType:@"mp3"];    //创建音乐文件路径
    if (thesoundFilePath == nil) {
        return;
    }
    NSURL *moveMP3=[NSURL fileURLWithPath:thesoundFilePath];
    NSError *err=nil;
    self.movePlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:moveMP3 error:&err];
    self.movePlayer.volume=1.0;
    [self.movePlayer prepareToPlay];
    if (err!=nil) {
        NSLog(@"move player init error:%@",err);
    }else {
        [self.movePlayer play];
    }
}
////播放音乐
//-(void) playerMP3FromCarMoving{
//    [self.movePlayer stop];
//    NSString *thesoundFilePath = [[NSBundle mainBundle] pathForResource:@"carmoving" ofType:@"mp3"];    //创建音乐文件路径
//    NSURL *moveMP3=[NSURL fileURLWithPath:thesoundFilePath];
//    NSError *err=nil;
//    self.movePlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:moveMP3 error:&err];
//    self.movePlayer.volume=1.0;
//    [self.movePlayer prepareToPlay];
//    if (err!=nil) {
//        NSLog(@"move player init error:%@",err);
//    }else {
//        [self.movePlayer play];
//    }
//}
@end
