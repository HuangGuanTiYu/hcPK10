//
//  RequestDefaultView.h
//  AlwaysPlay
//
//  Created by xiangmu on 2017/8/22.
//  Copyright © 2017年 AlwaysPlay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestDefaultView : UIView

/**
 *  重新请求点击事件
 */
@property (nonatomic, copy) void (^againRequestBlock)();


/**
 链接失败提示图片
 */
@property (retain, nonatomic) UIView *requestErrorView;
/**
 链接失败提示文字
 */
@property (retain, nonatomic) UILabel *requestErrorLabel;

@end
