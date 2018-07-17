//
//  ActivityView.h
//  Lottery123
//
//  Created by 项目2 on 16/10/24.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityView : UIView
- (instancetype)initWithURL:(NSString*)activityurl;
@property (nonatomic, copy) void (^typeActionBlock)(NSString * typeAction);
@end
