//
//  RunLotteryViewModel.h
//  Lottery123
//
//  Created by 项目2 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunLotteryViewModel : NSObject
+ (void)getNewLotteryListWithScrollView:(UIScrollView * _Nullable)scrollView BlockCompletion: (nullable void(^)(NSArray * _Nullable dataArr))finishBlock withError:(nullable void(^)(NSString * _Nullable msg))errorBlock;
@end
