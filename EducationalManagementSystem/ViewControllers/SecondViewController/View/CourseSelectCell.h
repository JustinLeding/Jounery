//
//  CourseSelectCell.h
//  EducationalManagementSystem
//
//  Created by bever on 16/3/30.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseSelectModel.h"
@interface CourseSelectCell : UITableViewCell

@property(nonatomic,retain)CourseSelectModel * model;
@property(nonatomic,assign)NSInteger index;





@property (strong, nonatomic) IBOutlet UILabel *courseName;
@property (strong, nonatomic) IBOutlet UILabel *courseGrade;//分数
@property (strong, nonatomic) IBOutlet UILabel *courseTime;
@property (strong, nonatomic) IBOutlet UILabel *courseClass;//教室
@property (strong, nonatomic) IBOutlet UILabel *teacher;
@property (strong, nonatomic) IBOutlet UILabel *weakend;//周数
@property (strong, nonatomic) IBOutlet UILabel *department;//院系










@end
