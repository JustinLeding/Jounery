//
//  ThemeCollectionViewCell.h
//  EducationalManagementSystem
//
//  Created by bever on 16/4/11.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeModel.h"
@interface ThemeCollectionViewCell : UICollectionViewCell

@property(nonatomic,retain)ThemeModel * model;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;




@end
