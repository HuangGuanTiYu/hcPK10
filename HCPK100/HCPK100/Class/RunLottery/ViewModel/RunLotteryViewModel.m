//
//  RunLotteryViewModel.m
//  Lottery123
//
//  Created by 项目2 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "RunLotteryViewModel.h"

@implementation RunLotteryViewModel

+ (void)getNewLotteryListWithScrollView:(UIScrollView *)scrollView BlockCompletion:(void (^)(NSArray * _Nullable))finishBlock withError:(void (^)(NSString * _Nullable))errorBlock{
    
    //获取最新开奖列表
    [AFHTTPRequest2 requestWithRequesturl:GetNewLotteryListURL headerSign:nil httpMethod:GET paramters:nil blockCompletion:^(id  _Nullable responseObject) {

        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            NSArray * arr = responseObject[@"data"];
            finishBlock(arr);
        }else{
            errorBlock(responseObject[@"result"][@"msg"]);
        }
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        errorBlock(@"请检查网络.");
    }];
}
@end
