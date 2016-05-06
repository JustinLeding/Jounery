//
//  CourseDetailsViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/4/17.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "CourseDetailsViewController.h"

@interface CourseDetailsViewController ()

@end

@implementation CourseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    self.title = @"课程详情";
}

-(void)setModel:(CourseSelectModel *)model{
    _model = model;
    
    //创建视图添加到self.View上
    UIView * courseView = [[[NSBundle mainBundle] loadNibNamed:@"CourseSelectCell" owner:nil options:nil] objectAtIndex:2];
    courseView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    [self.view addSubview:courseView];
    
    UIImageView * imageView = [courseView viewWithTag:107];//课程图片
    UILabel * yx = [courseView viewWithTag:101];    //院系
    UILabel * name = [courseView viewWithTag:102];
    UILabel * score = [courseView viewWithTag:103];
    UILabel * week = [courseView viewWithTag:104];
    UILabel * time = [courseView viewWithTag:105];
    UILabel * introduce = [courseView viewWithTag:106]; //简介

    
    yx.text = _model.department;
    name.text = _model.name;
    score.text = _model.score;
    week.text = _model.week;
    time.text = _model.time;
    introduce.text = _model.introduce;
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",_model.imgName]];
    
    

    
}



@end
