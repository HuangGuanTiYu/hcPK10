//
//  TrendTableViewCell.h
//  Lottery123
//
//  Created by 项目 on 16/9/23.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrendTableViewCell : UITableViewCell


-(void) setTrendWithIndex:(NSInteger)index andType:(int)type andTrendArr:(NSArray*)trendArr andLotteryType:(NSString*)lotteryType;


@end
