//
//  DM_RankListViewController.m
//  DoubanMovie
//
//  Created by apppc on 15/3/19.
//  Copyright (c) 2015年 huatek. All rights reserved.
//
//榜单列表
#import "DM_RankListViewController.h"
#import "DM_RankCollectionViewCell.h"
#import "DM_RankDetailViewController.h"

@interface DM_RankListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic) UICollectionView *collectRankList;
@property (strong,nonatomic) UICollectionViewFlowLayout* collectLayout;
@property (strong,nonatomic) NSArray *rankInfoList;
@end

@implementation DM_RankListViewController
@synthesize collectLayout;
@synthesize collectRankList;

NSString *const  CollectionCellIdentifier = @"rankListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"榜单";
    
    collectLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    collectLayout.itemSize = CGSizeMake(self.view.width/2,150);
    collectLayout.minimumLineSpacing = 0;
    collectLayout.minimumInteritemSpacing = 0;
    collectLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0 , 0);
    
    collectRankList = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64) collectionViewLayout:collectLayout];
    collectRankList.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    collectRankList.dataSource = self;
    collectRankList.delegate = self;
    collectRankList.backgroundColor = [UIColor whiteColor];
    [collectRankList registerClass:[DM_RankCollectionViewCell class] forCellWithReuseIdentifier:CollectionCellIdentifier];
    collectRankList.showsHorizontalScrollIndicator = NO;
    collectRankList.showsVerticalScrollIndicator = NO;
    collectRankList.alwaysBounceVertical = NO;
    [self.view addSubview:collectRankList];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"rankInfo" ofType:@"json"];
    
    NSError *error = nil;
    NSDictionary * rankListDic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:jsonPath] options:NSJSONReadingMutableLeaves error:&error];
    
    self.rankInfoList = rankListDic[@"rankInfo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.rankInfoList.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DM_RankCollectionViewCell *cell =
    (DM_RankCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier forIndexPath:indexPath];
    
    NSDictionary *dicInfo = self.rankInfoList[indexPath.row];
    
    cell.imgRank.image = mImageByName(dicInfo[@"image"]);
    cell.labTitle.text = dicInfo[@"title"];
    cell.labDetail.text = dicInfo[@"detail"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    NSDictionary *dicInfo = self.rankInfoList[indexPath.row];
    
    DM_RankDetailViewController *rankDetail = [[DM_RankDetailViewController alloc] init];
    rankDetail.rankParameter = dicInfo[@"rank_url"];
    rankDetail.rankTitle = dicInfo[@"title"];
    [self.navigationController pushViewController:rankDetail animated:YES];
}

@end
