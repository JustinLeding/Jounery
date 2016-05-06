//
//  NewsViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/22.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableviewCell.h"

#define kTextFieldViewH 90
#define kKeyBoardH 320
#define kTextFieldCloseTime 0.4
#define kTextFieldOpenTime 0.27

@interface NewsViewController ()

@end

@implementation NewsViewController {
    UITableView * _tableView;   //表视图
 
    NSString * _contentText;
    NSString * _titleText;
    NSString * _academyText;
    NSString * _timeText;
    NSString * _countText;
    NSString * _imageName;
    UIImage * _image;      //model里面的数据
    
    CGSize _contentSize;   //内容文本的尺寸
    
    
    UIView * _bgview;   //全屏按钮所在视图
    UIView * _view;     //键盘所在的视图
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

}


#pragma mark - 视图即将出现的方法
//视图出现的时候隐藏标签栏，并且创建新的评论视图
-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    //传递数据
    [self loadData];
    
    //添加表视图，
    [self creatTableViewCell];
    
    //添加评论视图
    [self creatCommentView];
    
    
    
}

////传递数据
-(void)loadData{
    
    _contentText = [_dataModels[_indexPath_row] valueForKey:@"content"];
    _titleText = [_dataModels[_indexPath_row] valueForKey:@"title"];
    _timeText  = [_dataModels[_indexPath_row] valueForKey:@"time"];
    _academyText = [_dataModels[_indexPath_row] valueForKey:@"academy"];
    _countText = [_dataModels[_indexPath_row] valueForKey:@"count"];
    _imageName = [[_dataModels[_indexPath_row] valueForKey:@"image"] objectAtIndex:0];
#warning 这里添加一下网缓存中添加数据的方法
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         _image = [self setImageFromString:_imageName];
        
        if (_image) {
            
            [_tableView reloadData];
        }
    });
    
    
    //设置文本的高度
    _contentSize = [_contentText boundingRectWithSize:CGSizeMake(kScreenW-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]} context:nil].size;
    
    NSLog(@"%.2f",_contentSize.height);
    
    
}
//添加一个表视图，只要一个头视图以及一个单元格
-(void)creatTableViewCell{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
}
//创建textFieldView
-(void)creatCommentViews{
    
    //设置textField视图
    _view = [[[NSBundle mainBundle] loadNibNamed:@"NewsTableviewCell" owner:self options:nil] objectAtIndex:3];
    _view.frame = CGRectMake(0, kScreenH, kScreenW, kTextFieldViewH);

    [UIView animateWithDuration:kTextFieldOpenTime animations:^{
        _view.frame = CGRectMake(0, kScreenH-kKeyBoardH-kTextFieldViewH, kScreenW, kTextFieldViewH);
    }];
    
    _view.backgroundColor = [UIColor colorWithRed:0.83 green:0.95 blue:0.75 alpha:1];
    [_bgview addSubview:_view];
    
    
    UITextField * textField = (UITextField*)[_view viewWithTag:101];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField  becomeFirstResponder];//成为第一次响应着
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.layer.borderColor = [[UIColor greenColor] CGColor];
    textField.placeholder = @"评论";
    textField.delegate = self;
    
}



//私有方法，设置image
-(UIImage *)setImageFromString:(NSString*)urlString{
    
    NSURL * url = [NSURL URLWithString:urlString];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    
#warning 这里添加类目，创建私有方法添加数据到缓存中
    
    return image;

}

//添加评论视图
-(void)creatCommentView{
    //创建评论视图
    UIView * commentView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH-49-64, kScreenW, 49)];
    commentView.backgroundColor = [UIColor colorWithRed:0.83 green:0.93 blue:0.75 alpha:1];
    [self.view addSubview:commentView];

    //中间button
    UIButton * centerButton = [self creatCenterButton];
    [commentView addSubview:centerButton];
    
    
    //添加右边的点赞数目
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kScreenW - 65, 5, 60, 40);
    [button setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(commonButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [commentView addSubview: button];
    
  
}
//创建中间 button(私有方法)
-(UIButton *)creatCenterButton{
    UIButton * centerButton = [UIButton buttonWithType: UIButtonTypeCustom ];
    centerButton.frame = CGRectMake(10, 5, kScreenW-80, 49-15);
    centerButton.layer.cornerRadius = 5;
    centerButton.layer.masksToBounds = YES;
    [centerButton setTitle:@"｜评论" forState:UIControlStateNormal];
    [centerButton setTintColor:[UIColor lightGrayColor]];
    centerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    centerButton.backgroundColor = [UIColor grayColor];
    [centerButton addTarget: self action:@selector(centerButtonAction) forControlEvents:UIControlEventTouchUpInside];
  
    return centerButton;
}


#pragma mark - Button响应事件

//评论数的点击相应的事件
-(void)commonButtonAction{
    
//    NSLog(@"点击了评论数");
    //    NSLog(@"数据是：%@",self.);
}
//点击背景视图消失让textField消失的方法响应的事件
-(void)disappearAction:(UIButton *)btn{
    
    //让textField视图消失
    [UIView animateWithDuration:kTextFieldCloseTime animations:^{
        //让textfield下滑
        [UIView animateWithDuration:kTextFieldCloseTime animations:^{
            _view.frame = CGRectMake(0, kScreenH, kScreenW, kTextFieldViewH);
        }];
        
    }];
    
    //点击让视图,延时调用，消除视图
    [self performSelector:@selector(removeBGview) withObject:nil afterDelay:0.35];
    
}

//删除textField的背景视图
-(void)removeBGview{
    
    [_bgview removeFromSuperview];
    
}

//中间按钮点击事件
-(void)centerButtonAction{
    
    //跳出新的界面进行评论，并且让键盘高度升高，背景设置可点击返回的视图
    _bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-49)];
    [self.view addSubview: _bgview];
    
   
    
    //全屏button
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kScreenW, kScreenH-49);
    button.backgroundColor = [UIColor lightGrayColor];
    button.alpha = 0.7;
    [button addTarget:self action:@selector(disappearAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bgview addSubview:button];
 
    //添加新视图的控件
    [self creatCommentViews];
    
  
}


#pragma mark - TextFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    [UIView animateWithDuration:kTextFieldOpenTime animations:^{
        
        _view.frame = CGRectMake(0, kScreenH-kTextFieldViewH-kKeyBoardH, kScreenW, kTextFieldViewH);
    }];
    
    return YES;
}


//收回键盘的方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //下面代码可以收回键盘
    
    [UIView animateWithDuration:kTextFieldCloseTime animations:^{
        
        _view.frame = CGRectMake(0, kScreenH, kScreenW, kTextFieldViewH);
    }];
    
    [textField resignFirstResponder];
    [_bgview removeFromSuperview];
    return YES;
    
}





#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableviewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        if ([_imageName isEqual:@""]) {
            //如果没有图片，则加载没有图片的
            cell =[[[NSBundle mainBundle] loadNibNamed:@"NewsTableviewCell" owner:self options:nil] objectAtIndex:2];
         
        }else{
            //如果有图片，加载图片
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsTableviewCell" owner:self options:nil] objectAtIndex:1];
            
            UIImageView * imageView = (UIImageView *)[cell.contentView viewWithTag:102];
            
            if (_image) {
                imageView.image = _image;
//                NSLog(@"图片加载成功");
            }else{
                NSLog(@"图片加载失败");
            }

        }
    }
    
    UILabel * contentLabel = (UILabel*)[cell.contentView viewWithTag:101];
 
    contentLabel.text = _contentText;

    return cell;
    
    
}
#pragma mark - UITabelViewDelegate
//返回单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if ([_imageName isEqualToString:@""]) {
        NSLog(@"这个单元格没有图片");
        return _contentSize.height;
    }
    NSLog(@"这个单元格有图片");
    return _contentSize.height+200;

}
//返回头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
    
   CGRect rect = [_titleText boundingRectWithSize:CGSizeMake(kScreenW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:nil context:nil];
    
        return rect.size.height+70;

}
//返回头视图
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{


    UIView * headerView = (UIView *)[[[NSBundle mainBundle] loadNibNamed:@"NewsTableviewCell" owner:self options:nil] objectAtIndex:0];
    
    
    UILabel * titleLabel = [headerView viewWithTag:102];
    UILabel * academyLabel = [headerView viewWithTag:103];
    UILabel * timeLabel = [headerView viewWithTag:104];
    UILabel * countLabel = [headerView viewWithTag:105];
    
    titleLabel.text = _titleText;
    titleLabel.numberOfLines = 0;

    academyLabel.text = _academyText;
    timeLabel.text = _timeText;
    countLabel.text = [NSString stringWithFormat:@"评论:%@",_countText];
    
    return headerView;
    
}





@end
