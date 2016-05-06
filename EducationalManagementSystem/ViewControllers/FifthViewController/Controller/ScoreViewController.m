//
//  ScoreViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/26.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "ScoreViewController.h"

#define kTestCount 4    //查询的考试科目的个数

@interface ScoreViewController ()<UIWebViewDelegate>

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.14 green:0.66 blue:0.98 alpha:1];
    //加载数据
    [self loadData];
    //添加视图
    [self creatLabelBackView];

 

}


-(void)loadData{


}


-(void)creatLabelBackView{
    
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(10, 20, kScreenW-20, kTestCount*44)];
    backView.layer.cornerRadius = 8;
    backView.layer.borderWidth = 0.6;
    backView.layer.borderColor = [[UIColor greenColor] CGColor];
    backView.layer.masksToBounds = YES;
    [self.view addSubview:backView];
    
    //添加三个label
    for (int i = 0; i < kTestCount; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, i*44, kScreenW-20, 44)];
        label.layer.borderWidth = 0.5;
        label.layer.borderColor = [[UIColor grayColor] CGColor];
        label.tag = 100+i;
        label.userInteractionEnabled = YES;
        label.backgroundColor = [UIColor whiteColor];
        [backView addSubview:label];
    
        //添加text
        if (i == 0) {
            label.text = @"   英语四六级";
        }else if (i == 1){
            label.text = @"   普通话水平测试";
        }else if (i ==2){
            label.text = @"   全国计算机等级考试";
        }else if (i ==3){
            label.text = @"   课程考试成绩查询";
            label.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0 alpha:1];
            
        }
        
        //添加手势
        UITapGestureRecognizer * labelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelAction:)];
        
        labelTap.numberOfTouchesRequired = 1;
        labelTap.numberOfTapsRequired = 1;
        
        [label addGestureRecognizer:labelTap];
        
    }
#warning 怎么画一条直线
    
    /*
     画直线的步骤
     获取上下文
     创建路径并设置路径
     将属性添加到上下文
     设置上下文属性
     绘制路径
    释放路径
    */

}


-(void)labelAction:(UIGestureRecognizer *)labelTap{
    
    NSLog(@"label.tap = %ld",labelTap.view.tag);
    
    switch (labelTap.view.tag) {
        case 100:[self creatLabelEnglishTest];
      
            break;
        case 101:[self creatlabelChineseTest];

            break;
        case 102:[self creatComputerTest];

            break;
        case 103:[self creatDailyTest];
            
            break;
        default:
            break;
    }
    

}
//英语四六级
-(void)creatLabelEnglishTest{

    NSString * urlstring = @"http://www.exam8.com/english/Special/cet46chafen/?agent=bdopen";
    [self creatWebView:urlstring];
    
    
}
//普通话等级考试
-(void)creatlabelChineseTest{

    
    NSString * urlstring = @"http://www.exam8.com/english/Special/cet46chafen/?agent=bdopen";
    [self creatWebView:urlstring];
    
}

//全国计算机等级考试
-(void)creatComputerTest{

    NSString * urlString = @"http://ncre.bjeea.cn/web/login.jsp";
    [self creatWebView:urlString];

}
//日常考试成绩查询
-(void)creatDailyTest{

    
    [self creatWebView:nil];


}

-(void)creatWebView:(NSString *)urlString{

    UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    webView.delegate = self;
    
    [self.view addSubview:webView];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}




@end
