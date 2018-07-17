//
//  HistoryLotteryViewModel.m
//  Lottery123
//
//  Created by 项目2 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "HistoryLotteryViewModel.h"

@implementation HistoryLotteryViewModel
+ (void)getHistoryLotteryListWithType:(NSString *)type andPage:(NSString *)page BlockCompletion:(void (^)(NSArray * _Nullable))finishBlock withError:(void (^)(NSString * _Nullable))errorBlock{
    
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:type,@"type",page,@"page",nil];
    

    //获取最新开奖列表
    [AFHTTPRequest2 requestWithRequesturl:GetNewLotteryListURL headerSign:nil httpMethod:GET paramters:dict blockCompletion:^(id  _Nullable responseObject) {

        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            NSArray * arr = responseObject[@"data"];
            finishBlock(arr);
        }else{
            errorBlock(responseObject[@"result"][@"msg"]);
        }
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        errorBlock(NoInternetService);
    }];
    
}


+ (void)getHistoryLotteryListWithType:(NSString *)type andPage:(NSString *)page andView:(UIScrollView *)scrollview BlockCompletion:(void (^)(NSArray * _Nullable))finishBlock withError:(void (^)(NSString * _Nullable))errorBlock{
        
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:type,@"lotterytype",page,@"page",nil];

    //获取最新开奖列表
    [AFHTTPRequest2 requestWithRequesturl:GetHistoryLotteryListURL headerSign:nil httpMethod:GET paramters:dict blockCompletion:^(id  _Nullable responseObject) {
        
        if (scrollview.headerRefreshing) {
            [scrollview headerEndRefreshing];
        }
        if (scrollview.footerRefreshing) {
            [scrollview footerEndRefreshing];
        }
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            NSArray * arr = responseObject[@"data"];
            finishBlock(arr);
        }else{
            errorBlock(responseObject[@"result"][@"msg"]);
        }
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (scrollview.headerRefreshing) {
            [scrollview headerEndRefreshing];
        }
        if (scrollview.footerRefreshing) {
            [scrollview footerEndRefreshing];
        }
        errorBlock(NoInternetService);
    }];
}

@end
