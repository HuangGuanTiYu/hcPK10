//
//  LotteryListCollectionViewCell.m
//  Lottery123
//
//  Created by 项目2 on 16/9/28.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "LotteryListCollectionViewCell.h"
@interface LotteryListCollectionViewCell(){
    UIImageView * lotteryImage;
    UILabel * lotteryName;
    UILabel * promtpLabel;//时间  期数
}
@end
@implementation LotteryListCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createdControls];
    }
    return self;
}
-(void)createdControls{
    lotteryImage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 10, 70, 70)];
//    lotteryImage.layer.cornerRadius = lotteryImage.frame.size.width/2;
//    lotteryImage.layer.masksToBounds = YES;
    [self.contentView addSubview:lotteryImage];

    lotteryName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lotteryImage.frame) + 20, 20, 250, 30)];
    lotteryName.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:lotteryName];
    //时间 期数
    promtpLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lotteryImage.frame) + 20, 50, 250 * Scale, 20)];
    promtpLabel.textColor = [UIColor grayColor];
    promtpLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:promtpLabel];
    //箭头
    UIImageView * arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenW - 28, 38, 8, 14)];
    arrowImage.image = [UIImage imageNamed:@"lottery_arrow"];
    [self.contentView addSubview:arrowImage];
}
- (void)setLotteryListCellMessage:(NSDictionary *)dict{
    
    [lotteryImage setImageWithURL:[NSURL URLWithString:dict[@"img"]] placeholderImage:[UIImage imageNamed:@"home_lottery"]];
    
    lotteryName.text = dict[@"title"];
    
    promtpLabel.text = dict[@"period"];
}
@end
