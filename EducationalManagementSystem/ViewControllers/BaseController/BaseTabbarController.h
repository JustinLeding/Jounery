//
//  BaseTabbarController.h
//  EducationalManagementSystem
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabbarController : UITabBarController

@property(nonatomic,retain)UIView * contentView;

@property(nonatomic,retain)UIImageView * selectImageView;



//-(void)changeSelectedImageViewFrame:(NSInteger)index;

@end


//-----------------------------



@interface NewTabbarItem : UIControl

@property(nonatomic,retain)UIImageView * imageView;
@property(nonatomic,retain)UILabel * label;



-(instancetype)initWithFrame:(CGRect)frame withTabbarItem:(UITabBarItem *)item;

@end
