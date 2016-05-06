//
//  ThemeViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/4/11.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "ThemeViewController.h"
#import "ThemeCollectionViewCell.h"
#import "ThemeModel.h"

@interface ThemeViewController ()

@end

@implementation ThemeViewController{
    NSMutableArray * _dataList;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor redColor];
        self.title = @"我的主题";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    //添加收集视图
    //加载数据
    [self loadData];
    
    [self creatCollectionView];

//





}
//加载数据
-(void)loadData{
    _dataList = [[NSMutableArray alloc] init];
    
    NSDictionary * dic = [loadDataFromJson loadDataFromFileName:@"themePic"];
    NSArray * array = [dic objectForKey:@"pictures"];
    
    for (NSDictionary * d in array) {
        ThemeModel * model = [[ThemeModel alloc] init];
        model.picName = [d objectForKey:@"picName"];
        [_dataList addObject:model];
    }
    
 
}


-(void)creatCollectionView{
    
    //设置布局
    UICollectionViewFlowLayout * layer = [[UICollectionViewFlowLayout alloc] init];
    
    layer.itemSize = CGSizeMake(100,180);
    layer.minimumLineSpacing = 10;//垂直方向
    layer.minimumInteritemSpacing = 6;//水平
    layer.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //添加视图
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64) collectionViewLayout:layer];
    collectionView.backgroundColor = [UIColor yellowColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;   
    [self.view addSubview:collectionView];
    
    //注册单元格
    [collectionView registerNib:[UINib nibWithNibName:@"ThemeCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    

}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ThemeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _dataList[indexPath.item];

    return cell;
}


//  ---------调整单元格距离 collectionView 四周的边距 -----
#warning  这里为什么上面很大的空隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
  
}

@end
