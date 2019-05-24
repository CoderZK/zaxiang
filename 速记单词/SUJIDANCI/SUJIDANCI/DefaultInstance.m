//
//  DefaultInstance.m
//  SUIXINJI
//
//  Created by 董成 on 2018/11/19.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DefaultInstance.h"

@implementation DefaultInstance


+(instancetype)shareInstance{
    //静态变量一旦被赋值，下次再读取就是被赋值后的值
    static DefaultInstance *sharedVC = nil;
    if (sharedVC == nil) {
        sharedVC = [[DefaultInstance alloc]init];
    }
    return sharedVC;
}

@end
