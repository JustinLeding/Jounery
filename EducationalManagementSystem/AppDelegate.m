//
//  AppDelegate.m
//  EducationalManagementSystem
//
//  Created by bever on 16/3/19.
//  Copyright © 2016年 JustinLeding. All rights reserved.
//

#import "AppDelegate.h"
#import "MyInfoViewController2.h"
#import "MMDrawerController.h"
#import "LeftViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"MyInfoViewController" bundle:[NSBundle mainBundle]];
    MyInfoViewController2 * vc = [story instantiateInitialViewController];
    self.window.rootViewController = vc;
    
    
    
//    
//    NSArray * array = @[@"FirstViewController",@"SecondViewController",@"ThirdViewController",@"FourthViewController"];
//    
//    NSMutableArray * navs = [[NSMutableArray alloc] init];
//    
//    for (NSString * str in array) {
//        
//        //三级控制器
//        UIViewController * vc = [[NSClassFromString(str) alloc] init];
//        
//        //二级控制器
//        BaseNavigationController * nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
//        
//        [navs addObject:nav];
//        
//    }
//    
//    
//    //以及控制器
//    BaseTabbarController * tabbarViewController = [[BaseTabbarController alloc] init];
//    tabbarViewController.viewControllers = navs;
//    
//   
//    
//    
//    LeftViewController * leftViewController = [[LeftViewController alloc] init];
//    
//    MMDrawerController * mmDrawerController = [[MMDrawerController alloc] initWithCenterViewController:tabbarViewController leftDrawerViewController:leftViewController];
//    
//    
//     self.window.rootViewController = mmDrawerController;
//    
//    
//    [mmDrawerController setShowsShadow:YES];
//    [mmDrawerController setMaximumLeftDrawerWidth:280];
//    [mmDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
//    [mmDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
