//
//  CourseSelectResultVC.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/30.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "CourseSelectResultVC.h"
#import "CourseSelectModel.h"

@interface CourseSelectResultVC ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation CourseSelectResultVC{

    UITableView * _tableView;
    NSString * _newPath;
    NSMutableArray * _newArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"正选结果";
}
-(void)setDidSelectdata:(NSMutableArray *)didSelectdata{
    _didSelectdata = didSelectdata;

    if (!_newArr) {
        _newArr = [[NSMutableArray alloc] initWithArray:_didSelectdata];
        _newPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/coreData.db"];
        
        [_newArr writeToFile:_newPath atomically:YES];
    }
    //创建视图展示自己的选课结果
    [self creatTableView];
  
}

-(void)creatTableView{

    //添加tableView展示结果
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self.view addSubview:_tableView];

}


#pragma mark --- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _didSelectdata.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CourseSelectCell" owner:nil options:nil] objectAtIndex:3];
    }

    CourseSelectModel * model = _didSelectdata[indexPath.row];
    //获取控件
    UIImageView * imageView = [cell.contentView viewWithTag:100];
    UILabel * yx = [cell.contentView viewWithTag:101];
    UILabel * name = [cell.contentView viewWithTag:102];
    UILabel * score = [cell.contentView viewWithTag:103];
    UILabel * week = [cell.contentView viewWithTag:104];
    UILabel * time = [cell.contentView viewWithTag:105];
    UIButton * button = [cell.contentView viewWithTag:106];
    [button addTarget:self action:@selector(btnAction:)  forControlEvents:UIControlEventTouchUpInside];
    button.tag = indexPath.row + 100;
   
    //赋值
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",model.imgName]];
    yx.text = model.department;
    name.text = model.name;
    score.text = model.score;
    week.text = model.week;
    time.text = model.time;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;

}



-(void)btnAction:(UIButton * )btn{
    
    NSInteger index = btn.tag -100;
    
    //弹出提醒
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提醒" message:@"确定取消已选课程吗" preferredStyle:UIAlertControllerStyleAlert];
                                  
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //确定做的事情
        [_didSelectdata removeObjectAtIndex:index];
        [_tableView reloadData];
        
    }]];
                                  
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
 
}

//通过button 找到cell
-(UITableViewCell *)getCell:(UIButton *)btn{
    UIResponder * next = btn.nextResponder;
    
    while (next) {
        if ([next isKindOfClass:[UITableViewCell class]]) {
            
            return (UITableViewCell *)next;

        }
        next = next.nextResponder;
    }
    
    return nil;
}

@end
