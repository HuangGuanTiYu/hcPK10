//
//  MainViewController.h
//  Lottery123
//
//  Created by 项目 on 16/9/22.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpeningOfAdView.h"


@interface MainViewController : UIViewController{
    NSArray * lotteryListArr;
    
    NSArray *menuArr;
    
    CGFloat enableStatusFloat;
    
    BOOL openADStatusStop;
    
    
    BOOL isShowMainVC;
    
}

@property (assign, nonatomic) BOOL mainListRequestStatus;


@end





