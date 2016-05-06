//
//  MyInfoViewController2.h
//  Timer
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoViewController2 : UIViewController

//设置默认的学号和密码
@property(nonatomic,copy)NSString * studentNumber,*passWord;








@property (weak, nonatomic) IBOutlet UITextField *xuehaoLabel;
@property (weak, nonatomic) IBOutlet UITextField *mimaLabel;
@property (weak, nonatomic) IBOutlet UIButton *findMimaButton;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@property (strong, nonatomic) IBOutlet UIButton *markButton;




- (IBAction)findMimaButton:(UIButton *)sender;

- (IBAction)loadbutton:(id)sender;




- (IBAction)markButton:(UIButton *)sender;







@end
