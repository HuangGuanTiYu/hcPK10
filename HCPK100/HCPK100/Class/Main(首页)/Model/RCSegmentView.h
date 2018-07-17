//
//  RCSegmentView.h
//  ProjectOne
//
//  Created by RongCheng on 16/3/31.
//  Copyright © 2016年 JiYue.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCSegmentViewDelegate <NSObject>

-(void) segmentClickWithIndex:(int)index;

@end

@interface RCSegmentView : UIView <UIScrollViewDelegate>



@property (nonatomic,strong)NSArray * nameArray;
@property (nonatomic,strong)UIView * segmentView;
@property (nonatomic,strong)UILabel * line;
@property (nonatomic ,strong)UIButton * seleBtn;
@property (nonatomic,strong) NSString * selectIndex;

@property (nonatomic,assign) id<RCSegmentViewDelegate>delegate;

@property (nonatomic, copy) void (^typeSegmentBlock)(int index);

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray andType:(int)type andStartSelect:(int)selectIndex;
@end
