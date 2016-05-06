//
//  AddressListViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/4/11.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "AddressListViewController.h"
#import "TeachersModel.h"

@interface AddressListViewController ()

@end

@implementation AddressListViewController{
    UITableView * _tableView;
    NSMutableArray * _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系人";
    //这也界面添加的是通讯录，
    [self loadData];
    
    [self creatTableView];
    
    
    [self creatRightbutton];
    
}

-(void)loadData{
    _datalist = [[NSMutableArray alloc] init];
    NSDictionary * dicdata = [loadDataFromJson loadDataFromFileName:@"teachers"];
    NSArray * arr = [dicdata objectForKey:@"teachers"];
    
    for ( NSDictionary * dic  in arr) {
        TeachersModel * model = [[TeachersModel alloc] init];
        
        model.name = [dic objectForKey:@"name"];
        model.telephone = [dic objectForKey:@"telephone"];
        model.image = [dic objectForKey:@"image"];
        
        [_datalist addObject:model];
        
     
    }
  
}


-(void)creatTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

-(void)creatRightbutton{

    UIButton * rightBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    
    rightBtn.frame = CGRectMake(0, 0, 50, 30);
    
    [rightBtn setTitle:@"添加" forState:UIControlStateNormal];
    
    [rightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    
    

}

-(void)btnAction:(UIButton *)btn{
    
    NSLog(@"添加好友");
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _datalist.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TeachersTableViewCell" owner:nil options:nil] objectAtIndex:1];
    }
    
    UIImageView * imagev = [cell.contentView viewWithTag:101];
    UILabel * name = [cell.contentView viewWithTag:102];
    UILabel * tele = [cell.contentView viewWithTag:103];
    TeachersModel * model = _datalist[indexPath.row];
    imagev.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.image]];
    name.text = model.name;
    tele.text = model.telephone;
    
    return cell;
}

//
//-(void)viewWillAppear:(BOOL)animated{
//
//    self.tabBarController.tabBar.hidden = YES;
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    self.tabBarController.tabBar.hidden = NO;
//
//    
//}


@end
