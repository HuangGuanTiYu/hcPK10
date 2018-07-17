//
//  LotteryHeaderView.h
//  Lottery123
//
//  Created by 项目 on 16/9/22.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RCSegmentView.h"

#import "HomeDetailViewModel.h"

@interface HomeDetailHeaderView : UICollectionReusableView<RCSegmentViewDelegate>{
    UILabel *onLotteryNumLabel;
    
    RCSegmentView *typeSegment;
    
    UIView *onLotteryBGView;
    
    
    UILabel *lotteryOpeningLabel;
    
    UIButton *openResultButton;
    
    UIView *headLineView;
    
    UIView *lineView;
}


@property (nonatomic, copy) void (^resultButtonBlock)();

@property (nonatomic, copy) void (^typeSegmentBlock)(int index);


@property (retain, nonatomic) UIView *tableHeaderView;


/**
 *  刷新上期开奖信息
 */
-(void) refreshOnLotteryWithDict:(NSDictionary*)lotteryDict andHeaderView:(NSArray*)headerArr andLotteryType:(NSString*)lotteryType;


@end
