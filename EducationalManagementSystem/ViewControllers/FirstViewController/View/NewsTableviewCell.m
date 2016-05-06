//
//  NewsTableviewCell.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/22.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "NewsTableviewCell.h"

@implementation NewsTableviewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(OneNewModel *)model{
    _model = model;
    
    _titleLabel.text = _model.title;
    _countLabel.text = _model.content;
    _academyLabel.text = _model.academy;
    _timeLabel.text  = _model.time;
    _countLabel.text = _model.count;

}
@end
