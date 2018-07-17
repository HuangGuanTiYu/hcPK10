//
//  LotteryNewWinningView.h
//  Lottery123
//
//  Created by 项目2 on 16/9/24.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TheLatestLotteryView : UIView
- (void)setRunLotteryData:(NSArray *)arr;
@property (nonatomic, copy) void (^lotteryIndexBlock)(int lotteryIndex);
@end
