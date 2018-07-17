//
//  LotteryNewWinningView.m
//  Lottery123
//
//  Created by 项目2 on 16/9/24.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "TheLatestLotteryView.h"
#import "HomeMessageModel.h"
#import "MainTitleView.h"
#import "OpenLotteryView.h"
@interface TheLatestLotteryView()
@end
@implementation TheLatestLotteryView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createdControls];
    }
    return self;
}

- (void)setRunLotteryData:(NSArray *)arr{
    for (int i = 0; i < arr.count; i ++) {
        OpenLotteryView * tempView = [self viewWithTag:i + 1989];
        
        if (tempView) {
        }else{
            tempView = [[OpenLotteryView alloc]initWithFrame:CGRectMake(0, (34 + 90 * i) * Scale, ScreenW, 90 * Scale)];
            tempView.tag =  i + 1989;
            [self addSubview:tempView];
            
            UITapGestureRecognizer * viewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchLotteryTap:)];
            [tempView addGestureRecognizer:viewTap];
            
        }
        [tempView createdControls:arr[i]];
    }
}
- (void)createdControls{
    MainTitleView * titleView = [[MainTitleView alloc]initWithTitle:@"最新开奖"];
    [self addSubview:titleView];
}

- (void)touchLotteryTap:(UITapGestureRecognizer *)tap{
    if (self.lotteryIndexBlock) {
        NSLog(@"%ld",tap.view.tag);
        self.lotteryIndexBlock((int)tap.view.tag - 1989);
    }
}
@end
