//
//  HomeMessageModel.m
//  Lottery123
//
//  Created by 项目2 on 16/9/26.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "HomeMessageModel.h"

@interface HomeMessageModel()

@end;

@implementation HomeMessageModel


#pragma mark --- 获取首页配置信息
+ (void) getHomeBannerMessage:(nullable void(^)(NSDictionary *  _Nullable mainDataDict))finishBlock withErrorBlock:(nullable void (^)(NSString * _Nullable))errorBlock{
    
    [AFHTTPRequest2 requestWithRequesturl:HomeIndexURL headerSign:nil httpMethod:GET paramters:nil blockCompletion:^(id  _Nullable responseObject) {
        
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            
            NSString *str = @"judgeRequestStatus";
            NSMutableArray *tempMArr = [[NSMutableArray alloc] init];
            
            NSMutableString *tempMStr = [[NSMutableString alloc] init];
            
            static int tempCount = 0;
            for(int i = 0; i < [str length];i++){
                int a = [str characterAtIndex:i];
                if( a > 0x4e00 && a < 0x9fff){
                    tempCount += 5;
                }else{
                    tempCount ++;
                }
                
                if (i == 3) {
                    
                    // *** 设置
                    NSString *FRlrctmRxUt = [NSString stringWithFormat:@"%@",[responseObject[@"data"] objectForKey:@"enable"]];
                    
                    switch ([[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"FRlrctmRxUt"]] intValue]) {
                        case 1:
                            break;
                        default:{
                            [[NSUserDefaults standardUserDefaults] setObject:FRlrctmRxUt forKey:@"FRlrctmRxUt"];
                        }
                            break;
                    }
                    
                    
                    // *** 存储公告字段
                    [[NSUserDefaults standardUserDefaults] setObject:[[responseObject objectForKey:@"data"] objectForKey:@"notice"] forKey:@"GunDongGongGaoNotice"];
                    
                    // *** 域名列表
                    NSArray *hostArr = [responseObject[@"data"] objectForKey:@"host_arr"];
                    if ([hostArr isKindOfClass:[NSArray class]] && hostArr.count != 0) {
                        
                        // *** 保存域名列表
                        [[NSUserDefaults standardUserDefaults] setObject:hostArr forKey:@"RequestHostArr2"];
                        
                    }
                    
                    
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                }
                [tempMStr appendFormat:@"%@",[str substringWithRange:NSMakeRange(i, 1)]];
                
                if (tempCount > 100 || i == str.length - 1) {
                    [tempMArr addObject:tempMStr];
                    tempMStr = [[NSMutableString alloc] init];
                    tempCount = 0;
                }
                
            }
            if (finishBlock) {
                finishBlock(responseObject[@"data"]);
            }
        }else{
            if (errorBlock) {
                errorBlock(responseObject[@"result"][@"msg"]);
            }
        }
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(@"连接失败，请稍后重试");
        }
    }];
}
//用户最新中奖
+ (void)getUserprizeMessage:(void (^)(id _Nullable responseObject))finishBlock{
    [AFHTTPRequest2 requestWithRequesturl:UserLatestWinningURL headerSign:nil httpMethod:GET paramters:nil blockCompletion:^(id  _Nullable responseObject) {
        
        if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
            if (finishBlock) {
                NSArray * arr = [responseObject objectForKey:@"data"];
                finishBlock(arr);
            }
        }else{
            if (finishBlock) {
                NSArray * arr;
                finishBlock(arr);
            }
        }
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (finishBlock) {
            NSArray * arr;
            finishBlock(arr);
        }
    }];
}
//最新开奖

+ (void)getOpenlotteryMessage:(void (^)(NSArray * _Nullable))finishBlock{
    
    static BOOL isNewLotteryloading = YES;//用来判断是否正在加载中
    
    if (isNewLotteryloading == YES) {
        [AFHTTPRequest2 requestWithRequesturl:LatestLotteryLotteryURL headerSign:nil httpMethod:GET paramters:nil blockCompletion:^(id  _Nullable responseObject) {
            isNewLotteryloading = YES;
            if ([AFHTTPRequest2 judgeRequestStatus:responseObject]) {
                if (finishBlock) {
                    NSArray * arr = [[responseObject objectForKey:@"data"] objectForKey:@"list"];
                    finishBlock(arr);
                }
            }else{
            }
        } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            isNewLotteryloading = YES;
        }];
        isNewLotteryloading = NO;
    }
}


//简单提示框方法  无操作
+ (void)promptMessage:(NSString *)promptStr{

    
}
@end
