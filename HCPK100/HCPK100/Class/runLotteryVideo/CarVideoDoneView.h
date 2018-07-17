//
//  CarVideoDoneView.h
//  Lottery123
//
//  Created by 项目2 on 16/10/21.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarVideoDoneView : UIView
- (instancetype)initWith:(NSDictionary *)dict;
@property (nonatomic, copy) void (^typeActionBlock)(NSString * actionType);
@end
