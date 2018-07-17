//
//  LotteryListViewModel.h
//  Lottery123
//
//  Created by 项目2 on 16/10/1.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryListViewModel : NSObject

+ (void)getLotteryListViewDataBlockCompletion: (nullable void(^)(NSArray * _Nullable dataArr))finishBlock withError:(nullable void(^)(NSString * _Nullable msg))errorBlock;
@end
