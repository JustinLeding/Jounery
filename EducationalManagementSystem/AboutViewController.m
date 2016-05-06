//
//  AboutViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/4/25.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self creatLeftButton];

    [self creatLabel];



}

-(void)creatLabel{
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, kScreenW-20,300)];
    label.numberOfLines = 0;
    label.text = @"鸣谢：                                                                       该软件为本人的毕业设计，首先非常感谢李振新老师在思路上以及论文方面给予我的极大支持和鼓励，也非常感谢刘晓彬老师在我课题的实现的过程中给我技术上的支持和解决问题。最后感谢同学的支持和陪伴。最后感谢各种互联网站提供的素材。";
    [self.view addSubview:label];

    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 400, kScreenW-20,300)];
    label2.numberOfLines = 0;
    label2.text = @"免责声明：\n该软件从设计到实现再到最后的课题答辩演示，均为本人所为，里面用到的所有素材均为毕业演示答辩所用，绝无任何商业用途。最后，和该软件有关的所有的最终解释权利归本人所有，任何机构和组织不得以任何商业目的进行传播和使用。";
    [self.view addSubview:label2];
    
    
    
}

-(void)creatLeftButton{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20,20, 50, 30);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor cyanColor];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    button.clipsToBounds = YES;
    [button addTarget:self action:@selector(btnBackAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

}

-(void)btnBackAction:(UIButton *)btn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
