//
//  OpeningOfAdView.m
//  Lottery123
//
//  Created by 项目2 on 16/9/25.
//  Copyright © 2016年 项目. All rights reserved.
//
#import "OtherInformationWebViewController.h"

#import "OpeningOfAdView.h"
@interface OpeningOfAdView(){
    UIImageView * openingAdImage;
    int cutDownTime;
    NSTimer * cutDownTimer;
    UIButton * closeStartADButton;
}
@end
@implementation OpeningOfAdView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSString *enable = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"openingOfAdEnable"]];
        NSString * adIsShowCount = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"ADIsShowCount"]];
        
        // *** 判断是否开启公告
        if ([enable isEqualToString:@"1"] && ![[[NSUserDefaults standardUserDefaults] stringForKey:@"FRlrctmRxUt"] isEqualToString:@"0"]) {
            
            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"openingOfAdShowCount"] isEqualToString:adIsShowCount]) {
                self.hidden = YES;
            }else{
                self.backgroundColor = [UIColor whiteColor];
                [self createdControls];
                
                int tempCount = [adIsShowCount intValue];
                tempCount++;
                [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",tempCount] forKey:@"ADIsShowCount"];
            }
        }else{
            self.hidden = YES;
        }
    }
    return self;
}
- (void)createdControls{
    openingAdImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
    [self addSubview:openingAdImage];
    openingAdImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * startADTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startADClick)];
    [openingAdImage addGestureRecognizer:startADTap];
    //加载广告图片
    NSString * imageStr;
    //通过屏幕宽度判断所要显示图片的大小
    if (ScreenH == 480) {
        imageStr = @"image480";
    }else if(480 < ScreenH || ScreenH < 740){
        imageStr = @"image667";
    }else{
        imageStr = @"imageipad";
    }
    //通过本地获取开屏图
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageStr];
    openingAdImage.image = [[UIImage alloc] initWithContentsOfFile:fullPath];
    //获取倒计时时间
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"openingOfAdCountDown"]) {
        cutDownTime = [[[NSUserDefaults standardUserDefaults] objectForKey:@"openingOfAdCountDown"] intValue];
    }else{
        cutDownTime = 5;
    }
    //点击跳过
    closeStartADButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-110, 30, 100, 30)];
    closeStartADButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [closeStartADButton setTitle:[NSString stringWithFormat:@"点击跳过(%ds)",cutDownTime] forState:UIControlStateNormal];
    closeStartADButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [openingAdImage addSubview:closeStartADButton];
    [closeStartADButton addTarget:self action:@selector(startADAnimate) forControlEvents:UIControlEventTouchDown];
    
    cutDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(cutDownTimeEvent) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:cutDownTimer forMode:NSDefaultRunLoopMode];
}
//倒计时进行过程
- (void)cutDownTimeEvent{
    cutDownTime--;
    [closeStartADButton setTitle:[NSString stringWithFormat:@"点击跳过(%ds)",cutDownTime] forState:UIControlStateNormal];
    if (cutDownTime == 0) {
        [cutDownTimer invalidate];
        [self startADAnimate];
    }
}
//点击广告图
-(void)startADClick{
    NSString * type = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"openingOfAdType"]];//类型
    
    NSString * urlStr = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"openingOfAdUrl"]];//url
    
    NSString * title = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"openingOfAdTitle"]];//标题
    
    if (title.length < 1) {//如果值为空
        title = @"活动";
    }
    
    if ([type isEqualToString:@"browser"]) {
        if (urlStr) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        }
    }else if ([type isEqualToString:@"app"]){
        NSDictionary *tempDict = [[NSDictionary alloc] initWithObjectsAndKeys:title,@"title",urlStr,@"url", nil];
        // *** 通知跳转活动页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationPushToActivityVC" object:tempDict];
    }else{
        
        
    }
}
//倒计时时间结束 跟点击跳过  事件
-(void)startADAnimate{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationJudgeMainStatus" object:nil];
    
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [UIView animateWithDuration:1 animations:^{
        // 1.计算缩放比例
        CGFloat scale = 3.0;
        // 2.修改形变属性
        openingAdImage.transform = CGAffineTransformScale(openingAdImage.transform, scale, scale);
        openingAdImage.alpha = 0;
        self.alpha = 0;
        openingAdImage.center = CGPointMake(ScreenW/2, ScreenH/2);
    } completion:^(BOOL finished) {
        openingAdImage = nil;;
        [self removeFromSuperview];
    }];
}
@end
