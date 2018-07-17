//
//  LotteryTrendViewModel.m
//  Lottery123
//
//  Created by 项目 on 16/9/29.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "LotteryTrendViewModel.h"

@implementation LotteryTrendViewModel

+(void)getTrendWithLotteryType:(NSString *)lotteryType andSelectType:(NSString *)type blockCompletion:(void (^)(NSArray * _Nullable, NSArray * _Nullable))finishBlock withError:(void (^)(NSString * _Nullable))errorBlock{
    
    
    NSDictionary *tempDict = [[NSDictionary alloc] initWithObjectsAndKeys:lotteryType,@"lotterytype",type,@"type", nil];

    [AFHTTPRequest2 requestWithRequesturl:LotteryTrendURL headerSign:nil httpMethod:GET paramters:tempDict blockCompletion:^(id  _Nullable responseObject) {
        
        
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            
            NSArray *selectTypeArr = [[responseObject objectForKey:@"data"] objectForKey:@"head"];
            
            NSArray *lotteryTrendArr = [[responseObject objectForKey:@"data"] objectForKey:@"trend"];
            
            if (finishBlock) {
                finishBlock(selectTypeArr,lotteryTrendArr);
            }
            
        }
        
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

+(void)getRankWithLotteryType:(NSString *)lotteryType blockCompletion:(void (^)(NSArray * _Nullable))finishBlock withError:(void (^)(NSString * _Nullable))errorBlock{
    
    
    NSDictionary *tempDict = [[NSDictionary alloc] initWithObjectsAndKeys:lotteryType,@"lotterytype", nil];
    
    [AFHTTPRequest2 requestWithRequesturl:LotteryRankURL headerSign:nil httpMethod:GET paramters:tempDict blockCompletion:^(id  _Nullable responseObject) {
        
        
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            
            NSArray *rankArr = [responseObject objectForKey:@"data"];
            
            
            if (finishBlock) {
                finishBlock(rankArr);
            }
            
        }
        
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}



@end
