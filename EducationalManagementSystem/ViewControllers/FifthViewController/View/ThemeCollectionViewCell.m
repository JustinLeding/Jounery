//
//  ThemeCollectionViewCell.m
//  EducationalManagementSystem
//
//  Created by bever on 16/4/11.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "ThemeCollectionViewCell.h"

@implementation ThemeCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(ThemeModel *)model{
    _model = model;
    
    [_imageView setImage:[UIImage imageNamed:_model.picName]];

}

@end
