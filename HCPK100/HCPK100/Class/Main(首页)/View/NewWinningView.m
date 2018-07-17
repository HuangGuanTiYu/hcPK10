//
//  NewWinningView.m
//  Lottery123
//
//  Created by 项目2 on 16/9/23.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "NewWinningView.h"
#import "HomeMessageModel.h"
#import "MainTitleView.h"
@interface NewWinningView()<UITableViewDelegate,UITableViewDataSource>
{
    int newWinngingCount;//中奖列表计数   用于滚动
    NSTimer * newWinningTimer;//计时器  用于滚动
    
    
    UITableView * newWinningTab;//最新中奖表格视图
    CGFloat newWinningViewH;//用于测算视图高度
    
    NSMutableArray * userPrizeArr;//获取到的用户中奖信息数组
    
    NSArray * TemporaryArr;//临时存储数组
}
@end
@implementation NewWinningView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        newWinningViewH = frame.size.height;
        [self createdControls];
    }
    return self;
}

#pragma mark --- 表格的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return userPrizeArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return newWinningViewH/6.0;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"newWinningCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",userPrizeArr[indexPath.row]];
    if (indexPath.row %2 == 0) {
        cell.textLabel.textColor = MainRedColor;
    }else
        cell.textLabel.textColor = [UIColor colorWithRed:145*1.0/255 green:145*1.0/255 blue:145*1.0/255 alpha:1.0];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14* Scale];
    return cell;
}
#pragma mark --- 开始滚动
- (void)startTime{
    
    
    newWinningTimer = [NSTimer timerWithTimeInterval:2
                                              target:self selector:@selector(scrollNewWinningMessage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:newWinningTimer forMode:NSDefaultRunLoopMode];
    
}
- (void)scrollNewWinningMessage{
    
    newWinngingCount ++;
    
    [newWinningTab setContentOffset:CGPointMake(0, newWinngingCount * newWinningViewH/6.0) animated:YES];
    
    if (newWinngingCount == (int)(userPrizeArr.count/5*3)) {
        [self getUserPrizeArr];
    }
    
    //当之前加载的数据滚动完之后
    if (newWinngingCount == userPrizeArr.count - 5) {
        [newWinningTimer invalidate];

        if (TemporaryArr.count > 0) {
            [userPrizeArr removeAllObjects];
            [userPrizeArr addObjectsFromArray:TemporaryArr];
            [newWinningTab reloadData];
        }
        
        [self startTime];
        [newWinningTab setContentOffset:CGPointMake(0, 0) animated:NO];
        newWinngingCount = 1;
        [newWinningTab setContentOffset:CGPointMake(0, newWinngingCount * newWinningViewH/6.0) animated:YES];
        
    }
    
}

#pragma mark --- 创建页面控件
- (void)createdControls{
    //初始化数组
    MainTitleView * titleView = [[MainTitleView alloc]initWithTitle:@"最新中奖"];
    [self addSubview:titleView];
    
    userPrizeArr = [NSMutableArray new];
//    TemporaryArr = [NSMutableArray new];
    
    

    //最新中奖滚动图
    newWinningTab = [[UITableView alloc]initWithFrame:CGRectMake(5 * Scale, 34 * Scale, ScreenW - 10 * Scale, newWinningViewH - 34 * Scale)];
    newWinningTab.delegate = self;
    newWinningTab.dataSource = self;
    newWinningTab.userInteractionEnabled = NO;
    [newWinningTab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"newWinningCell"];
    newWinningTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:newWinningTab];
    
   
    
    
    [self getUserPrizeArr];
}

-(void)getUserPrizeArr{
    //用于判断是否是首次进入这个页面
    static BOOL firstUseThis = YES;
    //用于是否在加载中
    static BOOL isLoadingStatus = YES;
    
    
    if (firstUseThis == NO) {
        if (isLoadingStatus == NO) {
            return;
        }
    }
    
    
    
    
    TemporaryArr = [NSArray new];//初始临时数组
    isLoadingStatus = NO;
    [HomeMessageModel getUserprizeMessage:^(id  _Nullable responseObject) {
        isLoadingStatus = YES;//加载结束显示
        
            TemporaryArr = responseObject[@"lottery"];
        
        
            if (firstUseThis == YES) {
                [userPrizeArr addObjectsFromArray:TemporaryArr];
                firstUseThis = NO;
                [newWinningTab reloadData];
                [self startTime];
            }
//        }else{
//            
//        }
        
    
    }];
}

@end
