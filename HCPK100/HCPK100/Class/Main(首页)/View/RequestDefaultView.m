//
//  RequestDefaultView.m
//  AlwaysPlay
//
//  Created by xiangmu on 2017/8/22.
//  Copyright © 2017年 AlwaysPlay. All rights reserved.
//

#import "RequestDefaultView.h"

@implementation RequestDefaultView


-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.frame = [UIApplication sharedApplication].keyWindow.bounds;
        
        [self _initLoadDefaultView];
        
    }
    return self;
}



-(void) _initLoadDefaultView{
    
    // *** 获取对应大小的启动图图片
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *launchImage = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict){
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize)){
            launchImage = dict[@"UILaunchImageName"];
            if (![launchImage isEqualToString:@"default-1136"]) {
                break;
            }
        }
    }
    
    // *** 加载默认视图
    UIImageView *defaultImageView = [[UIImageView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    defaultImageView.image = [UIImage imageNamed:launchImage];
    [self addSubview:defaultImageView];
    defaultImageView.backgroundColor = [UIColor whiteColor];
    
    self.requestErrorView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    [self addSubview:self.requestErrorView];
    self.requestErrorView.hidden = YES;
    
    
    // *** 请求失败
    UIImageView *errorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 220, 284)];
    errorImageView.image = [UIImage imageNamed:@"main_request_error"];
    [self.requestErrorView addSubview:errorImageView];
    errorImageView.center = CGPointMake(ScreenW / 2, ScreenH / 3);
    
    // *** 重新请求按钮
    UIButton *againRequestButton = [[UIButton alloc] initWithFrame:CGRectMake((ScreenW - 225) / 2, CGRectGetMaxY(errorImageView.frame) + 50, 225, 40)];
    [againRequestButton setImage:[UIImage imageNamed:@"main_request_again"] forState:UIControlStateNormal];
    [self.requestErrorView addSubview:againRequestButton];
    [againRequestButton addTarget:self action:@selector(againRequestClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // *** 客服按钮
    UIButton *kfRequestButton = [[UIButton alloc] initWithFrame:CGRectMake((ScreenW - 225) / 2, CGRectGetMaxY(againRequestButton.frame) + 20, 225, 40)];
    [kfRequestButton setImage:[UIImage imageNamed:@"main_request_kf"] forState:UIControlStateNormal];
    [self.requestErrorView addSubview:kfRequestButton];
    [kfRequestButton addTarget:self action:@selector(kfRequestButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.requestErrorLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, errorImageView.frame.origin.y + errorImageView.frame.size.height / 4 - 50, ScreenW - 40, 30)];
    self.requestErrorLabel.font = [UIFont systemFontOfSize:17];
    self.requestErrorLabel.textAlignment = NSTextAlignmentCenter;
    [self.requestErrorView addSubview:self.requestErrorLabel];
    self.requestErrorLabel.text = @"网络连接出错！";
    
    
    UILabel *tempLXKFLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, errorImageView.frame.origin.y + errorImageView.frame.size.height / 4 - 15, ScreenW - 40, 30)];
    tempLXKFLabel.text = @"如果仍未能解决问题请联系客服";
    tempLXKFLabel.font = [UIFont systemFontOfSize:17];
    tempLXKFLabel.textAlignment = NSTextAlignmentCenter;
    [self.requestErrorView addSubview:tempLXKFLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationErrorChatBack:) name:@"notificationErrorChatBack" object:nil];
    
}

-(void) notificationErrorChatBack:(NSNotification*)sender{
    self.hidden = NO;
}

-(void) kfRequestButtonClick{
    
    // *** 通知打开聊天
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationPushToCustomerVC" object:nil];
    
    double delayInSeconds = 0.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        self.hidden = YES;
    });
    
}


-(void) againRequestClick{
    if (self.againRequestBlock) {
        self.againRequestBlock();
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
