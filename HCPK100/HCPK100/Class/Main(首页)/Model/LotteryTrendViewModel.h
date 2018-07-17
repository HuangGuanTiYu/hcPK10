//
//  LotteryTrendViewModel.h
//  Lottery123
//
//  Created by 项目 on 16/9/29.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryTrendViewModel : NSObject


+(void) getTrendWithLotteryType:(NSString*_Nullable)lotteryType andSelectType:(NSString*_Nullable)type blockCompletion:(nullable void(^)(NSArray* _Nullable selectTypeArr,NSArray* _Nullable lotteryTrendArr))finishBlock withError:(nullable void(^)(NSString* _Nullable errorMessage))errorBlock;


+(void) getRankWithLotteryType:(NSString*_Nullable)lotteryType blockCompletion:(nullable void(^)(NSArray* _Nullable rankArr))finishBlock withError:(nullable void(^)(NSString* _Nullable errorMessage))errorBlock;

@end
