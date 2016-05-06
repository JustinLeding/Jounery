//
//  SecondViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "CourseSelectViewController.h"
#import "CourseSelectResultVC.h"
#import "CourseSelectCell.h"
#import "CourseSelectModel.h"
#import "CourseDetailsViewController.h"//点击单元格，显示课程详情


@interface CourseSelectViewController ()

@end

@implementation CourseSelectViewController{
    
    UITableView * _tableView;
    NSMutableArray * _dataList;
//    NSMutableArray * _didSelectData;//点击单元格的数据
    
    NSMutableArray * _selectModels; //已经选中的单元格的的数据总和
    
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"网上选课";
        self.tabBarItem.image = [UIImage imageNamed:@"discover_on@2x"];
        self.view.backgroundColor = [UIColor yellowColor];
        
        _selectModels = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"select" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        //选中了第几个数据
        NSInteger index = [[note.userInfo objectForKey:@"index"] integerValue];
        //添加选中的model
        [_selectModels addObject:_dataList[index]];
    }];

    //加载数据
    [self loadData];
    
    //加载视图
    [self creatTableView];
    
    
}



-(void)loadData{
    _dataList = [[NSMutableArray alloc] init];
//    _didSelectData = [[NSMutableArray alloc] init];
    _selectModels = [[NSMutableArray alloc] init];
    NSDictionary * dic = [loadDataFromJson loadDataFromFileName:@"courses"];
    NSArray * array = [dic objectForKey:@"course"];
    
    for (NSDictionary * d in array) {
        CourseSelectModel * model = [[CourseSelectModel alloc] init];
        
        model.name = [d objectForKey:@"name"];
        model.score = [d objectForKey:@"score"];
        model.time = [d objectForKey:@"time"];
        model.week = [d objectForKey:@"week"];
        model.teacher = [d objectForKey:@"teacher"];
        model.classroom = [d objectForKey:@"classroom"];
        model.department = [d objectForKey:@"department"];
        model.imgName = [d objectForKey:@"imgName"];
        model.introduce = [d objectForKey:@"introduce"];
        
        [_dataList addObject:model];
    }
    
    
}


-(void)creatTableView{
    
    //先创建一个滑动视图
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64-49)];
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.contentSize = CGSizeMake(kScreenW*2+50, kScreenH-64-49-100);
    scrollView.pagingEnabled = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
    [self.view addSubview: scrollView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW*2+50, kScreenH-64-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [scrollView addSubview:_tableView];
    
    //去除单元格之间的线条
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
//    //添加头视图
    UIView * headerView = [self creatTableViewHeaderView];
    headerView.frame = CGRectMake(0, 0, kScreenW*2, 35);
    _tableView.tableHeaderView = headerView;
   
    
    //添加导航栏右侧的buttonItem，提交选课
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 50, 30);
    rightButton.backgroundColor = [UIColor orangeColor];
    rightButton.layer.cornerRadius = 5;
    rightButton.clipsToBounds = YES;
    [rightButton setTitle:@"提交" forState:UIControlStateNormal];
    
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightItemButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    
     
}

-(UIView *)creatTableViewHeaderView{
   
    UIView * view = [[[NSBundle mainBundle] loadNibNamed:@"CourseSelectCell" owner:self options:nil] objectAtIndex:1];
    
    return view;
}


//右上提交按钮相应的方法，用于显示已选课程
-(void)rightItemButtonAction{
    //提交选课数据，
    CourseSelectResultVC * resultVC = [[CourseSelectResultVC alloc] init];
    
    //传递已经选择的课程
    resultVC.didSelectdata = _selectModels;
    [self.navigationController pushViewController:resultVC animated:YES];
    
    
    
    
    
    
}
#pragma mark - --UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CourseSelectCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CourseSelectCell" owner:self options:nil] objectAtIndex:0];
    }
    
    cell.index = indexPath.row;
    cell.model = _dataList[indexPath.row];
    
    return cell;
    
}
//返回单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 35;
}

#pragma UITableViewDelegate
//单元格点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //根据单元格push出新的界面介绍课程详情
    CourseDetailsViewController * detailVC = [[CourseDetailsViewController alloc] init];
    //赋值，传递数据
    detailVC.model = _dataList[indexPath.row];

    [self.navigationController pushViewController:detailVC animated:YES];
 
}


@end
