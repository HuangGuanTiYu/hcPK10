//
//  OpenLotteryView.h
//  Lottery123
//
//  Created by 项目2 on 16/10/15.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenLotteryView : UIView{
    int tempIndex;
}
@property(nonatomic,strong) NSDictionary * lotteryDict;
- (void)createdControls:(NSDictionary *)dict;
@end
