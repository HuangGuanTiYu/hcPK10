//
//  LotteryListViewModel.m
//  Lottery123
//
//  Created by 项目2 on 16/10/1.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "LotteryListViewModel.h"

@implementation LotteryListViewModel

+ (void)getLotteryListViewDataBlockCompletion:(void (^)(NSArray * _Nullable))finishBlock withError:(void (^)(NSString * _Nullable))errorBlock{
    
    [AFHTTPRequest2 requestWithRequesturl:BetOnThehallURL headerSign:nil httpMethod:GET paramters:nil blockCompletion:^(id  _Nullable responseObject) {

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

@end
