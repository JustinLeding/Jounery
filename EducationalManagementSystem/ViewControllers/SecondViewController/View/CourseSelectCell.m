//
//  CourseSelectCell.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/30.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "CourseSelectCell.h"

@implementation CourseSelectCell{

    BOOL isSelect[100];//默认都是no
}

- (void)awakeFromNib {
    
    //创建一个可变数组
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)selectButtonAction:(UIButton *)sender {//选课按钮响应事件 ，
    NSLog(@"点击了第%ld个按钮",_index);
    
   
    if (!isSelect[_index]) {
        //发送通知记录第index个数据
        NSDictionary * dic = @{@"index":@(_index)};
        //发送通知，往字典里面添加选中的数据
        [[NSNotificationCenter defaultCenter] postNotificationName:@"select" object:nil userInfo:dic];
        
    }
  
     isSelect[_index] = YES;
    
}
-(void)setIndex:(NSInteger)index{
    _index = index;
}

-(void)setModel:(CourseSelectModel *)model{
    _model = model;
    
    
//    @property (strong, nonatomic) IBOutlet UILabel *courseName;
//    @property (strong, nonatomic) IBOutlet UILabel *courseGrade;//分数
//    @property (strong, nonatomic) IBOutlet UILabel *courseTime;
//    @property (strong, nonatomic) IBOutlet UILabel *courseClass;//教室
//    @property (strong, nonatomic) IBOutlet UILabel *teacher;
//    @property (strong, nonatomic) IBOutlet UILabel *weakend;//周数
    
    
    _courseName.text = _model.name;
    _courseGrade.text = _model.score;
    _courseTime.text = _model.time;
    _courseClass.text = _model.classroom;
    _teacher.text = _model.teacher;
    _weakend.text = _model.week;
    _department.text = _model.department;
    
    
    //"name":"经典名著导读",
    //"score":"2分",
    //"time":"晚上10节到11节",
    //"week":"第一周，第三周",
    //"teacher":"章红艳",
    //"classroom":"3101",

}



@end
