//
//  CarVideoDoneView.m
//  Lottery123
//
//  Created by 项目2 on 16/10/21.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "CarVideoDoneView.h"

@implementation CarVideoDoneView

- (instancetype)initWith:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(ScreenH/2 - 200, ScreenW/2 - 100, 400, 200);
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self createdControls:dict];
    }
    return self;
}
//创建控件
- (void)createdControls:(NSDictionary *)dict{
    
    NSArray * resultArr = dict[@"current"][@"prizecode"];
    
    //第一名
    UIImageView * numberImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(155, 20, 90, 20)];
    numberImage1.image = [UIImage imageNamed:@"result_1"];
    [self addSubview:numberImage1];
    
    UIImageView * carImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(155, 60, 90, 50)];
    carImage1.image = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_wing_%@",resultArr[0]]];
    [self addSubview:carImage1];
    
    //第二名
    UIImageView * numberImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 30, 90, 20)];
    numberImage2.image = [UIImage imageNamed:@"result_2"];
    [self addSubview:numberImage2];
    
    UIImageView * carImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 70, 90, 50)];
    carImage2.image = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_wing_%@",resultArr[1]]];
    [self addSubview:carImage2];
    
    //第三名
    UIImageView * numberImage3 = [[UIImageView alloc]initWithFrame:CGRectMake(270, 40, 90, 20)];
    numberImage3.image = [UIImage imageNamed:@"result_3"];
    [self addSubview:numberImage3];
    
    UIImageView * carImage3 = [[UIImageView alloc]initWithFrame:CGRectMake(270, 80, 90, 50)];
    carImage3.image = [UIImage imageNamed:[NSString stringWithFormat:@"bjsc_wing_%@",resultArr[2]]];
    [self addSubview:carImage3];
    
    
    
    //分隔线
    UILabel * separatedLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 140, 400, 2)];
    separatedLineLabel.backgroundColor = SeparateLineColor;
    [self addSubview:separatedLineLabel];
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"bjsc_back_btn"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(40, 148, 120, 40);
    [self addSubview:backBtn];
    //再看一次
    UIButton * againBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [againBtn setBackgroundImage:[UIImage imageNamed:@"bjsc_again_btn"] forState:UIControlStateNormal];
    [againBtn addTarget:self action:@selector(clickAgainBtn) forControlEvents:UIControlEventTouchUpInside];
    againBtn.frame = CGRectMake(240, 148, 120, 40);
    [self addSubview:againBtn];
}
//按钮方法
- (void)clickBackBtn{
    if (self.typeActionBlock) {
        self.typeActionBlock(@"back");
    }
}
- (void)clickAgainBtn{
    if (self.typeActionBlock) {
        self.typeActionBlock(@"again");
    }
}


@end
