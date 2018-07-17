//
//  HistoryTheLorrtyViewController.m
//  testDemo
//
//  Created by 项目2 on 16/9/24.
//  Copyright © 2016年 项目2. All rights reserved.
//

#import "HistoryTheLorrtyViewController.h"
#import "HistoryTheLotteryCollectionViewCell.h"
#import "HistoryLotteryViewModel.h"

@interface HistoryTheLorrtyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView * historyTheLorrtyCol;//九宫格视图
    NSMutableArray * historyLotteryArr;//历史开奖列表
    int listPage;//页码
}
@end

@implementation HistoryTheLorrtyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    historyLotteryArr = [NSMutableArray new];
    self.view.backgroundColor = MainBGColor;
    listPage = 1;//初始化页码
    [self createdControls];
    
    self.title = self.lotteryName;
   
}
#pragma mark --- 创建控件
- (void)createdControls{
   
    //创建历史开奖表格
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    historyTheLorrtyCol = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH - 54) collectionViewLayout:flowLayout];
    [historyTheLorrtyCol registerClass:[HistoryTheLotteryCollectionViewCell class] forCellWithReuseIdentifier:@"HistoryTheLotteryCollectionViewCell"];
    historyTheLorrtyCol.backgroundColor = [UIColor clearColor];
    historyTheLorrtyCol.delegate = self;
    historyTheLorrtyCol.dataSource = self;
    historyTheLorrtyCol.alwaysBounceVertical = YES;//当collectionView的大小小于主视图时  默认可以滚动
    [self.view addSubview:historyTheLorrtyCol];
    //添加刷新方法
    [historyTheLorrtyCol addHeaderWithTarget:self action:@selector(touchHeaderRefersh)];
    [historyTheLorrtyCol addFooterWithTarget:self action:@selector(touchFooterRefersh)];
    [self getHistoryTheLotteryData:listPage];//初始调用获取数据
}

//返回按钮
- (void)backButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//刷新方法
//下拉
- (void)touchHeaderRefersh{
    listPage = 1;
    [self getHistoryTheLotteryData:listPage];
}
//上提
- (void)touchFooterRefersh{
    listPage ++;
    [self getHistoryTheLotteryData:listPage];
}
#pragma mark --- collectionview代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return historyLotteryArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HistoryTheLotteryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HistoryTheLotteryCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    [cell setHistoryTheLotteryCellMessage:historyLotteryArr[indexPath.item]];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW, 150);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5 , 0, 5 , 0);
}





#pragma mark --- others
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)getHistoryTheLotteryData:(int)page{
    NSString * pageStr = [NSString stringWithFormat:@"%d",page];
    
    [HistoryLotteryViewModel getHistoryLotteryListWithType:self.lotteryType andPage:pageStr andView:historyTheLorrtyCol BlockCompletion:^(NSArray * _Nullable dataArr) {
        if (dataArr.count < 1) {

        }
        
        if (page == 1) {//当page等于1的时候自动清空数组
            [historyLotteryArr removeAllObjects];
        }
        [historyLotteryArr  addObjectsFromArray:dataArr];//讲获取到的数据添加到数组里
        
        [historyTheLorrtyCol reloadData];

    } withError:^(NSString * _Nullable msg) {        

    }];
}

@end
