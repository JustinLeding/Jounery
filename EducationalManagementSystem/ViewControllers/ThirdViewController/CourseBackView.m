//
//  CourseBackView.m
//  EducationalManagementSystem
//
//  Created by bever on 16/4/20.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "CourseBackView.h"


@implementation CourseBackView{
    UILabel * _name;
    UILabel * _tele;
    UILabel * _qq;

    
}

+(instancetype)sharedBackView{
    
    static CourseBackView * backView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        backView = [[CourseBackView alloc] init];
        
    });
    return backView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 10;
        self.backgroundColor = [UIColor redColor];
        //老师
        _name = [[UILabel alloc] init];
        _name.numberOfLines = 0;
        _name.font = [UIFont systemFontOfSize:12];
        _name.text = @"老师:张浩";
        [self addSubview:_name];
        
        
        //电话
        _tele = [[UILabel alloc] init];
        _tele.font = [UIFont systemFontOfSize:12];
        _tele.numberOfLines = 0;

        _tele.text = @"电话:12365485623";
        [self addSubview:_tele];
        
        //qq
        _qq = [[UILabel alloc] init];
        _qq.font = [UIFont systemFontOfSize:12];
        _qq.numberOfLines = 0;

        _qq.text = @"qq:124525635";
        [self addSubview:_qq];
        

    }
    return self;
}
////
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
    _name.frame = CGRectMake(5, 0, frame.size.width, frame.size.height/3);
    
    _tele.frame = CGRectMake(5, _name.frame.size.height-8, frame.size.width, frame.size.height/3);
    _qq.frame = CGRectMake(5, frame.size.height/3*2, frame.size.width, frame.size.height/3);
    
    
}

-(void)setModel:(BackModel *)model{
    _model = model;
    
    _name.text = [NSString stringWithFormat:@"%@",_model.name];
    _tele.text = [NSString stringWithFormat:@"%@",_model.telephone];
    _qq.text = [NSString stringWithFormat:@"%@",_model.qq];
    
}







@end
