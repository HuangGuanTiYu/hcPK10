//
//  DropDownView.h
//  Lottery123
//
//  Created by 项目 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "DropDownTableViewCell.h"

static NSString *DropDownTableViewCellIndentider = @"DropDownTableViewCellIndentider";

@interface DropDownView : UIView<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *myTableView;
    
    
    BOOL isShowDropDown;
    
    
}


@property (retain, nonatomic) NSArray *dropDownArr;


/** 下拉刷新选择 */
@property (retain ,nonatomic) void(^dropDownBlock)(NSDictionary*clickDict);


/**
 *  加载首页数据
 */
-(void) loadDropDownWithArr:(NSArray*)dropArr;

/**
 *  显示下拉列表
 */
-(void) showDropDownView;

@end
