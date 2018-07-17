//
//  RCSegmentView.m
//  ProjectOne
//
//  Created by RongCheng on 16/3/31.
//  Copyright © 2016年 JiYue.com. All rights reserved.
//

#import "RCSegmentView.h"

@implementation RCSegmentView
- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray andType:(int)type andStartSelect:(int)selectIndex{
    if ( self=[super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];

        self.nameArray=titleArray;
        
        self.segmentView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.segmentView.tag=50;
        [self addSubview:self.segmentView];
        
        
        
        if (type == 0) {
            
            for (int i=0;i<self.nameArray.count;i++){
                UIButton * btn=[ UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame=CGRectMake(i*(frame.size.width/self.nameArray.count), 0, frame.size.width/self.nameArray.count, frame.size.height);
                btn.tag=i;
                [btn setTitle:self.nameArray[i] forState:(UIControlStateNormal)];
                [btn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
                [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
                [btn addTarget:self action:@selector(Click:) forControlEvents:(UIControlEventTouchUpInside)];
                btn.titleLabel.font=[UIFont systemFontOfSize:14];
                if ( i == selectIndex ){
                    btn.selected = YES ;
                    self.seleBtn = btn;
                    btn.titleLabel.font = [UIFont systemFontOfSize:15];
                } else {
                    btn.selected=NO;
                }
                
                [self.segmentView addSubview:btn];
            }
            self.line=[[UILabel alloc]initWithFrame:CGRectMake(0,38.5, frame.size.width/self.nameArray.count, 1.5)];
            self.line.backgroundColor = NavBGColor;
            self.line.tag=100;
            [self.segmentView addSubview:self.line];
        }else{
            
            for (int i=0;i<self.nameArray.count;i++){
                UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame=CGRectMake(i*(frame.size.width/self.nameArray.count), 0, frame.size.width/self.nameArray.count, frame.size.height);
                btn.tag=i;
                [btn setTitle:self.nameArray[i] forState:(UIControlStateNormal)];
                btn.titleLabel.font=[UIFont systemFontOfSize:13];
                
                
                if (type == 1) {
                    
                    if ([NSString stringWithFormat:@"%@",self.nameArray[i]].length >= 4) {
                        btn.titleLabel.font=[UIFont systemFontOfSize:11];
                    }
                    
                    btn.layer.borderWidth = 0.5;
                    btn.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
                    
                    
                    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
                    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
                    [btn addTarget:self action:@selector(blockButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
                    if ( i == 0 ){
                        btn.selected = YES ;
                        self.seleBtn = btn;
                        btn.backgroundColor = NavBGColor;
                    } else {
                        btn.selected=NO;
                    }
                    
                    
                }else{
                    
                    btn.titleLabel.font=[UIFont systemFontOfSize:16];
                    
                    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
                    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
                    [btn addTarget:self action:@selector(blockMainClick:) forControlEvents:(UIControlEventTouchUpInside)];
                    if ( i == selectIndex ){
                        btn.selected = YES ;
                        self.seleBtn = btn;
                        btn.backgroundColor = NavBGColor;
                    } else {
                        btn.selected=NO;
                        
                        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, btn.frame.size.height)];
                        lineView.backgroundColor = MainBGColor;
                        [btn addSubview:lineView];
                        
                    }
                    
                }
                [self.segmentView addSubview:btn];
            }
        }
        
    }
    return self;
}
//类型1
- (void)Click:(UIButton*)sender{

    self.seleBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.seleBtn.selected=NO;
    self.seleBtn=sender;
    self.seleBtn.selected=YES;
    self.seleBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint  frame=self.line.center;
        frame.x=self.frame.size.width/(self.nameArray.count*2) +(self.frame.size.width/self.nameArray.count)* (sender.tag);
        self.line.center=frame;
    }];
    
    
    [self.delegate segmentClickWithIndex:sender.tag];
    
}
//类型2
- (void)blockButtonClick:(UIButton*)sender{
    
    self.seleBtn.backgroundColor = [UIColor whiteColor];
    self.seleBtn.selected=NO;
    self.seleBtn=sender;
    self.seleBtn.selected=YES;
    self.seleBtn.backgroundColor = NavBGColor;
    
    
    if (self.typeSegmentBlock) {
        self.typeSegmentBlock(sender.tag);
    }
    
    
}
//类型3
- (void)blockMainClick:(UIButton*)sender{
    
    self.seleBtn.backgroundColor = [UIColor clearColor];
    self.seleBtn.selected=NO;
    self.seleBtn=sender;
    self.seleBtn.selected=YES;
    self.seleBtn.backgroundColor = NavBGColor;
    
    
    
    if (self.typeSegmentBlock) {
        self.typeSegmentBlock(sender.tag);
    }
}


 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
