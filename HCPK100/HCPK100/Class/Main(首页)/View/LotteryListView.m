//
//  LotteryListView.m
//  Lottery123
//
//  Created by 项目2 on 16/9/23.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "LotteryListView.h"
@interface LotteryListView()
{
    NSArray * lotteryListArr;
}
@end
@implementation LotteryListView

- (instancetype)initWithFrame:(CGRect)frame withLotteryListArr:(NSArray *) arr{
    self = [super initWithFrame:frame];
    if (self) {
        lotteryListArr = arr;
        [self createdControls];
    }
    return self;
}
#pragma mark ---   种点击方法
- (void)clickLotteryListBtn:(UIButton *) sender{
    
    NSDictionary *tempDict = lotteryListArr[(int)sender.tag];
    
    //通过代理传送点击控件的tag值
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickWhatKindLottery:andTitle:)]) {
        [self.delegate clickWhatKindLottery:[tempDict objectForKey:@"type"] andTitle:[tempDict objectForKey:@"title"]];
    }
}

#pragma mark --- 创建视图控件
- (void)createdControls{
    UILabel * pointLabel = [[UILabel alloc]initWithFrame:CGRectMake(20 * Scale, 9 * Scale, 6 * Scale, 16 * Scale)];
//    pointLabel.layer.cornerRadius = 3 * Scale;
    pointLabel.layer.masksToBounds = YES;
    pointLabel.backgroundColor = MainRedColor;
    [self addSubview:pointLabel];
    
    
    UILabel * listNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pointLabel.frame) + 10 * Scale , 0, 100 * Scale, 34 * Scale)];
    listNameLabel.text =@"热门  种";
    listNameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:listNameLabel];
    
    //创建 福  3D 11选5  江苏快三  上海时时乐
    CGFloat btnW = ScreenW/2;//按钮宽度
    CGFloat btnH = 75 * Scale;//按钮高度
    CGFloat ImageW = 52 * Scale;//图标大小
    
    
    UIView * lotteryBgview = [[UIView alloc]initWithFrame:CGRectMake(0, 34 * Scale, ScreenW, self.frame.size.height - 34 * Scale)];
    [self addSubview:lotteryBgview];
    
    for (int i = 0; i < lotteryListArr.count; i ++) {
        NSDictionary * lotteryDict = lotteryListArr[i];
        //  种图标
        UIImageView * lotteryListImage = [[UIImageView alloc]init];
//        lotteryListImage.layer.cornerRadius = ImageW/2;
//        lotteryListImage.layer.masksToBounds = YES;
        [lotteryListImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",lotteryDict[@"img"]]] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"home_%@_img",lotteryDict[@"type"]]]];
        [lotteryBgview addSubview:lotteryListImage];
        //  种  名字 说明View
        UIView * lotteryNamePromptView = [[UIView alloc]init];
        [lotteryBgview addSubview:lotteryNamePromptView];
        //名字和说明视图的起点x 跟所需要的宽度 高度
        CGFloat lotteryNamePromptViewMinX = 80 * Scale;
        CGFloat lotteryNamePromptViewW = 100 * Scale;
        CGFloat lotteryNamePromptViewH = 40 * Scale;
        //  种名字
        UILabel * lotteryNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, lotteryNamePromptViewW, 20 * Scale)];
        lotteryNameLabel.text = lotteryDict[@"title"];
        lotteryNameLabel.font = [UIFont systemFontOfSize:15 * Scale];
        [lotteryNamePromptView addSubview:lotteryNameLabel];
        //  种说明
        UILabel * lotteryPromptLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 25 * Scale, lotteryNamePromptViewW, 15 * Scale)];
        lotteryPromptLabel.text = lotteryDict[@"subtitle"];
        lotteryPromptLabel.font = [UIFont systemFontOfSize:13 * Scale];
        lotteryPromptLabel.textColor = HUIRGBCOLOR(152, 152, 152);
        [lotteryNamePromptView addSubview:lotteryPromptLabel];
        //按钮
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn addTarget:self action:@selector(clickLotteryListBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
//        btn.layer.borderWidth = 0.5f;
//        btn.layer.borderColor = [SeparateLineColor CGColor];
        [lotteryBgview addSubview:btn];
        //设置各元素的frame
        if (i%2 == 0) {
            int remain = i/2;
            btn.frame = CGRectMake(0, btnH * remain, btnW, btnH);
            lotteryListImage.frame = CGRectMake(20 * Scale, btnH * remain + (btnH - ImageW)/2, ImageW, ImageW);
            lotteryNamePromptView.frame = CGRectMake(lotteryNamePromptViewMinX, btnH * remain + 17.5 * Scale, lotteryNamePromptViewW, lotteryNamePromptViewH);
        }else{
            int remain = i/2;
            btn.frame = CGRectMake(btnW, btnH * remain, btnW, btnH);
            lotteryListImage.frame = CGRectMake(btnW + 20 * Scale, btnH * remain + (btnH - ImageW)/2, ImageW, ImageW);
            lotteryNamePromptView.frame = CGRectMake(btnW + lotteryNamePromptViewMinX, btnH * remain + 17.5 * Scale, lotteryNamePromptViewW, lotteryNamePromptViewH);
        }
        //   分割线
        if ( i%2 == 0) {
            UILabel * lineTwo = [[UILabel alloc]initWithFrame:CGRectMake(0, btnH *(i/2), ScreenW, 0.5)];
            lineTwo.backgroundColor = HUIRGBCOLOR(235, 235, 235);
            [lotteryBgview addSubview:lineTwo];
        }
    }
}
@end
