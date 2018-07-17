//
//  ActivityView.m
//  Lottery123
//
//  Created by 项目2 on 16/10/24.
//  Copyright © 2016年 项目. All rights reserved.
//

//背景灰色  中间广告图点击跳转外链  底部x关闭页面

#import "ActivityView.h"

@implementation ActivityView

- (instancetype)initWithURL:(NSString*)activityurl{
    self = [super init];
    if (self) {
//        self.hidden = YES;
        self.frame = CGRectMake(0, 0, ScreenW, ScreenH);
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        
        UIImageView * activityImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 275 *Scale, 330 * Scale)];
        activityImage.center = CGPointMake(self.center.x, self.center.y - 15 * Scale);
        [activityImage setImageWithURL:[NSURL URLWithString:activityurl]];
//        NSURLRequest * requestUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:activityurl]];
//        [activityImage setImageWithURLRequest:requestUrl placeholderImage:[UIImage imageNamed:@"activity_placeholder"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
//            self.hidden = NO;
//        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
//            [self removeFromSuperview];
//        }];
        
        [self addSubview:activityImage];
        activityImage.userInteractionEnabled= YES;
        UITapGestureRecognizer * activityTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchActivityImageAction)];
        [activityImage addGestureRecognizer:activityTap];
        
        UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        closeBtn.frame = CGRectMake(ScreenW/2 - 20 * Scale, CGRectGetMaxY(activityImage.frame) + 20, 40 * Scale, 40 * Scale);
        [closeBtn addTarget:self action:@selector(clickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"close_activity"] forState:UIControlStateNormal];
        [self addSubview:closeBtn];
        
    }
    return self;
}


- (void)clickCloseBtn{
    if (self.typeActionBlock) {
        self.typeActionBlock(@"close");
    }
    [self removeFromSuperview];
}
- (void)touchActivityImageAction{
    if (self.typeActionBlock) {
        self.typeActionBlock(@"touchActivity");
    }
    [self removeFromSuperview];
}
@end
