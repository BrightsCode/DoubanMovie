//
//  DM_RankListViewController.m
//  DoubanMovie
//
//  Created by apppc on 15/3/19.
//  Copyright (c) 2015年 huatek. All rights reserved.
//
//榜单
#import "DM_RankListViewController.h"
#import "DM_RankCollectionViewCell.h"
#import "DM_RankDetailViewController.h"

@interface DM_RankListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic) UICollectionView *collectRankList;
@property (strong,nonatomic) UICollectionViewFlowLayout* collectLayout;
@property (strong,nonatomic) NSArray *arrayTitle;  //排行榜名称
@property (strong,nonatomic) NSArray *arrayImage;  //排行榜图片
@property (strong,nonatomic) NSArray *arrayDetail; //排行版说明
@property (strong,nonatomic) NSArray *arrayUrl;    //榜单URL参数；
@end

@implementation DM_RankListViewController
@synthesize collectLayout;
@synthesize collectRankList;
@synthesize arrayTitle;
@synthesize arrayImage;
@synthesize arrayDetail;
@synthesize arrayUrl;

NSString *const  CollectionCellIdentifier = @"rankListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"榜单";
    
    collectLayout = [[UICollectionViewFlowLayout alloc]init];
    [collectLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    collectLayout.itemSize = CGSizeMake(self.view.width/2,100);
    collectLayout.minimumLineSpacing = 0;
    collectLayout.minimumInteritemSpacing = 0;
    collectLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0 , 0);
    
    collectRankList = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64) collectionViewLayout:collectLayout];
    collectRankList.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    collectRankList.dataSource = self;
    collectRankList.delegate = self;
    collectRankList.backgroundColor = [UIColor whiteColor];
    [collectRankList registerClass:[DM_RankCollectionViewCell class] forCellWithReuseIdentifier:CollectionCellIdentifier];
    collectRankList.showsHorizontalScrollIndicator = NO;
    collectRankList.showsVerticalScrollIndicator = NO;
    collectRankList.alwaysBounceVertical = YES;
    [self.view addSubview:collectRankList];
    
    arrayTitle = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    arrayImage = @[@"",@"",@"",@"",@"",@""];
    arrayDetail = @[@"",@"",@"",@"",@"",@""];
    arrayUrl = @[@"nowplaying",@"coming",@"top250",@"us_box",@"weekly",@"new_movies"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrayTitle.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DM_RankCollectionViewCell *cell =
    (DM_RankCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier
                                                                                         forIndexPath:indexPath];
    cell.imgRank.image = mImageByName(arrayImage[indexPath.row]);
    cell.labTitle.text = arrayTitle[indexPath.row];
    cell.labDetail.text = arrayDetail[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    DM_RankDetailViewController *rankDetail = [[DM_RankDetailViewController alloc] init];
    rankDetail.rankParameter = arrayUrl[indexPath.row];
    [self.navigationController pushViewController:rankDetail animated:YES];
}

@end