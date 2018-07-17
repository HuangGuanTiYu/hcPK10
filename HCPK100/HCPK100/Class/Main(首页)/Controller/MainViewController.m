//
//  MainViewController.m
//  Lottery123
//
//  Created by 项目 on 16/9/22.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "MainViewController.h"

#import "NewWinningView.h" // 最新中奖视图
#import "LotteryListView.h" //  种视图
#import "FourKindBtnView.h" //四个种类按钮视图
#import "TheLatestLotteryView.h"//最新开奖视图
#import "HomeMessageModel.h"//首页信息
#import "OtherInformationWebViewController.h"
#import "HomeDetailController.h"

@interface MainViewController ()<UIAlertViewDelegate,LotteryListViewDelegate>{
    
    UIBarButtonItem *_chatItem;
    
    FourKindBtnView * fourBtnView;//功能按钮
    
    UIScrollView * mainScView;//首页滚动视图
    UIView * mainADImageView;//首页图片广告视图
    CGFloat remainH;//视图间隔高度
    NSArray  * imagePlayerArr;//轮播器信息数组
    
    TheLatestLotteryView * latestlotteryView;
    
    NewWinningView * newWinningView;
    LotteryListView * lotteryListView;
}
@property (strong, nonatomic) NSDate *lastPlaySoundDate;

@end

@implementation MainViewController


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    isShowMainVC = YES;
    
    // *** 如果页面存在功能按钮
    if (fourBtnView) {
        [fourBtnView laBaAnimationDone];
    }
    
}


-(void)viewWillDisappear:(BOOL)animated{
    isShowMainVC = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载首页界面信息
    [HomeMessageModel getHomeBannerMessage:^(NSDictionary * _Nullable mainDataDict) {
        
        imagePlayerArr = mainDataDict[@"banner"];
        
        // *** 数组赋值
        lotteryListArr = [mainDataDict objectForKey:@"lottery"];
        
        menuArr = [mainDataDict objectForKey:@"menu"];
        
        [self createdControls];
        
    } withErrorBlock:^(NSString * _Nullable errorMsg) {
        
        
    }];
    
    isShowMainVC = YES;
    
    self.view.backgroundColor = MainBGColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;//可以消除因隐藏导航栏而造成的 scrollview 的contentSize 从20开始
    
    remainH =  10 * Scale;//初始化间隔高度
    
}

#pragma mark --- 代理方法
- (void)clickWhtaKindBtn:(NSDictionary*)clickDict{
    
   
}


#pragma mark --- 创建滚动视图
- (void)touchHeaderRefersh{
    [self performSelector:@selector(endHeaderRefersh) withObject:nil afterDelay:1];
}
- (void)endHeaderRefersh{
    if (mainScView.headerRefreshing) {
        [mainScView headerEndRefreshing];
    }
}
//创建滚动视图图上控件[banner  functions  lotteryList]
- (void)createdControls{
    mainScView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH - 50)];
    mainScView.showsVerticalScrollIndicator = NO;
    mainScView.showsHorizontalScrollIndicator = NO;
    mainScView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mainScView];
    
    
    if (@available(iOS 11.0, *)) {
        if (JudgeIsIphoneX) {
            mainScView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        }else{
            mainScView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
        }
    }
    
    //添加假装滚动功能
    [mainScView addHeaderWithTarget:self action:@selector(touchHeaderRefersh)];
    
    
    //图片广告单边磨圆
    mainADImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 175 * Scale)];
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:mainADImageView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = mainADImageView.bounds;
    maskLayer.path = maskPath.CGPath;
    mainADImageView.layer.mask = maskLayer;
    [mainScView addSubview:mainADImageView];
    
    //  种视图
    enableStatusFloat = CGRectGetMaxY(mainADImageView.frame);
    
    float tempLength = CGRectGetMaxY(mainADImageView.frame);
    
    UIImageView *tempBannerImage = [[UIImageView alloc] initWithFrame:mainADImageView.frame];
    tempBannerImage.image = [UIImage imageNamed:@"home_banner_image"];
    [mainADImageView addSubview:tempBannerImage];
    
    CGFloat lotteryListViewH;
    if (lotteryListArr.count % 2 == 0) {
        lotteryListViewH = (34 + lotteryListArr.count/2 * 75) * Scale;
    }else{
        lotteryListViewH = (34 + (lotteryListArr.count/2 + 1) * 75) * Scale;
    }
    
    //设置滚动视图的内容区域大小
    mainScView.contentSize = CGSizeMake(ScreenW, 401 * Scale + lotteryListViewH + 3 * remainH);
    
    //  种
    lotteryListView = [[LotteryListView alloc]initWithFrame:CGRectMake(0, tempLength + remainH, ScreenW, lotteryListViewH) withLotteryListArr:lotteryListArr];
    lotteryListView.backgroundColor = [UIColor whiteColor];
    lotteryListView.delegate = self;
    [mainScView addSubview:lotteryListView];
    
    
    enableStatusFloat = CGRectGetMaxY(lotteryListView.frame);
    
    
    //轮播最新中奖人
    newWinningView = [[NewWinningView alloc]initWithFrame:CGRectMake(0, enableStatusFloat + remainH, ScreenW, 34 * Scale + 150 * Scale)];
    newWinningView.backgroundColor = [UIColor whiteColor];
    [mainScView addSubview:newWinningView];
    //设置滚动视图大小
    mainScView.contentSize = CGSizeMake(ScreenW, CGRectGetMaxY(newWinningView.frame) + remainH);
    
}

- (void)clickWhatKindLottery:(NSString *)type andTitle:(NSString *)title{
    
    
    if ([type isEqualToString:@"gd"]) {

        return;
    }

    HomeDetailController *lotteryVC = [[HomeDetailController alloc] init];
    lotteryVC.marketType = @"A";
    lotteryVC.lotteryType = type;
    lotteryVC.deailName = title;
    [self.navigationController pushViewController:lotteryVC animated:YES];
}



@end
