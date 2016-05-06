//
//  FirstTableViewCell.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/22.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//复写set方法
-(void)setModel:(NewsModel *)model{
    _model = model;

    _titleLabel.text = _model.title;
    _academyLabel.text = [NSString stringWithFormat:@"部门:%@", _model.academy];    //部门
    _countLabel.text = [NSString stringWithFormat:@"评论数:%@",_model.count];    //点赞数
    _timeLabel.text = _model.time;      //
    
    

//    * title,*academy,*time,*editor,*count;

}


@end
