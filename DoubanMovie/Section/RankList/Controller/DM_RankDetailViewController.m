//
//  DM_RankDetailViewController.m
//  DoubanMovie
//
//  Created by apppc on 15/3/19.
//  Copyright (c) 2015年 huatek. All rights reserved.
//
//电影列表

#import "DM_RankDetailViewController.h"

@interface DM_RankDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *detailTable;
@property (nonatomic, strong) NSMutableArray *arrayList;
@end

@implementation DM_RankDetailViewController
@synthesize detailTable;
@synthesize arrayList;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.rankTitle;
    
    detailTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
    detailTable.backgroundColor = [UIColor whiteColor];
    detailTable.delegate = self;
    detailTable.dataSource = self;
    [self.view addSubview:detailTable];
    
    [self loadData];
}

-(void)loadData
{
    
}

#pragma mark  UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
