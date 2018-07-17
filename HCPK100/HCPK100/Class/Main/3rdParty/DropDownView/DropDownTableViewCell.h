//
//  DropDownTableViewCell.h
//  Lottery123
//
//  Created by 项目 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDownTableViewCell : UITableViewCell{
    UILabel *typeLabel;
    
}

-(void) setDropDownWithDict:(NSDictionary*)dropDict;


@end
