//
//  LotteryListView.h
//  Lottery123
//
//  Created by 项目2 on 16/9/23.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LotteryListViewDelegate<NSObject>
-(void)clickWhatKindLottery:(NSString *)type andTitle:(NSString*)title;
@end
@interface LotteryListView : UIView
@property(nonatomic,strong) id<LotteryListViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame withLotteryListArr:(NSArray *) arr;
@end
