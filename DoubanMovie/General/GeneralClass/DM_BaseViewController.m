//
//  DM_BaseViewController.m
//  DoubanMovie
//
//  Created by apppc on 15/3/18.
//  Copyright (c) 2015年 huatek. All rights reserved.
//

#import "DM_BaseViewController.h"
#import "DM_NavicationViewController.h"

@interface DM_BaseViewController ()

@end

@implementation DM_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:mImageByName(@"btn_menu") style:UIBarButtonItemStylePlain target:(DM_NavicationViewController *)self.navigationController action:@selector(showMenu)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
