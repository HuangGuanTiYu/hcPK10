//
//  MainTitleView.m
//  Lottery123
//
//  Created by 项目2 on 16/10/15.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "MainTitleView.h"

@implementation MainTitleView
// 分类标题视图
- (instancetype)initWithTitle:(NSString * )title{
    self = [super init];
    if (self) {
        [self createdControls:title];
    }
    return self;
}
- (void)createdControls:(NSString *)title{
    UILabel * pointLabel = [[UILabel alloc]initWithFrame:CGRectMake(20 * Scale, 9 * Scale, 6 * Scale, 16 * Scale)];
//    pointLabel.layer.cornerRadius = 3 * Scale;
    pointLabel.layer.masksToBounds = YES;
    pointLabel.backgroundColor = MainRedColor;
    [self addSubview:pointLabel];
    UILabel * listNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pointLabel.frame) + 10 * Scale , 0, 100 * Scale, 34 * Scale)];
    listNameLabel.text =title;
    listNameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:listNameLabel];
    //分割线
    UILabel * lineOne = [[UILabel alloc]initWithFrame:CGRectMake(0,34 * Scale - 1, ScreenW, 1)];
    lineOne.backgroundColor = MainBGColor;
    [self addSubview:lineOne];
}


@end
