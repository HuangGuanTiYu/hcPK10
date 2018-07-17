//
//  LotteryListViewController.m
//  Lottery123
//
//  Created by 项目2 on 16/9/28.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "LotteryListViewController.h"
#import "LotteryListCollectionViewCell.h"
#import "LotteryListViewModel.h"
#import "HomeDetailController.h"

@interface LotteryListViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView * lotteryListCol;//九宫格视图
    
    NSArray * lotteryListArr;
}

@end

@implementation LotteryListViewController


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self getLotteryListData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MainBGColor;//背景颜色
    [self createdControls];
    
}
#pragma mark --- 创建控件
- (void)createdControls{
    
    //创建9宫格
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    lotteryListCol = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH - 49 - 64) collectionViewLayout:flowLayout];
    [lotteryListCol registerClass:[LotteryListCollectionViewCell class] forCellWithReuseIdentifier:@"LotteryListCollectionViewCell"];
    lotteryListCol.backgroundColor = [UIColor clearColor];
    lotteryListCol.alwaysBounceVertical = YES;
    lotteryListCol.delegate = self;
    lotteryListCol.dataSource = self;
    [self.view addSubview:lotteryListCol];
    [lotteryListCol addHeaderWithTarget:self action:@selector(getLotteryListData)];//添加下拉刷新功能
}



#pragma mark --- collectionview代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return lotteryListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LotteryListCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LotteryListCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 5;
    cell.layer.masksToBounds = YES;
    [cell setLotteryListCellMessage:lotteryListArr[indexPath.item]];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW - 10, 90);
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
    
    
    HomeDetailController *lotteryVC = [[HomeDetailController alloc] init];
    lotteryVC.marketType = @"A";
    lotteryVC.lotteryType = lotteryListArr[indexPath.item][@"type"];
    lotteryVC.deailName = lotteryListArr[indexPath.item][@"title"];
    [self.navigationController pushViewController:lotteryVC animated:YES];
    
}

#pragma mark
- (void)getLotteryListData{
    
    static BOOL isRequestStatus = NO;
    if (isRequestStatus) {
        return;
    }
    isRequestStatus = YES;
    
    
    [LotteryListViewModel getLotteryListViewDataBlockCompletion:^(NSArray * _Nullable dataArr) {
        lotteryListArr = dataArr;
        if (lotteryListCol.headerRefreshing) {
            [lotteryListCol headerEndRefreshing];
        }
        [lotteryListCol reloadData];
        
        isRequestStatus = NO;
        
    } withError:^(NSString * _Nullable msg) {
        if (lotteryListCol.headerRefreshing) {
            [lotteryListCol headerEndRefreshing];
        }
        
        
        isRequestStatus = NO;
        
        static BOOL isLotteryListFirst = YES;
        if (isLotteryListFirst) {
            [self performSelector:@selector(getLotteryListData) withObject:nil afterDelay:1];
            isLotteryListFirst = NO;
        }        
    }];
}

#pragma mark --- others
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
