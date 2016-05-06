//
//  LeftViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/21.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "LeftViewController.h"
#import "AboutViewController.h"
@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];



}
- (IBAction)aboutAction:(UIButton *)sender {
    
    AboutViewController * abVC = [[AboutViewController alloc] init];
//    abVC.modalPresentationStyle = UIModalPresentationPageSheet;
    
//    [self.navigationController pushViewController:abVC animated:YES];
    [self presentViewController:abVC animated:YES completion:nil];
    
}


@end
