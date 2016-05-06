//
//  CourseBackView.h
//  EducationalManagementSystem
//
//  Created by bever on 16/4/20.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackModel.h"
@interface CourseBackView : UIView

+(instancetype)sharedBackView;

@property(nonatomic,retain)BackModel * model;
//
//@property(nonatomic,assign)CGRect frame;
@end
