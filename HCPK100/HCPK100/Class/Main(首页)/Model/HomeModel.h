//
//  HomeModel.h
//  HBFrame
//
//  Created by   on 2018/7/2.
//  Copyright © 2018年 guahibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

/** 标题 */
@property (copy, nonatomic) NSString* title;

/** 类型 */
@property (copy, nonatomic) NSString* type;

/** 列表 */
@property (copy, nonatomic) NSArray* list;

@end
