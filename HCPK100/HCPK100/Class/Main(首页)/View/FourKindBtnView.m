//
//  FourKindBtnView.m
//  Lottery123
//
//  Created by 项目2 on 16/9/23.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "FourKindBtnView.h"
// *** 广告条
#import "LaBaTongZhiView.h"
@interface FourKindBtnView()<LaBaTongZhiViewDelegate>
{
    CGFloat fourKindBtnViewW;//用于测算视图款度
    CGFloat fourKindBtnViewH;//用于测算视图高度
    NSArray * btnDataArr;//用于存放按钮数据信息

    // *** 滚动广告
    LaBaTongZhiView * gonggaoBGView;
    // *** 通知字符串
    NSString * noticeStr;
}
@end
@implementation FourKindBtnView


- (instancetype)initWithFrame:(CGRect)frame withBtnArr:(NSArray *)btnArr{
    self = [super initWithFrame:frame];
    if (self) {
        fourKindBtnViewW = frame.size.width;
        fourKindBtnViewH = frame.size.height;
        btnDataArr = btnArr;
        [self createdControls];
        
        // *** 注册后台进入前台通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(laBaAnimationDone)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
    }
    return self;
}
#pragma mark --- 按钮点击事件
- (void)clickFourBtn:(UIButton * )sender{
    //代理传送点击按钮的tag值
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickWhtaKindBtn:)]) {
        [self.delegate clickWhtaKindBtn:btnDataArr[(int)sender.tag]];
    }
}
#pragma mark --- 创建页面控件
- (void)createdControls{

    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    // *** 公告文字
    NSString * tempNoticeStr;
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"GunDongGongGaoNotice"]) {
        tempNoticeStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"GunDongGongGaoNotice"];
    }else{
        tempNoticeStr = @"欢迎光临，高频  全网最高倍率！";
    }
    
    // *** 公告栏
    gonggaoBGView = [[LaBaTongZhiView alloc] initWithFrame:CGRectMake(0,0, fourKindBtnViewW, 35 * Scale)];
    gonggaoBGView.delegate = self;
    [self addSubview:gonggaoBGView];
    [gonggaoBGView startAnimationWithString:tempNoticeStr];
    noticeStr = tempNoticeStr;
    
    // *** 分割线
    UILabel * gonggaoLinelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 35 * Scale,fourKindBtnViewW,0.5)];
    gonggaoLinelabel.backgroundColor = HUIRGBCOLOR(235, 235, 235);
    [self addSubview:gonggaoLinelabel];
    
    // *** 按钮信息数组
    CGFloat btnW = fourKindBtnViewW / btnDataArr.count;//每个按钮的宽度
    NSArray * placeholderImageArr = @[@"home_btn_icon1",@"home_btn_icon2",@"home_btn_icon3",@"home_btn_icon4"];
    // *** 创建4个按钮、图标、名字
    for (int i = 0; i < btnDataArr.count; i ++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(btnW * i, 35 * Scale, btnW, fourKindBtnViewH);
        [btn addTarget:self action:@selector(clickFourBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self addSubview:btn];
        // *** 按钮图标
        CGFloat imageW = 30 * Scale;//图标大小
        UIImageView * btnImage = [[UIImageView alloc]initWithFrame:CGRectMake(btnW * i + (btnW - imageW)/2,35 * Scale+ 9 * Scale, imageW, imageW)];
        [btnImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",btnDataArr[i][@"img"]]] placeholderImage:[UIImage imageNamed:placeholderImageArr[i]]];
        [self addSubview:btnImage];
        // *** 按钮名字
        UILabel * btnNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(btnW * i, CGRectGetMaxY(btnImage.frame) - 3 * Scale, btnW, 105 * Scale -CGRectGetMaxY(btnImage.frame))];
        btnNameLabel.text = btnDataArr[i][@"title"];
        btnNameLabel.font = [UIFont systemFontOfSize:13.0 * Scale];
        btnNameLabel.textAlignment = 1;
        [self addSubview:btnNameLabel];
        // *** 分隔线
        if (i < btnDataArr.count - 1) {
            UILabel * separateLinelabel = [[UILabel alloc]initWithFrame:CGRectMake(btnW * (i + 1), 35 * Scale, 0.5, fourKindBtnViewH - 35 * Scale)];
            separateLinelabel.backgroundColor = HUIRGBCOLOR(235, 235, 235);
            [self addSubview:separateLinelabel];
        }
    }
}
// *** 重载广告条
-(void)laBaAnimationDone{
    [gonggaoBGView startAnimationWithString:noticeStr];
}

@end
