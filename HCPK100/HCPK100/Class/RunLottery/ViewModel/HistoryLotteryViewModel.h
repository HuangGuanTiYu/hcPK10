//
//  HistoryLotteryViewModel.h
//  Lottery123
//
//  Created by 项目2 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryLotteryViewModel : NSObject
+ (void)getHistoryLotteryListWithType:(NSString  *  _Nullable )type andPage:(NSString *  _Nullable)page  BlockCompletion: (nullable void(^)(NSArray * _Nullable dataArr))finishBlock withError:(nullable void(^)(NSString * _Nullable msg))errorBlock;


+ (void)getHistoryLotteryListWithType:(NSString  *  _Nullable )type andPage:(NSString *  _Nullable)page  andView:(UIScrollView * _Nullable)scrollview BlockCompletion: (nullable void(^)(NSArray * _Nullable dataArr))finishBlock withError:(nullable void(^)(NSString * _Nullable msg))errorBlock;

@end
