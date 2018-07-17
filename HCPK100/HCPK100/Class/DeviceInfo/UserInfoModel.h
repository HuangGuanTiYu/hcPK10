//
//  UserInfoModel.h
//  Lottery123
//
//  Created by 项目 on 16/9/27.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject


/** 用户ID */
@property (nonatomic, copy) NSString *userId;
/** 用户手机号 */
@property (nonatomic, copy) NSString *userMobile;
/** 用户TOKEN */
@property (nonatomic, copy) NSString *userToken;
/** 用户累计总额 */
@property (nonatomic, copy) NSString *userCash;
/** 用户可消费金额 */
@property (nonatomic, copy) NSString *userMoney;
/** 用户可提现金额 */
@property (nonatomic, copy) NSString *userBalance;
/** 用户已提现金额 */
@property (nonatomic, copy) NSString *userCashed;
/** 用户今日输赢金额 */
@property (nonatomic, copy) NSString *playMoney;
/** 是否已经设置了提现密码 */
@property (nonatomic, copy) NSString *drawPWD;
/** 中奖金额 */
@property (nonatomic, copy) NSString *userPrize;



/**
 *  获取用户信息对象
 *
 */
+ (UserInfoModel *)shareInstance;

/**
 *  判断用户是否登录
 */
+(BOOL) judgeUserLoginStatus;

/**
 *  保存用户信息
 */
+(void) saveUserIdWithData:(NSDictionary *)userDict;

@end
