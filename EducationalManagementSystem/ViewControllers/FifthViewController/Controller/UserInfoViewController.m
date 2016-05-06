//
//  FifthViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/23.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "UserInfoViewController.h"

#import "ScoreViewController.h" //成绩
#import "TestApplyViewController.h"//四六级考试报名
#import "TeachersViewController.h"//教师信息
#import "CourseSelectViewController.h"//网上选课
#import "AddressListViewController.h"//通讯录

#import "ThemeViewController.h"//主题视图控制器
#import "AccountNumViewController.h"//帐号视图控制器



#import "MyInfoViewController2.h"//退出登录的时候，push到登录页面


@interface UserInfoViewController ()

@end

@implementation UserInfoViewController{

//    UICollectionView * _collectionView;
    BaseTabbarController * _tabC;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"用户信息";
        self.tabBarItem.image = [UIImage imageNamed:@"myinfo_on@3x"];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    //记载数据
    [self loadData];
    //创建视图添加到现在的视图上
    [self creatAllViews];
    
    
    
    
}
//加载数据
-(void)loadData{

    //注意这里需要创建一个父类的model
    
    
}
//创建新的界面
-(void)creatAllViews{

    //通过xib加载一个总的视图，添加到self.view上即可
    UIView * view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
    view.frame = CGRectMake(0, 0, kScreenW, kScreenH-49);
    [self.view addSubview:view];
    
    //六个button的tag值是从101 到106，通过for循环获取六个button
    for (int i = 1011; i< 1022; i ++) {
        
        UIButton * button = (UIButton *)[view viewWithTag:i];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //通过101获取个人头像的背景视图
    _backView =(UIView *)[view viewWithTag:101];           //顶部背景视图

    _imageView = (UIImageView*)[view viewWithTag:102];     //个人头像视图
    _imageView.image = [UIImage imageNamed:@"IMG_20160407_134823.jpg"];
    
    _nameLabel = (UILabel *)[view viewWithTag:103];        //nameLabel
    _nameLabel.text = @"崔玉彬";
    _LVImageView = (UIImageView*)[view viewWithTag:104];   //等级imageView
    _LVImageView.layer.cornerRadius = 3;
    _LVImageView.clipsToBounds = YES;
    _LVImageView.image = [UIImage imageNamed:@"屏幕快照 2016-04-11 下午8.22.58.jpg"];

}

//按钮事件(通过switch进行区分)
-(void)buttonAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 1011:   [self creatCreatAction1];  //成绩查询
            break;
        case 1012:   [self creatCreatAction2];//考试报名
            break;
        case 1013:   [self creatCreatAction3];//教师信息
            break;
        case 1014:   [self creatCreatAction4];//通讯录
            break;
        case 1015:   [self creatCreatAction5];//消息提醒
            break;
        case 1016:   [self creatCreatAction6];//超级社团
            break;
        case 1017:   [self creatCreatAction7];//我的主题
            break;
        case 1018:   [self creatCreatAction8];//我的回复
            break;
        case 1019:   [self creatCreatAction9];//我的收藏
            break;
        case 1020:   [self creatCreatAction10];//我的帐号
            break;
        case 1021:   [self creatCreatAction11];//退出登录
            break;
            
        default:
            break;
    }

 
}

#pragma mark - 六个中间button

//成绩查询
-(void)creatCreatAction1{
    NSLog(@"查询成绩");
    //创建视图控制器,添加tableView 
    ScoreViewController * scoreVC = [[ScoreViewController alloc] init];
    
    [self.navigationController pushViewController:scoreVC animated:YES];
  
}
//考试报名
-(void)creatCreatAction2{
    NSLog(@"考试报名");
    
    UIStoryboard * board = [UIStoryboard storyboardWithName:@"TestApplyViewController" bundle:[NSBundle mainBundle]];
   
    TestApplyViewController * testApply = [board instantiateViewControllerWithIdentifier:@"vc"];
    [self.navigationController pushViewController:testApply animated:YES];
}
//教师信息
-(void)creatCreatAction3{
    NSLog(@"教师信息");
    TeachersViewController * teacherVC = [[TeachersViewController alloc] init];
    [self.navigationController pushViewController:teacherVC animated:YES];
    
    
}
//通讯录
-(void)creatCreatAction4{
    NSLog(@"通讯录");
    //设置tableView显示通讯录(addressList)
    AddressListViewController * addListVC = [[AddressListViewController alloc] init];
    
    [self.navigationController pushViewController:addListVC animated:YES];
    
    
}
//消息提醒
-(void)creatCreatAction5{
    NSLog(@"消息提醒");
}
//超级社团
-(void)creatCreatAction6{
    NSLog(@"网上选课");
    
    self.tabBarController.selectedIndex = 1;

    [[NSNotificationCenter defaultCenter] postNotificationName:@"change" object:nil userInfo:nil];
    


}


#pragma mark - 我的主题四个button

//我的主题
-(void)creatCreatAction7{
    NSLog(@"我的主题");
    
    //添加收集视图，然后设置主题的图片(新建视图控制器)
    ThemeViewController * themeVC = [[ThemeViewController alloc] init];
    
    [self.navigationController pushViewController:themeVC animated:YES];
    
    
    
}
//我的回复
-(void)creatCreatAction8{
    NSLog(@"我的回复");
}
//我的收藏
-(void)creatCreatAction9{
    NSLog(@"我的收藏");
}
//我的帐号
-(void)creatCreatAction10{
    NSLog(@"我的帐号");
    
    //添加账号页面(accountNumber)
    AccountNumViewController * accNumVC = [[AccountNumViewController alloc] init];
    accNumVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self.navigationController pushViewController:accNumVC animated:YES];
    
    
    
}

#pragma mark - 退出登录Button
//退出登录
-(void)creatCreatAction11{
    NSLog(@"退出登录");
    
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"MyInfoViewController" bundle:nil];
    MyInfoViewController2 * infoVc = [storyBoard instantiateInitialViewController];
    
    [self.navigationController pushViewController:infoVc animated:YES];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

@end
