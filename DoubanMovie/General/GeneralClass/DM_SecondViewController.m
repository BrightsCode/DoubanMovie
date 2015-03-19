//
//  DM_SecondViewController.m
//  DoubanMovie
//
//  Created by apppc on 15/3/19.
//  Copyright (c) 2015年 huatek. All rights reserved.
//

#import "DM_SecondViewController.h"

@interface DM_SecondViewController ()

@end

@implementation DM_SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:mImageByName(@"btn_back") style:UIBarButtonItemStylePlain target:self action:@selector(actionBack)];
}

/**
 *  返回方法
 *
 *  @since 1.0
 */
-(void)actionBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
