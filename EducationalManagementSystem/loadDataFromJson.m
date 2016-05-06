//
//  loadDataFromJson.m
//  Timer
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "loadDataFromJson.h"

@implementation loadDataFromJson

+(id)loadDataFromFileName:(NSString *)fileName{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];;

    NSData * data = [NSData dataWithContentsOfFile:path];

    id dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
   
    
    
    return dic;

}

@end
