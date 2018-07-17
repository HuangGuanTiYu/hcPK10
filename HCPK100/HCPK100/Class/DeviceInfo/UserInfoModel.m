//
//  UserInfoModel.m
//  Lottery123
//
//  Created by 项目 on 16/9/27.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel


+ (UserInfoModel *)shareInstance{
    static UserInfoModel *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}


-(NSString *)userId{
    
    NSString *tempUserId = [[NSUserDefaults standardUserDefaults] stringForKey:@"userId"];
    if (tempUserId == nil) {
        tempUserId = @"0";
    }
    return tempUserId;
}
-(NSString *)userMobile{
    
    NSString *tempUserMobile = [[NSUserDefaults standardUserDefaults] stringForKey:@"userMobile"];
    if (tempUserMobile == nil) {
        tempUserMobile = @"";
    }
    return tempUserMobile;
}
-(NSString *)userToken{
    
    NSString *tempUserToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"userToken"];
    if (tempUserToken == nil) {
        tempUserToken = @"";
    }
    return tempUserToken;
}
-(NSString *)userCash{
    
    NSString *userCash = [[NSUserDefaults standardUserDefaults] stringForKey:@"userCash"];
    if (userCash == nil) {
        userCash = @"0";
    }
    return userCash;
}
-(NSString *)userMoney{
    
    NSString *userMoney = [[NSUserDefaults standardUserDefaults] stringForKey:@"userMoney"];
    if (userMoney == nil) {
        userMoney = @"";
    }
    return userMoney;
}
-(NSString *)userBalance{
    
    NSString *userBalance = [[NSUserDefaults standardUserDefaults] stringForKey:@"userBalance"];
    if (userBalance == nil) {
        userBalance = @"";
    }
    return userBalance;
}
-(NSString *)userCashed{
    
    NSString *userCashed = [[NSUserDefaults standardUserDefaults] stringForKey:@"userCashed"];
    if (userCashed == nil) {
        userCashed = @"";
    }
    return userCashed;
}
-(NSString *)playMoney{
    
    NSString *playMoney = [[NSUserDefaults standardUserDefaults] stringForKey:@"playMoney"];
    if (playMoney == nil) {
        playMoney = @"0";
    }
    return playMoney;
}
-(NSString *)drawPWD{
    //是否已经设置提现密码
    NSString * drawPwd = [[NSUserDefaults standardUserDefaults] stringForKey:@"ifdraw"];
    if (drawPwd == nil) {
        drawPwd = @"0";
    }
    return drawPwd;
}
-(NSString *)userPrize{
    NSString *userPrize = [[NSUserDefaults standardUserDefaults] stringForKey:@"userPrize"];
    if (userPrize == nil) {
        userPrize = @"0";
    }
    return userPrize;
}


+(void) saveUserIdWithData:(NSDictionary *)userDict{
    
    
    NSString *oldUserId = [[NSUserDefaults standardUserDefaults] stringForKey:@"userId"];
    
    //用户Id
    NSString * userId = [NSString stringWithFormat:@"%@",userDict[@"u_id"]];
    if (userId == nil) {
        userId = @"0";
    }
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
    
    //用户手机
    NSString * userMobile = [NSString stringWithFormat:@"%@",userDict[@"mobile"]];
    if (userMobile == nil) {
        userMobile = @"0";
    }
    [[NSUserDefaults standardUserDefaults] setObject:userMobile forKey:@"userMobile"];
    
    
    //用户token
    NSString * userToken = [NSString stringWithFormat:@"%@",userDict[@"token"]];
    [[NSUserDefaults standardUserDefaults] setObject:userToken forKey:@"userToken"];
    
    //累计总额
    NSString * userCash = [NSString stringWithFormat:@"%.2f",[userDict[@"cash"] floatValue]];
    [[NSUserDefaults standardUserDefaults] setObject:userCash forKey:@"userCash"];
    
    //用户可消费金额
    NSString * userMoney = [NSString stringWithFormat:@"%.2f",[userDict[@"money"] floatValue]];
    [[NSUserDefaults standardUserDefaults] setObject:userMoney forKey:@"userMoney"];
    
    //用户可提金额
    NSString * userBalance = [NSString stringWithFormat:@"%.2f",[userDict[@"balance"] floatValue]];
    [[NSUserDefaults standardUserDefaults] setObject:userBalance forKey:@"userBalance"];
    
    //用户已提金额
    NSString * userCashed = [NSString stringWithFormat:@"%.2f",[userDict[@"cashed"] floatValue]];
    [[NSUserDefaults standardUserDefaults] setObject:userCashed forKey:@"userCashed"];
    
    //用户今日输赢金额
    NSString * playMoney = [NSString stringWithFormat:@"%.2f",[userDict[@"play"] floatValue]];
    [[NSUserDefaults standardUserDefaults] setObject:playMoney forKey:@"playMoney"];
    
    //是否已经设置提现密码
    NSString * drawPwd = [NSString stringWithFormat:@"%@",userDict[@"ifdraw"]];
    if (drawPwd == nil) {
        drawPwd = @"0";
    }
    [[NSUserDefaults standardUserDefaults] setObject:drawPwd forKey:@"ifdraw"];
    
    
    //中奖金额
    NSString *userPrize = [NSString stringWithFormat:@"%.2f",[[userDict objectForKey:@"prize"] floatValue]];
    [[NSUserDefaults standardUserDefaults] setObject:userPrize forKey:@"userPrize"];
    
    
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (![userId isEqualToString:oldUserId]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeUserIdRefreshMessage" object:nil];
    }
    
    
    
}

+(BOOL) judgeUserLoginStatus{
    
    NSString *tempUserToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"userToken"];
    if (tempUserToken == nil || [tempUserToken isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

@end
