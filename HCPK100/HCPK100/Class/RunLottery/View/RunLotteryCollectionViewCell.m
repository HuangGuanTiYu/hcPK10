//
//  RunLotteryCollectionViewCell.m
//  testDemo
//
//  Created by 项目2 on 16/9/25.
//  Copyright © 2016年 项目2. All rights reserved.
//

#import "RunLotteryCollectionViewCell.h"
@interface RunLotteryCollectionViewCell()
{
    UILabel * lotteryName;// 种名字
    UILabel * periodLabel;//时间  期数
    int tempIndex;
}
@end

@implementation RunLotteryCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createdControls];
    }
    return self;
}
-(void)createdControls{

    // 种名字
    lotteryName = [[UILabel alloc]initWithFrame:CGRectMake(15, 10 ,100, 20 )];
    lotteryName.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lotteryName];
    //时间 期数
    periodLabel = [[UILabel alloc]initWithFrame:CGRectMake(125, 13,ScreenW - 140 , 15 )];
    periodLabel.textColor = [UIColor grayColor];
    periodLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:periodLabel];
}
-(void)setHistoryTheLotteryCellMessage:(NSDictionary *) dic
{
    
    int tempFont;//字体大小
    //开奖球
    float tempBallW;
    if (ScreenW == 320) {
        tempBallW = 25;
        tempFont = 10;
    }else{
        tempBallW = 30;
        tempFont = 13;
    }
    
    // *** 数字数据
    NSMutableArray * ballArr = dic[@"prizecode"];
    
    int tempCount = ballArr.count;
    
    // *** 判断是否运算
    if ([[dic objectForKey:@"prizetype"] isEqualToString:@"add"]) {
        tempCount ++;
        
        // *** 计算和
        NSNumber *sum = [ballArr valueForKeyPath:@"@sum.floatValue"];
        
        // *** 添加和
        ballArr = [[NSMutableArray alloc] initWithArray:ballArr];
        [ballArr addObject:[NSString stringWithFormat:@"%d",sum.intValue]];
        
    }
    
    
    
    // *** 颜色数组
    NSArray *ballColorArr = dic[@"prizecolor"];
    
    for (int i = 0; i < ballArr.count; i ++) {
        
        // *** 球
        UILabel  * ballLabel = [self.contentView viewWithTag:i+928];
        if (ballLabel == nil) {
            ballLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + i * (tempBallW + 3), 40, tempBallW, tempBallW)];
            ballLabel.font = [UIFont systemFontOfSize:15];//字体
            ballLabel.textColor = [UIColor whiteColor];//颜色
            ballLabel.textAlignment = 1;//居中
            ballLabel.layer.cornerRadius = tempBallW/2.00;//圆角
            ballLabel.layer.masksToBounds = YES;
            ballLabel.tag = i + 928;//标记值
            [self.contentView addSubview:ballLabel];
        }else{
            ballLabel.hidden = NO;
        }
        
        // *** 运算符
        UILabel *operatorLabel = [self.contentView viewWithTag:i+828];
        
        if ([[dic objectForKey:@"prizetype"] isEqualToString:@"add"]) {
            
            ballLabel.frame = CGRectMake(15 + i * (tempBallW + 15), 40, tempBallW, tempBallW);
            
            // *** 判断运算符
            if (operatorLabel == nil) {
                operatorLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + tempBallW + 3 + i * (tempBallW + 15), 40, 10, tempBallW)];
                operatorLabel.font = [UIFont systemFontOfSize:15];//字体
                operatorLabel.textAlignment = 1;//居中
                operatorLabel.tag = i + 828;//标记值
                [self.contentView addSubview:operatorLabel];
            }else{
                operatorLabel.hidden = NO;
            }
            
            // *** 判断显示运算符
            if (i == ballArr.count - 2) {
                operatorLabel.text = @"=";
            }else if (i < ballArr.count - 2){
                operatorLabel.text = @"+";
            }else{
                operatorLabel.text = @"";
            }
            
        }else{
            ballLabel.frame = CGRectMake(15 + i * (tempBallW + 4), 40, tempBallW, tempBallW);
            
            if (operatorLabel != nil) {
                operatorLabel.hidden = YES;
            }
        }
        
        ballLabel.text = [NSString stringWithFormat:@"%@",ballArr[i]];//数字
        
        ballLabel.backgroundColor = HUIColorFromRGB(@"0xE72F17");
        
        
        // *** 判断是否会越界
        if (i < ballColorArr.count) {
            NSString *ballColorStr = ballColorArr[i];
            if (ballColorStr == nil || [ballColorStr isEqualToString:@""]) {
                ballColorStr = @"0xE72F17";
            }
            ballLabel.backgroundColor = HUIColorFromRGB(ballColorStr);
        }
        
    }
    
    
    
    if (tempIndex > ballArr.count) {
        for (int i = (int) ballArr.count; i < tempIndex; i ++) {
            UILabel *tempLabel = [self viewWithTag:928 + i];
            tempLabel.hidden = YES;
        }
    }
    tempIndex = (int)ballArr.count;

    
    // 种名字
    lotteryName.text = dic[@"name"];
    //期数
    periodLabel.font = [UIFont systemFontOfSize:tempFont];
    periodLabel.text = [NSString stringWithFormat:@"%@ %@",dic[@"period"],dic[@"prizetime"]];
}
@end
