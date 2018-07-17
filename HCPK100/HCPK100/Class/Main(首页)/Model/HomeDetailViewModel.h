//
//  BuyLotteryViewModel.h
//  Lottery123
//
//  Created by 项目 on 16/9/28.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDetailViewModel : NSObject

+ (void) getBuyLotteryListWithType:(NSString*_Nullable)type andPlayType:(NSString*_Nullable)playType andMarketType:(NSString*_Nullable)marketType blockCompletion:(nullable void(^)(NSDictionary* _Nullable currentDict,NSDictionary* _Nullable previousDict,NSArray* _Nullable lotteryArr, NSArray * _Nullable buyTypeArr))finishBlock withError:(nullable void(^)(NSString* _Nullable errorMessage))errorBlock;


@end
