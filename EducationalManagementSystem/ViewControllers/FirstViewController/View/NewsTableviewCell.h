//
//  NewsTableviewCell.h
//  EducationalManagementSystem
//
//  Created by bever on 16/3/22.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneNewModel.h"
@interface NewsTableviewCell : UITableViewCell

@property(nonatomic,retain)OneNewModel * model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *academyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (weak, nonatomic) IBOutlet UILabel *countLabel;






// title,*content,*academy,*time,*editor,*count;





@end
