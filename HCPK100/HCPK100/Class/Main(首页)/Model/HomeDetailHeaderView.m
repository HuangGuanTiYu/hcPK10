//
//  LotteryHeaderView.m
//  Lottery123
//
//  Created by 项目 on 16/9/22.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "HomeDetailHeaderView.h"
#import "HomeModel.h"

@implementation HomeDetailHeaderView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initMainView];
    }
    return self;
}

-(void) _initMainView{
    
    // *** 上期开奖
    onLotteryBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 114)];
    onLotteryBGView.backgroundColor = [UIColor whiteColor];
    [self addSubview:onLotteryBGView];
    
    
    // *** 期数
    onLotteryNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 12, ScreenW - 50, 15)];
    onLotteryNumLabel.font = [UIFont systemFontOfSize:12];
    [onLotteryBGView addSubview:onLotteryNumLabel];
    
    if (ScreenW == 320) {
        onLotteryNumLabel.font = [UIFont systemFontOfSize:11];
    }
    
    // *** 开奖视频
    openResultButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 80, 101, 27)];
    [onLotteryBGView addSubview:openResultButton];
    [openResultButton addTarget:self action:@selector(openResultClick) forControlEvents:UIControlEventTouchUpInside];
    [openResultButton setImage:[UIImage imageNamed:@"result_video.png"] forState:UIControlStateNormal];
    
}

-(void) refreshOnLotteryWithDict:(NSDictionary*)lotteryDict andHeaderView:(NSArray*)headerArr andLotteryType:(NSString*)lotteryType{
    
    
    if (![lotteryType isEqualToString:@"bjsc"] && ![lotteryType isEqualToString:@"cqssc"]) {
        openResultButton.hidden = YES;
        headLineView.frame = CGRectMake(0, 84, ScreenW, 1);
        typeSegment.frame = CGRectMake(0, 85, ScreenW, 40);
        lineView.frame = CGRectMake(0, 125, ScreenW, 10);
        self.tableHeaderView.frame = CGRectMake(0, 135, ScreenW, 40);
    }
    
    
    NSMutableArray *numberArr = [[NSMutableArray alloc] initWithArray:[lotteryDict objectForKey:@"prizecode"]];
    
    NSInteger tempCount = numberArr.count;
    
    if (tempCount > 0) {
        NSString *tempNum = numberArr[0];
        
        if ([tempNum isEqualToString:@"-"]) {
            NSString *tempStr = [NSString stringWithFormat:@"%@期 正在开奖中...",[lotteryDict objectForKey:@"period"]];
            // *** 获取倍率位置
            NSRange range = [tempStr rangeOfString:@"正在开奖中..."];
            
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:tempStr];
            [str addAttribute:NSForegroundColorAttributeName value:NavBGColor range:range];
            onLotteryNumLabel.attributedText = str;
        }else{
            onLotteryNumLabel.text = [NSString stringWithFormat:@"%@期开奖",[lotteryDict objectForKey:@"period"]];
        }
    }
    
    
    
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
    
    // *** 判断是否运算
    if ([[lotteryDict objectForKey:@"prizetype"] isEqualToString:@"add"]) {
        tempCount ++;
        
        // *** 计算和
        NSNumber *sum = [numberArr valueForKeyPath:@"@sum.floatValue"];
        
        // *** 添加和
        [numberArr addObject:[NSString stringWithFormat:@"%d",sum.intValue]];
        
    }
    
    // *** 颜色数组
    NSArray *ballColorArr = lotteryDict[@"prizecolor"];
    
    
    
    for (int i = 0; i < 10; i ++) {
        
        // *** 球
        UILabel *ballLabel = [self viewWithTag:i+928];
        
        if (i < numberArr.count) {
            
            if (ballLabel == nil) {
                ballLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + i * (tempBallW + 3), 40, tempBallW, tempBallW)];
                ballLabel.font = [UIFont systemFontOfSize:15];//字体
                ballLabel.textColor = [UIColor whiteColor];//颜色
                ballLabel.textAlignment = 1;//居中
                ballLabel.layer.cornerRadius = tempBallW/2.00;//圆角
                ballLabel.layer.masksToBounds = YES;
                ballLabel.tag = i + 928;//标记值
                [self addSubview:ballLabel];
            }else{
                ballLabel.hidden = NO;
            }
            
            // *** 运算符
            UILabel *operatorLabel = [self viewWithTag:i+828];
            
            if ([[lotteryDict objectForKey:@"prizetype"] isEqualToString:@"add"]) {
                
                ballLabel.frame = CGRectMake(15 + i * (tempBallW + 15), 40, tempBallW, tempBallW);
                
                // *** 判断运算符
                if (operatorLabel == nil) {
                    operatorLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + tempBallW + 3 + i * (tempBallW + 15), 40, 10, tempBallW)];
                    operatorLabel.font = [UIFont systemFontOfSize:15];//字体
                    operatorLabel.textAlignment = 1;//居中
                    operatorLabel.tag = i + 828;//标记值
                    [self addSubview:operatorLabel];
                }else{
                    operatorLabel.hidden = NO;
                }
                
                // *** 判断显示运算符
                if (i == numberArr.count - 2) {
                    operatorLabel.text = @"=";
                }else if (i < numberArr.count - 2){
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
            
            ballLabel.text = [NSString stringWithFormat:@"%@",numberArr[i]];//数字
            
            ballLabel.backgroundColor = HUIColorFromRGB(@"0xE72F17");
            
            
            // *** 判断是否会越界
            if (i < ballColorArr.count) {
                NSString *ballColorStr = ballColorArr[i];
                if (ballColorStr == nil || [ballColorStr isEqualToString:@""]) {
                    ballColorStr = @"0xE72F17";
                }
                ballLabel.backgroundColor = HUIColorFromRGB(ballColorStr);
            }
        }else{
            if (ballLabel != nil){
                ballLabel.hidden = YES;
            }
        }
        
        
    }
    
    
    for (int i = 0; i < 4; i++) {
        
        UILabel *lotteryNumLabel = [self viewWithTag:177 + i];
        
        if (lotteryNumLabel != nil) {
            lotteryNumLabel.text = @"";
        }
        
        
    }
    
    
    for (int i = 0; i < headerArr.count; i++) {
        
        UILabel *lotteryNumLabel = [self viewWithTag:177 + i];
        
        HomeModel *lotteryModel = headerArr[i];
        
        lotteryNumLabel.text = lotteryModel.title;
    }
    
}


// *** 类型选择
-(void)segmentClickWithIndex:(int)index{
    if (self.typeSegmentBlock) {
        self.typeSegmentBlock(index);
    }
}

// *** 开奖视频
-(void) openResultClick{
    if (self.resultButtonBlock) {
        self.resultButtonBlock();
    }
}



-(void) drawGradientColor:(UIView*)drawView{
    
    //初始化渐变层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = drawView.bounds;
    [drawView.layer addSublayer:gradientLayer];
    
    //设置渐变颜色方向
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    //设定颜色组
    gradientLayer.colors = @[(__bridge id)HUIRGBCOLOR(255, 255, 255).CGColor,
                             (__bridge id)HUIRGBCOLOR(247, 247, 247).CGColor];
    
    //设定颜色分割点
    gradientLayer.locations = @[@(0.5f) ,@(1.0f)];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
