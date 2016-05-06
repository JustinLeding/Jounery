//
//  TeachersTableViewCell.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/27.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "TeachersTableViewCell.h"

@implementation TeachersTableViewCell

- (void)awakeFromNib {
   
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(TeachersModel *)model{

    _model = model;
    
    _name.text = [NSString stringWithFormat:@"姓名：%@",_model.name];
    _sex.text = [NSString stringWithFormat:@"性别：%@",_model.sex];
    _office.text = [NSString stringWithFormat:@"教研室：%@",_model.office];
    _telephone.text = [NSString stringWithFormat:@"电话：%@",_model.telephone];
    _qq.text = [NSString stringWithFormat:@"qq：%@",_model.qq];
    _imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_model.image]];
    
    _motto.text = [NSString stringWithFormat:@"鸡汤格言：%@",_model.motto];
    
    
    
    
    
    
}








@end
