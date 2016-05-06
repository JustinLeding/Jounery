//
//  FirstViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "DynamicViewController.h"
#import "MyInfoViewController2.h"
#import "FirstTableViewCell.h"
#import "NewsViewController.h"
#import "UIView+FindViewController.h"
@interface DynamicViewController ()

@end

@implementation DynamicViewController {

    NSMutableArray * _dataList;
    UITableView * _tableView;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"教务动态";
        self.tabBarItem.image = [UIImage imageNamed:@"home_on@2x"];
        
        
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2013-09-15-18.17.46"]];

    [self creatTitleView];
    //加载数据
    [self loadData];
    //创建表视图
    [self creatTableView];
    
    
}
//设置导航栏的属性
-(void)creatTitleView{
    self.navigationItem.title = @"教务";
    
    //设置左侧按钮
    [self creatLeftNavigationBarButton];

}
//添加左侧按钮
-(void)creatLeftNavigationBarButton{

    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 101;
    button.frame = CGRectMake(0, 0,40 ,40 );
    button.layer.cornerRadius = 20;
    button.clipsToBounds = YES;
    [button setBackgroundImage:[UIImage imageNamed:@"timg.png"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(leftBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

}

#pragma mark - ButtonAction

//通过相应者链条进行搜索控制器
-(MMDrawerController*)findMMdrawerController{

    UIResponder * next = self.nextResponder;
    do {
        
        if ([next isKindOfClass:[MMDrawerController class]]) {
            
            
            return (MMDrawerController *)next;
        }else{
        
            next = next.nextResponder;
        }
     
    } while (next != nil);

    return nil;


}




//左侧按钮点击响应事件
-(void)leftBarButtonAction:(UIButton *)leftButton{
    NSLog(@"点击了左上角的button，推出左侧视图");
    
    MMDrawerController * mmdVC  = [self findMMdrawerController];    //这里需要寻找相应着链条
    [mmdVC toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        
        NSLog(@"视图切换之后完成的方法");
    
    }];
  
}

#pragma mark - LoadData
//加载数据
-(void)loadData{

    NSDictionary * dic =  [loadDataFromJson loadDataFromFileName:@"XinyiNews"];
    NSArray * array = [dic objectForKey:@"news"];
    _dataList = [[NSMutableArray alloc] init];
    
    
    for ( NSDictionary * d in array) {
        
        
        NewsModel * model = [[NewsModel alloc] init];
        model.title = [d objectForKey:@"title"];
        model.time = [d objectForKey:@"time"];
        model.academy = [d objectForKey:@"academy"];
        model.editor = [d objectForKey:@"editor"];
        model.count = [d objectForKey:@"count"];
        model.content = [d objectForKey:@"content"];    //内容
        model.image = [d objectForKey:@"image"];
        [_dataList addObject:model];
        
    }
    
    NSLog(@"%@",_dataList);
    
    
    

}

//创建表视图
-(void)creatTableView{

    //添加表视图用于显示新乡医学院的新闻
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //设置分割线的颜色
    _tableView.separatorColor = [UIColor yellowColor];//分割线颜色
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;//分割线风格
    
}

#pragma mark - UITableViewDataSource

//返回多少个单元格每一组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataList.count;
}
//返回单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstTableViewCell" owner:self  options:nil] firstObject];
        
    }
    
    cell.model = _dataList[indexPath.row];
    return cell;

}


#pragma mark - UITableViewDelegate
//单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//高亮状态
-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
}
//取消高亮状态
-(void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];

}

//单元格点击事件，需要push出新的新闻页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
  
//
//    //需要push出新的页面
    NewsViewController * newsVC = [[NewsViewController alloc] init];
    
    newsVC.dataModels = _dataList;
    newsVC.indexPath_row = indexPath.row;
    

    //通过现在的导航控制器push出新的页面,通过类目找到相应着链条
    [[cell findViewController].navigationController pushViewController:newsVC animated:YES];
    
 
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}




@end
