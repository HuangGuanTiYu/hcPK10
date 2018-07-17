//
//  RunLotteryViewController.m
//  testDemo
//
//  Created by 项目2 on 16/9/25.
//  Copyright © 2016年 项目2. All rights reserved.
//



#import "RunLotteryViewController.h"
#import "RunLotteryCollectionViewCell.h"//最新开奖cell
#import "RunLotteryViewModel.h"//
#import "HistoryTheLorrtyViewController.h"//历史开奖

@interface RunLotteryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView * runLotteryCol;//九宫格视图
    NSArray * lotteryListArr;//最新开奖数组
}
@end

@implementation RunLotteryViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self getRunLotteryData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MainBGColor;//背景颜色
    [self createdControls];

}

#pragma mark --- 创建控件
- (void)createdControls{
    
    //创建开奖表格
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    runLotteryCol = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH - 44 - 50) collectionViewLayout:flowLayout];
    [runLotteryCol registerClass:[RunLotteryCollectionViewCell class] forCellWithReuseIdentifier:@"RunLotteryCollectionViewCell"];
    runLotteryCol.backgroundColor = [UIColor clearColor];
    runLotteryCol.delegate = self;
    runLotteryCol.dataSource = self;
    runLotteryCol.alwaysBounceVertical = YES;
    [self.view addSubview:runLotteryCol];
    //添加下拉刷新方法
    [runLotteryCol addHeaderWithTarget:self action:@selector(getRunLotteryData)];
    //首次加载页面信息
    [self getRunLotteryData];
}

#pragma mark --- collectionview代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return lotteryListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RunLotteryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RunLotteryCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 5;
    cell.layer.masksToBounds = YES;
    [cell setHistoryTheLotteryCellMessage:lotteryListArr[indexPath.item]];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW - 10, 85);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 0, 0, 0);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HistoryTheLorrtyViewController * historyTheLotteryVc = [[HistoryTheLorrtyViewController alloc]init];
    historyTheLotteryVc.lotteryType = lotteryListArr[indexPath.item][@"type"];
    historyTheLotteryVc.lotteryName = lotteryListArr[indexPath.item][@"name"];
    [self.navigationController pushViewController:historyTheLotteryVc animated:YES];
}
#pragma mark --- 最新开奖信息
- (void)getRunLotteryData{
    
    
    static BOOL isRequestStatus = NO;
    if (isRequestStatus) {
        return;
    }
    isRequestStatus = YES;
    
    //获取最新开奖数组
    [RunLotteryViewModel getNewLotteryListWithScrollView:runLotteryCol  BlockCompletion:^(NSArray * _Nullable dataArr) {
        lotteryListArr = dataArr;
        
        if (runLotteryCol.headerRefreshing) {
            [runLotteryCol headerEndRefreshing];
        }
        
        [runLotteryCol reloadData];
        
        isRequestStatus = NO;
        
    } withError:^(NSString * _Nullable msg) {
        
        
        if (runLotteryCol.headerRefreshing) {
            [runLotteryCol headerEndRefreshing];
        }
        
        [runLotteryCol reloadData];
        
        isRequestStatus = NO;
        
    }];
}
#pragma mark --- others
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
