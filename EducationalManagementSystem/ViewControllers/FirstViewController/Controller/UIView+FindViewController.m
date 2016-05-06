//
//  UIView+FindViewController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/22.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "UIView+FindViewController.h"

@implementation UIView (FindViewController)

-(UIViewController *)findViewController{
    
    UIResponder * next = self.nextResponder;
    
    do {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController*)next;
            
        }else{
            //如果没哟找到下一级响应着，则继续寻找
            next = next.nextResponder;
            
        }
        
    } while (next != nil);
    return nil;
    
}

@end
