//
//  DropDownTableViewCell.m
//  Lottery123
//
//  Created by 项目 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "DropDownTableViewCell.h"

@implementation DropDownTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createdControls];
    }
    return self;
}

- (void)createdControls{
    
    typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenW, self.frame.size.height)];
    typeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:typeLabel];
    typeLabel.font = [UIFont systemFontOfSize:14];
    
    
    UIView *tempLineView = [[UIView alloc] initWithFrame:CGRectMake(20, self.frame.size.height - 1, ScreenW - 40, 1)];
    tempLineView.backgroundColor = HUIRGBCOLOR(235, 235, 235);
    [self addSubview:tempLineView];
    
}

-(void)setDropDownWithDict:(NSDictionary *)dropDict{
    typeLabel.text = [dropDict objectForKey:@"title"];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
