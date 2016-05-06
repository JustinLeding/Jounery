//
//  CourseNumberModel.h
//  EducationalManagementSystem
//
//  Created by bever on 16/4/10.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseNumberModel : NSObject

@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * teacher;

@property(nonatomic,retain)NSNumber *startSection;
@property(nonatomic,retain)NSNumber *endSection;


@end
