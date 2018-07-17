//
//  TrendTableViewCell.m
//  Lottery123
//
//  Created by 项目 on 16/9/23.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "TrendTableViewCell.h"

@implementation TrendTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initMainView];
    }
    return self;
}


-(void) _initMainView{
    
    
    UILabel *tempNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 42 * Scale, 26 * Scale)];
    tempNumLabel.textAlignment = NSTextAlignmentCenter;
    tempNumLabel.font = [UIFont systemFontOfSize:15];
    tempNumLabel.textColor = [UIColor colorWithWhite:1 alpha:0.8];
    [self addSubview:tempNumLabel];
    tempNumLabel.tag = 1234;
    
    if (ScreenW == 320) {
        tempNumLabel.font = [UIFont systemFontOfSize:13];
    }
    
    
    for (int i = 0; i < 1; i++) {
        
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(42 * Scale + i * 27 * Scale, 0, 26 * Scale, 26 * Scale)];
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.font = [UIFont systemFontOfSize:15];
        tempLabel.textColor = [UIColor colorWithWhite:1 alpha:0.8];
        [self addSubview:tempLabel];
        tempLabel.tag = 1234 + i + 1;
        
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(42 * Scale + i * 27 * Scale, 0, 1 * Scale, 28 * Scale)];
        lineView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        [self addSubview:lineView];
        lineView.tag = 4321 + i;
        
        
        if (ScreenW == 320) {
            tempLabel.font = [UIFont systemFontOfSize:13];
        }
    }
    
}


-(void) setTrendWithIndex:(NSInteger)index andType:(int)type andTrendArr:(NSArray*)trendArr andLotteryType:(NSString *)lotteryType{
    
    NSInteger tempCount = trendArr.count;
    
    
    // *** 隐藏所有分割线
    for (int i = 0; i < 11; i++) {
        UILabel *tempLabel = [self viewWithTag:1234 + i];
        if (tempLabel != nil) {
            UIView *lineView = [self viewWithTag:4321 + i];
            
            tempLabel.text = @"";
            lineView.hidden = YES;
            
        }
        
    }
    
    
    for (int i = 0; i < tempCount; i++) {
        UILabel *tempLabel = [self viewWithTag:1234 + i];
        
        if (tempLabel == nil) {
            tempLabel = [[UILabel alloc] init];
            tempLabel.textAlignment = NSTextAlignmentCenter;
            tempLabel.font = [UIFont systemFontOfSize:15];
            tempLabel.textColor = [UIColor colorWithWhite:1 alpha:0.8];
            [self addSubview:tempLabel];
            tempLabel.tag = 1234 + i;
        }
        
        tempLabel.text = [NSString stringWithFormat:@"%@",trendArr[i]];
        
        
        
    
        
        UIView *lineView = [self viewWithTag:4321 + i];
        if (lineView == nil) {
            lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
            [self addSubview:lineView];
            lineView.tag = 4321 + i;
        }
        // *** 判断是否显示分割线
        if (i < tempCount - 1) {
            lineView.hidden = NO;
        }else{
            lineView.hidden = YES;
        }
        
        
        
        NSInteger tempLength = self.frame.size.width / (tempCount + 0.5);
        
        
        NSInteger cellHeight = 26 * Scale;
        
        
        NSString *tempStr = [NSString stringWithFormat:@"%@",trendArr[i]];
        // *** 判断是否第一行
        if (index != 0) {
            
            // *** 单双/大小/龙虎 区分颜色
            if ([tempStr rangeOfString:@"大"].location !=NSNotFound || [tempStr rangeOfString:@"双"].location !=NSNotFound || [tempStr rangeOfString:@"龙"].location !=NSNotFound || [tempStr rangeOfString:@"红"].location !=NSNotFound) {
                tempLabel.textColor= NavBGColor;
            }else if([tempStr rangeOfString:@"小"].location !=NSNotFound || [tempStr rangeOfString:@"单"].location !=NSNotFound || [tempStr rangeOfString:@"虎"].location !=NSNotFound || [tempStr rangeOfString:@"绿"].location !=NSNotFound){
                tempLabel.textColor= HUIRGBCOLOR(117,200,14);
            }else if ([tempStr rangeOfString:@"蓝"].location !=NSNotFound){
                tempLabel.textColor= HUIRGBCOLOR(47,119,218);
            }else{
                tempLabel.textColor = [UIColor blackColor];
            }
            
            // *** 判断是否广东快乐十分
            if ([lotteryType isEqualToString:@"gdklsf"]) {
                // *** 19 20 标红
                if ([tempStr isEqualToString:@"19"] || [tempStr isEqualToString:@"20"]) {
                    tempLabel.textColor= NavBGColor;
                }
                
            }else if([lotteryType isEqualToString:@"xglhc"]){
                if([tempStr rangeOfString:@"龙"].location !=NSNotFound || [tempStr rangeOfString:@"虎"].location !=NSNotFound){
                    tempLabel.textColor = [UIColor blackColor];
                }
            }
        }else{
            tempLabel.textColor = [UIColor blackColor];
        }
        
        
        // *** 首页的走势
        if (type == 1) {
            
            lineView.backgroundColor = MainBGColor;
            
            cellHeight = 35 * Scale;
            
            tempLabel.font = [UIFont systemFontOfSize:15];
            
            if (tempStr.length >= 3) {
                tempLabel.font = [UIFont systemFontOfSize:13];
            }
            
        }else{
            
            tempLabel.font = [UIFont systemFontOfSize:13];
            lineView.backgroundColor =  [UIColor colorWithWhite:1 alpha:0.6];
            
            if (tempStr.length >= 3) {
                tempLabel.font = [UIFont systemFontOfSize:11];
            }
            
        }
        
        
        // *** 第一个大0.5
        if (i == 0) {
            tempLabel.frame = CGRectMake(0, 0, tempLength * 1.5, cellHeight);
        }else{
            tempLabel.frame = CGRectMake(tempLength * 1.5 + (i - 1) * tempLength, 0, tempLength, cellHeight);
        }
        
        // *** 设置分割线位置
        lineView.frame = CGRectMake(tempLabel.frame.size.width + tempLabel.frame.origin.x, 0, 1 * Scale, cellHeight);
        
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
