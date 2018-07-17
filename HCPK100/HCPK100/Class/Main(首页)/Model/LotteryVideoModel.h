//
//  LotteryVideoModel.h
//  Lottery123
//
//  Created by 项目2 on 16/10/21.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryVideoModel : NSObject

+ (void)getLotteryInfoWithLotteryType:(NSString * _Nullable)type AndPeroid:(NSString * _Nullable)peroid blockCompletion: (nullable void(^)(NSDictionary * _Nullable lotteryDic))finishBlock;

+ (void)getNextLotteryInfoWithLotteryType:(NSString * _Nullable)type AndPeroid:(NSString * _Nullable)peroid blockCompletion: (nullable void(^)(NSDictionary * _Nullable lotteryDic))finishBlock withError:(nullable void(^)())errorBlock;

@end
