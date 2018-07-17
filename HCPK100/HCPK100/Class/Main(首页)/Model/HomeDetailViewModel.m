//
//  BuyLotteryViewModel.m
//  Lottery123
//
//  Created by 项目 on 16/9/28.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "HomeDetailViewModel.h"
#import "HomeModel.h"

@implementation HomeDetailViewModel

+(void)getBuyLotteryListWithType:(NSString *)type andPlayType:(NSString*)playType andMarketType:(NSString*)marketType blockCompletion:(void (^)(NSDictionary * _Nullable, NSDictionary * _Nullable, NSArray * _Nullable, NSArray * _Nullable))finishBlock withError:(void (^)(NSString * _Nullable))errorBlock{
    
    NSDictionary *tempDict = [[NSDictionary alloc] initWithObjectsAndKeys:type,@"type",marketType,@"markettype",playType,@"playtype", nil];
    
    [AFHTTPRequest2 requestWithRequesturl:GetHomeDetailURL headerSign:nil httpMethod:GET paramters:tempDict blockCompletion:^(id  _Nullable responseObject) {
        
        
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            
            NSDictionary *backDict = [responseObject objectForKey:@"data"];
            
            // *** 倒计时
            NSDictionary *currentDict = [backDict objectForKey:@"current"];
            
            // *** 上期
            NSDictionary *previousDict = [backDict objectForKey:@"previous"];
            
            NSMutableArray *lotteryMArr = [[NSMutableArray alloc] initWithArray:[backDict objectForKey:@"lottery"]];
            
            
            // *** 类型数组
            NSArray *buyTypeArr = [backDict objectForKey:@"type"];
            
            NSMutableArray *tempMArr = [[NSMutableArray alloc] init];
            
            NSMutableArray *returnMArr = [[NSMutableArray alloc] init];
            
            
            int hasTotal = 1;
            
            // *** 总个数
            NSInteger tempCount = lotteryMArr.count;
            
            for (int i = 0; i < tempCount; i++) {
                
                NSDictionary *tempDict = lotteryMArr[i];
                
                HomeModel *lotteryModel = [[HomeModel alloc] init];
                lotteryModel.type = [tempDict objectForKey:@"type"];
                lotteryModel.title = [tempDict objectForKey:@"title"];
                lotteryModel.list = [tempDict objectForKey:@"list"];
                
                [tempMArr addObject:lotteryModel];
                
                
                // *** 判断是否总和
                if ([lotteryModel.type
                     isEqualToString:@"total"]) {
                    [returnMArr addObject:tempMArr];
                    
                    tempMArr = [[NSMutableArray alloc] init];
                    
                    hasTotal = 0;
                }else{
                    if ((i + hasTotal) % 4 == 0 || i == tempCount - 1) {
                        [returnMArr addObject:tempMArr];
                        tempMArr = [[NSMutableArray alloc] init];
                    }
                }
            }
            
            
            if (finishBlock) {
                finishBlock(currentDict,previousDict,returnMArr,buyTypeArr);
            }
            
            
        }else{
            if (errorBlock) {
                errorBlock([[responseObject objectForKey:@"result"] objectForKey:@"msg"]);
            }
        }
        
        
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorBlock) {
            errorBlock(@"信息加载失败，请稍后重试");
        }
        
    }];
}


@end
