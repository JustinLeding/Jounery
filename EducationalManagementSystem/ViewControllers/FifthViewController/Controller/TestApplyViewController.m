//
//  TestApplyViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/27.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "TestApplyViewController.h"
@interface TestApplyViewController ()

@end

@implementation TestApplyViewController

-(void)awakeFromNib{
    self.navigationItem.title = @"等级考试报名";

    //首先从处理数据
    [self loadData];
    
    
    
    
    
    
    
    
    
}


//首先从处理数据
-(void)loadData{
    
   
}




//英语四级报名按钮响应的方法
- (IBAction)EnglishFourApply:(UIButton *)sender {
    
 }
//英语六级报名
- (IBAction)EnglishSixApply:(UIButton *)sender {
    
}

//普通话报名考试
- (IBAction)ChineseApply:(UIButton *)sender {
}


//页面将要出现的时候调用的方法
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    
}



@end
