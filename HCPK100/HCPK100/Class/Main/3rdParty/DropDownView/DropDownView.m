//
//  DropDownView.m
//  Lottery123
//
//  Created by 项目 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "DropDownView.h"

@implementation DropDownView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        
        self.hidden = YES;
        
        UIView *tempMainBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
        [self addSubview:tempMainBGView];
        
        UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDropDownView)];
        [tempMainBGView addGestureRecognizer:mainTap];
        
        
        myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0)];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        [self addSubview:myTableView];
        [myTableView registerClass:[DropDownTableViewCell class] forCellReuseIdentifier:DropDownTableViewCellIndentider];
        myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
    }
    return self;
}


-(void) loadDropDownWithArr:(NSArray*)dropArr{
    
    self.dropDownArr = dropArr;
    
    [myTableView reloadData];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dropDownArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DropDownTableViewCell *cell = (DropDownTableViewCell*)[tableView dequeueReusableCellWithIdentifier:DropDownTableViewCellIndentider forIndexPath:indexPath];
    
    [cell setDropDownWithDict:self.dropDownArr[indexPath.row]];
    
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self showDropDownView];
    
    if (self.dropDownBlock) {
        self.dropDownBlock(self.dropDownArr[indexPath.row]);
    }
    
}


-(void)showDropDownView{
    
    if (isShowDropDown) {
        
        [UIView animateWithDuration:0.5 animations:^{
            myTableView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
            self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
        } completion:^(BOOL finished) {
            self.hidden = YES;
        }];
    }else{
        
        self.hidden = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
            if (self.dropDownArr.count * 45 > self.frame.size.height) {
                myTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            }else{
                myTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.dropDownArr.count * 45);
            }
        }];
    }
    
    isShowDropDown = !isShowDropDown;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
