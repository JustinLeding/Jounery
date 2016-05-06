//
//  FourthViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "CourseViewController.h"
#import "CourseModel.h"
#import "BackModel.h"
#import "CourseBackView.h"
#import "CourseTableViewCell.h"
@interface CourseViewController ()


@end

@implementation CourseViewController{
    NSMutableArray * _dataList;
    NSMutableArray * _datalist2;
    
    UIScrollView * _scrollView;
    
    CGFloat _width;
    CGFloat _height;
    
    CourseBackView * _backV;//单例
   
    NSInteger courseName[7];
 
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"课程表";
        self.tabBarItem.image = [UIImage imageNamed:@"payticket_on@2x"];
        self.view.backgroundColor = [UIColor grayColor];

    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    [self loadData];
    
    //添加底部滑动视图
    [self creatScrollView];
    
    //添加顶部视图
    [self creatTopView];
    
    //添加左侧视图
    [self creatLeftView];
    
    //添加课程视图
    [self creatCourseView];
    
}

-(void)loadData{
    _dataList = [[NSMutableArray alloc] init];
    NSDictionary * dic = [loadDataFromJson loadDataFromFileName:@"courseTable"];

    NSArray * courseTable = [dic objectForKey:@"studentOne"];
    
    for (NSDictionary * d in courseTable) {
        CourseModel * model = [[CourseModel alloc] init];
        model.weekend = [d objectForKey:@"weekend"];
        model.weekendNumber = [d objectForKey:@"weekendNumber"];
        model.courses = [d objectForKey:@"courses"];
        for (NSDictionary * dd in model.courses) {
            
            
            model.numModel.name = [dd objectForKey:@"name"];
            model.numModel.teacher = [dd objectForKey:@"teacher"];
            model.numModel.startSection = [dd objectForKey:@"startSection"];
            model.numModel.endSection = [dd objectForKey:@"endSection"];
        }
      
        [_dataList addObject:model];
        
    }
   
    //----------  加载课程详情数据  －－－－－－－－－－－－
    _datalist2 = [[NSMutableArray alloc] init];
    
    NSDictionary * dic1 = [loadDataFromJson loadDataFromFileName:@"teachers"];
    
    NSArray * array = [dic1 objectForKey:@"teachers"];
    
    for (NSDictionary * d  in array) {
        BackModel * model = [[BackModel alloc] init];
        
        model.name = [d objectForKey:@"name"];
        model.qq = [d objectForKey:@"qq"];
        model.telephone = [d objectForKey:@"telephone"];
        
        [_datalist2 addObject:model];
    }
  
}

//底部滑动视图
-(void)creatScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-49)];
    _scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.contentSize = CGSizeMake(kScreenW+120, kScreenH-64);
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.pagingEnabled = NO;
    _scrollView.bounces = NO;
   
    [self.view addSubview:_scrollView];
    //确定课程表单元的宽高
    _width = (kScreenW+100)/7;
    _height = (kScreenH-64-49)/12;
    
    
}
//顶部视图(周几)
-(void)creatTopView{
    
    UIView * topView = [[[NSBundle mainBundle] loadNibNamed:@"CourseTableViewCell" owner:self options:nil] objectAtIndex:0];
    topView.frame = CGRectMake(20, 0, kScreenW+100, 30);
    [_scrollView addSubview:topView];
 
}
//左侧视图
-(void)creatLeftView{
    UIView * leftView = [[[NSBundle mainBundle] loadNibNamed:@"CourseTableViewCell" owner:self options:nil] objectAtIndex:1];
    leftView.frame = CGRectMake(0, 30, 20, kScreenH-64-49);
    [_scrollView addSubview:leftView];
    
}
//添加课程视图
-(void)creatCourseView{

    //根据数据添加视图，并且直接赋值
    
    for (int i = 0; i < 7; i++) {
    //添加一周第 i 天的课程
    CourseModel * model = _dataList[i];
    //获取课程表的数组
    NSArray * sourS = model.courses;

    NSInteger weekNumber = [model.weekendNumber integerValue];
    
    switch (weekNumber) {
        case 1: [self creatWeekendOne:sourS];
        break;
        case 2: [self creatWeekendTwo:sourS];
        break;
        case 3: [self creatWeekendThree:sourS];
        break;
        case 4: [self creatWeekendFour:sourS];
        break;
        case 5: [self creatWeekendFive:sourS];
        break;
        case 6: [self creatWeekendSix:sourS];
        break;
        case 7: [self creatWeekendSeven:sourS];
        break;
        
        default:
        break;
    };
    
    }
 
}

-(void)creatWeekendOne:(NSArray *)sourS{

    //首先确定one的情况的x 以及width
    CGFloat x = 20;
    courseName[0] = sourS.count;
    [self addSourseView:sourS andX:x];

}
-(void)creatWeekendTwo:(NSArray *)sourS{
    //首先确定one的情况的x 以及width
    CGFloat x = 20+_width*1;
    courseName[1] = sourS.count;
    [self addSourseView:sourS andX:x];

}
-(void)creatWeekendThree:(NSArray *)sourS{
    //首先确定one的情况的x 以及width
    CGFloat x = 20+_width*2;
    courseName[2] = sourS.count;
    [self addSourseView:sourS andX:x];

}
-(void)creatWeekendFour:(NSArray *)sourS{
    //首先确定one的情况的x 以及width
    CGFloat x = 20+_width*3;
    courseName[3] = sourS.count;
    [self addSourseView:sourS andX:x];

}
-(void)creatWeekendFive:(NSArray *)sourS{
    //首先确定one的情况的x 以及width
    CGFloat x = 20+_width*4;
   courseName[4] = sourS.count;
    [self addSourseView:sourS andX:x];

}
-(void)creatWeekendSix:(NSArray *)sourS{
    //首先确定one的情况的x 以及width
    CGFloat x = 20+_width*5;
    courseName[5] = sourS.count;
    [self addSourseView:sourS andX:x];

}
-(void)creatWeekendSeven:(NSArray *)sourS{
    //首先确定one的情况的x 以及width
    CGFloat x = 20+_width*6;
    courseName[6] = sourS.count;
    [self addSourseView:sourS andX:x];

}

//加载课程单元的私有方法，
-(void)addSourseView:(NSArray *)sourS andX:(CGFloat)x{

    for (int i = 0; i < sourS.count; i ++) {
        
        //先获取到第i节课的数据
        NSDictionary * d = [sourS objectAtIndex:i];
        
        NSInteger start = [[d objectForKey:@"startSection"] integerValue];
        NSInteger end = [[d objectForKey:@"endSection"] integerValue];
        
        NSString * content = [d objectForKey:@"name"];
        NSString * classRoom = [d objectForKey:@"classRoom"];
        
        CGFloat y = 30 +_height*(start-1);
        CGFloat height = _height*(end-start+1);
        
        UIView * view = [[[NSBundle mainBundle] loadNibNamed:@"CourseTableViewCell" owner:self options:nil] objectAtIndex:2];
        
        //计算第几天
        NSInteger day = (x-20)/_width;
        //这一天前面所有课程的总和
        NSInteger all = 0;
        for (int k = 0; k < day; k ++) {
            all = all + courseName[k] ;
        }
        view.tag = all + i;
        
        UILabel * label = (UILabel *)[view viewWithTag:101];
        UILabel * classRoomLabel = (UILabel *)[view viewWithTag:102];
        UIView * tapView = [view viewWithTag:103];
        
        tapView.userInteractionEnabled = YES;
        //给label添加手势，
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tapView addGestureRecognizer:tap];
        
        //给课程名字赋值
        label.text = content;
        classRoomLabel.text = [NSString stringWithFormat:@"@%@",classRoom];
        
        view.backgroundColor = [UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:0.7];
        view.layer.cornerRadius = 10;
        view.clipsToBounds = YES;
        view.layer.borderWidth = 3;
        view.layer.borderColor = [[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1] CGColor];
        view.frame = CGRectMake(x, y, _width, height);
        [_scrollView addSubview:view];
        
    }
   
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    _backV.hidden = YES;
    UIView * tView = tap.view;//获取到表面的透明视图
    //找到其父视图(然后继续找下一个父视图)，也就是单元格。
    UIView * superView = [tView.superview superview];
    
//NSLog(@"tag is :%ld",superView.tag);//显示每一个课程单元的tag
    
    CGRect oldFrame = superView.frame;
    [UIView animateWithDuration:0.3 animations:^{
        
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:superView cache:YES];
        if (_backV.hidden == NO ) {
            _backV.hidden = YES;
        }
   
    } completion:^(BOOL finished) {
        
        //添加视图
        _backV = [[CourseBackView alloc] init];
        _backV = [CourseBackView sharedBackView];

        //添加手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackAction:)];
        _backV.userInteractionEnabled = YES;
        [_backV addGestureRecognizer:tap];
        
        _backV.frame = oldFrame;
        _backV.model = _datalist2[superView.tag];
        _backV.frame = CGRectMake(0, 0, oldFrame.size.width, oldFrame.size.height);
        [superView addSubview:_backV];
        
        _backV.hidden = NO;
    }];
  
}

-(void)tapBackAction:(UIGestureRecognizer*)tap{

    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_backV.superview cache:YES];
    } completion:^(BOOL finished) {
            _backV.hidden = YES;
    }];
  
}


@end
