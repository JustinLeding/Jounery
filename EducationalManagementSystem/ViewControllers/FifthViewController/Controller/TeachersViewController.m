//
//  TeachersViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/27.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "TeachersViewController.h"
#import "TeachersTableViewCell.h"
#import "TeachersModel.h"
@interface TeachersViewController ()

@end

@implementation TeachersViewController {
    UITableView * _tableView;
    NSMutableArray * _dataList;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.navigationItem.title = @"教师信息";
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加数据
    [self loadData];
    //添加表视图
    [self creatTableView];
}


-(void)loadData{
    
    _dataList = [[NSMutableArray alloc] init];
    
    NSDictionary * dic = [loadDataFromJson loadDataFromFileName:@"teachers"];
    
    NSArray * array = [dic objectForKey:@"teachers"];
    
    for (NSDictionary * d in array) {
        TeachersModel * model = [[TeachersModel alloc] init];
        
        model.name = [d objectForKey:@"name"];
        model.sex = [d objectForKey:@"sex"];
        model.office = [d objectForKey:@"office"];
        model.telephone = [d objectForKey:@"telephone"];
        model.qq = [d objectForKey:@"qq"];
        model.image = [d objectForKey:@"image"];
        model.motto = [d objectForKey:@"motto"];
        
        [_dataList addObject:model];
    }
}
-(void)creatTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64) style:UITableViewStylePlain];
    _tableView.backgroundColor= [UIColor orangeColor];
    _tableView.delegate = self ;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TeachersTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell ) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TeachersTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
  
    cell.model = _dataList[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
//返回的单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 220;
}


@end
