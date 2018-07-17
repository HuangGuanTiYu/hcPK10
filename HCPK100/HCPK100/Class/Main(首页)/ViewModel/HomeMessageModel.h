//
//  HomeMessageModel.h
//  Lottery123
//
//  Created by 项目2 on 16/9/26.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeMessageModel : NSObject
/**
 *获取首页配置信息
 */
+ (void) getHomeBannerMessage:(nullable void(^)(NSDictionary * _Nullable mainDataDict))finishBlock withErrorBlock:(nullable void(^)(NSString * _Nullable errorMsg))errorBlock;
/**
 *获取最新的用户中奖数据
 */
+ (void) getUserprizeMessage:(nullable void(^)(id  _Nullable responseObject))finishBlock;
/**
 *获取最新的  种开奖数据
 */
+ (void) getOpenlotteryMessage:(nullable void(^)(NSArray * _Nullable runLotteryArr))finishBlock;

/**
 *无操作提示框
 */
+ (void) promptMessage:(NSString * _Nullable)promptStr;
@end
