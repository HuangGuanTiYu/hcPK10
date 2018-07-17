//
//  LotteryVideoModel.m
//  Lottery123
//
//  Created by 项目2 on 16/10/21.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "LotteryVideoModel.h"

@implementation LotteryVideoModel

+ (void)getLotteryInfoWithLotteryType:(NSString *)type AndPeroid:(NSString *)peroid blockCompletion:(void (^)(NSDictionary * _Nullable))finishBlock{
    
    long int  nextPeroid = [peroid  longLongValue] - 1;
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:type,@"type",[NSString stringWithFormat:@"%ld",nextPeroid],@"period", nil];
    

    [AFHTTPRequest2 requestWithRequesturl:VideoInfoURL headerSign:nil httpMethod:GET paramters:dict blockCompletion:^(id  _Nullable responseObject) {
        
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            NSDictionary * lotteryDic = responseObject[@"data"];
            
            if (finishBlock) {
                finishBlock(lotteryDic);
            }
        }else{

        }
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

    }];
}

+ (void)getNextLotteryInfoWithLotteryType:(NSString *)type AndPeroid:(NSString *)peroid blockCompletion:(void (^)(NSDictionary * _Nullable))finishBlock withError:(void (^)())errorBlock
{
    

    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:type,@"type",peroid,@"period", nil];
    
    [AFHTTPRequest2 requestWithRequesturl:VideoInfoURL headerSign:nil httpMethod:GET paramters:dict blockCompletion:^(id  _Nullable responseObject) {
        
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            NSDictionary * lotteryDic = responseObject[@"data"];
            
            NSArray * prizecodeArr = lotteryDic[@"current"][@"prizecode"];
            
            //判断结果数组是否为空
            if (prizecodeArr.count < 1) {//无数据的时候
                if (errorBlock) {
                    errorBlock();
                }
            }else{//有数据时
                if (finishBlock) {
                    finishBlock(lotteryDic);
                }
            }
        }else{
            if (errorBlock) {
                errorBlock();
            }
        }
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

    }];

}
@end
