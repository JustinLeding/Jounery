//
//  FirstTableViewCell.h
//  EducationalManagementSystem
//
//  Created by bever on 16/3/22.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface FirstTableViewCell : UITableViewCell


@property(nonatomic,retain)NewsModel * model;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *academyLabel;

@property (strong, nonatomic) IBOutlet UILabel *countLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;




@end
