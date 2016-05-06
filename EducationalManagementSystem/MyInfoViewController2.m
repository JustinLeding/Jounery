//
//  MyInfoViewController2.m
//  Timer
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "MyInfoViewController2.h"
#import "AlertController.h"
#import "BaseTabbarController.h"
@interface MyInfoViewController2 ()

@end

@implementation MyInfoViewController2 {
    UILabel * _label;
    BaseTabbarController * _tabbarVc;
    
}



-(void)awakeFromNib{

    self.title = @"个人";
    self.tabBarItem.image = [UIImage imageNamed:@"myinfo"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabbarVc = [[BaseTabbarController alloc] init];
    
    
    //设置控件的属性
    [self setSubviewsAttribute];
    
    
    //设置个人登陆信息，默认的
    [self creatSelfInfo];
    

}


-(void)creatSelfInfo{
    
#warning 最后注意改回账号密码
    _studentNumber = @"0";
    _passWord = @"0";


}
//设置控件的属性
-(void)setSubviewsAttribute{
    _xuehaoLabel.layer.cornerRadius = 2;
    _xuehaoLabel.clearsOnBeginEditing = YES;
    _mimaLabel.secureTextEntry = YES;
    _xuehaoLabel.keyboardType = UIKeyboardTypeNumberPad;
    
    _loadButton.layer.cornerRadius = 5;
    
    [self creatLabel];
    
    

}
-(void)creatLabel{

    _label = [[UILabel alloc] initWithFrame:CGRectMake((kScreenW-100)/2, kScreenH, 100, 30)];
    _label.backgroundColor = [UIColor grayColor];
    _label.text = @"学号为空";
    _label.tag = 101;
    _label.layer.cornerRadius = 10;
    _label.clipsToBounds = YES;
    _label.textColor = [UIColor greenColor];
    _label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_label];

}

- (IBAction)findMimaButton:(UIButton *)sender {
    //找回密码按钮响应的事件
 
}

- (IBAction)loadbutton:(id)sender {
    
    //点击登录相应的事件
   //获取输入的学号和密码
    NSString * xuehao = _xuehaoLabel.text ;
    NSString * mima = _mimaLabel.text;
  
    if ([xuehao isEqualToString:@""]) {
        //弹出label 学号为空
        
        [UIView animateWithDuration:0.5 animations:^{
            _label.frame = CGRectMake((kScreenW-100)/2, kScreenH-200, 100, 30);
            
        } completion:^(BOOL finished) {
            
            [self performSelector:@selector(afterAction) withObject:nil afterDelay:1];
 
        }];

    }else if([mima isEqualToString:@""] ){
        //弹出label 请输入密码
        _label.text = @"请输入密码";
        [UIView animateWithDuration:0.3 animations:^{
            _label.frame = CGRectMake((kScreenW-100)/2, kScreenH-200, 100, 30);
        } completion:^(BOOL finished) {
            [self performSelector:@selector(afterAction) withObject:nil afterDelay:1];
        }];
        
    }else{
    
        if ([xuehao isEqual:_studentNumber] && [mima isEqual:_passWord]) {
            NSLog(@"登陆成功");
            //进入页面
#pragma mark - 转换window的根视图控制器
                //重新设置window的根视图控制器
                [self creatTabbarViewControllers];
//         
        }else {
            NSLog(@"登陆失败");
            //弹出提醒框
            AlertController * alertController = [AlertController alertControllerWithTitle:@"提示" message:@"密码输入错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertController animated:YES completion:nil];
        }

    }
   
}

//是否记住密码
- (IBAction)markButton:(UIButton *)sender {
    
    //是否记住密码
    sender.selected = !sender.selected;
    NSLog(@"sender = %d",sender.selected);
   
}

-(void)afterAction{

    [UIView animateWithDuration:0.3 animations:^{

        _label.frame = CGRectMake((kScreenW-100)/2, kScreenH, 100, 30);

    }];

}


-(void)creatTabbarViewControllers{
        NSArray * array = @[@"DynamicViewController",@"CourseSelectViewController",@"CourseViewController",@"UserInfoViewController"];
        NSMutableArray * navs = [[NSMutableArray alloc] init];
    
        for (NSString * str in array) {
    
            //三级控制器
            UIViewController * vc = [[NSClassFromString(str) alloc] init];
            //二级控制器
            BaseNavigationController * nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
            [navs addObject:nav];
    
        }
    
        //以及控制器
        BaseTabbarController * tabbarViewController = [[BaseTabbarController alloc] init];
        tabbarViewController.viewControllers = navs;
    
    
        //设置抽屉侧滑视图
        LeftViewController * leftViewController = [[LeftViewController alloc] init];
        MMDrawerController * mmDrawerController = [[MMDrawerController alloc] initWithCenterViewController:tabbarViewController leftDrawerViewController:leftViewController];
        [mmDrawerController setShowsShadow:YES];
        [mmDrawerController setMaximumLeftDrawerWidth:280];
        [mmDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
        [mmDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];

        [UIApplication sharedApplication].delegate.window.rootViewController = mmDrawerController;

}


-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
@end
