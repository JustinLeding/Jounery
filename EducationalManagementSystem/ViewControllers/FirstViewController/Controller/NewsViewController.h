//
//  NewsViewController.h
//  EducationalManagementSystem
//
//  Created by bever on 16/3/22.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
//上一页传递的数据
@property(nonatomic,retain)NSArray * dataModels;
//上一页传递的第几个单元格
@property(nonatomic,assign)NSInteger indexPath_row;



@end
