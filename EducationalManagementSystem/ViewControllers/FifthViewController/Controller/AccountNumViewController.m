//
//  AccountNumViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/4/12.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "AccountNumViewController.h"

@interface AccountNumViewController ()

@end

@implementation AccountNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.view.backgroundColor = [UIColor redColor];
    self.title = @"我的帐号";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myAccountNumber:(id)sender {
    //弹出alertView
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"选择" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertC animated:YES completion:nil];
    
    [alertC addAction:[UIAlertAction actionWithTitle:@"更换号码" style:UIAlertActionStyleDefault handler:nil]];
    
    
    
}

@end
