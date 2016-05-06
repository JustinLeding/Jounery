//
//  TeachersTableViewCell.h
//  EducationalManagementSystem
//
//  Created by bever on 16/3/27.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeachersModel.h"
@interface TeachersTableViewCell : UITableViewCell

@property(nonatomic,retain)TeachersModel * model;





@property (strong, nonatomic) IBOutlet UIImageView *imageView1;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *sex;

@property (weak, nonatomic) IBOutlet UILabel *office;
@property (weak, nonatomic) IBOutlet UILabel *telephone;

@property (weak, nonatomic) IBOutlet UILabel *qq;


@property (weak, nonatomic) IBOutlet UILabel *motto;//格言‘




















@end
