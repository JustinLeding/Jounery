//
//  CourseModel.h
//  EducationalManagementSystem
//
//  Created by bever on 16/4/10.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseNumberModel.h"
@interface CourseModel : NSObject

@property(nonatomic,copy)NSString * weekend;
@property(nonatomic,retain)NSArray * courses;
@property(nonatomic,retain)NSNumber * weekendNumber;


@property(nonatomic,retain)CourseNumberModel * numModel;


@end

