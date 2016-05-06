//
//  BaseNavigationController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //全局修改导航栏的背景颜色
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"pic_title_bg.9"] forBarMetrics:UIBarMetricsDefault];

    
    
    //富文本属性
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];




}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;

}



@end
