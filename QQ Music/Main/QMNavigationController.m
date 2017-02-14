//
//  QMNavigationController.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/22.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMNavigationController.h"

@interface QMNavigationController ()

@end

@implementation QMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;

    self.navigationBar.barTintColor = UIColorFromRGB(0x1b2b3a);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
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
