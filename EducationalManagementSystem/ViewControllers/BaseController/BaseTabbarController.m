//
//  BaseTabbarController.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "BaseTabbarController.h"

@interface BaseTabbarController ()

@end

@implementation BaseTabbarController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    //接收点击网上选课的通知，让下标选中图片移动到第二个
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSelectedImage) name:@"change" object:nil];
    
    
    //首先创建一个标签栏地步视图
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 49)];
    [_contentView setBackgroundColor:[UIColor orangeColor]];
    [self.tabBar addSubview:_contentView];
   
}

-(void)changeSelectedImage{
    [UIView animateWithDuration:0.4 animations:^{
        _selectImageView.frame = CGRectMake(kScreenW/self.viewControllers.count, 0, kScreenW/self.viewControllers.count, 49);
    }];
}



-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    //删除按钮
    [self removeTabbarItem];
    
    

}

-(void)removeTabbarItem{
    
    //遍历标签栏的字视图，删除按钮
    for (UIView * view  in self.tabBar.subviews) {
        if ([view isKindOfClass:[NSClassFromString(@"UITabBarButton") class]]) {
            [view removeFromSuperview];
        }
    }
}

//在标签栏创建视图控制器的时候创建按钮
-(void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    [super setViewControllers:viewControllers];
    
    //创建按钮
    [self creatTabbarItem];
    
}

-(void)creatTabbarItem{

    for (int i = 0; i<self.viewControllers.count; i ++) {
        
        
        //创建按钮
        CGRect frame = CGRectMake(kScreenW/self.viewControllers.count*i, 0, kScreenW/self.viewControllers.count, 49);
        
        //子类化
        NewTabbarItem * item = [[NewTabbarItem alloc] initWithFrame:frame withTabbarItem:[self.viewControllers objectAtIndex:i].tabBarItem];
        item.tag = i + 100;
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //添加选中的背景图片。默认第一个
        if (i == 0) {
            _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, item.frame.size.width, item.frame.size.height) ];
            
            _selectImageView.image = [UIImage imageNamed:@"pic_title_bg.9"];
            
            [_contentView addSubview:_selectImageView];
        }
        
        
        [_contentView addSubview:item];

    }
 
}



-(void)itemAction:(NewTabbarItem *)item {
    
    //点击实现视图控制器之间的切换
    self.selectedIndex = item.tag - 100;
    
    [UIView animateWithDuration:0.4 animations:^{
        
        _selectImageView.frame = item.frame;
       
    }];
   
}


@end


//---------------------------------------


@implementation NewTabbarItem

//这是初始化每一个item
-(instancetype)initWithFrame:(CGRect)frame withTabbarItem:(UITabBarItem *)item{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView.image = item.image;
        _imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_imageView];
    
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-15, self.frame.size.width, 15)];
        _label.text = item.title;
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont boldSystemFontOfSize:12];
        
        [self addSubview:_label];
    }
    
    return self;

}

@end




