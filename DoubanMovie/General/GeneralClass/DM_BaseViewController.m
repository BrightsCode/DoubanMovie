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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:mImageByName(@"menu_titlebar") style:UIBarButtonItemStylePlain target:(DM_NavicationViewController *)self.navigationController action:@selector(showMenu)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
