//
//  TimiItem.h
//  Timi
//
//  Created by zk on 2018/10/23.
//  Copyright © 2018年 张坤. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TimiItem : NSObject


- (instancetype)initWithContent:(NSString *)content itemCost:(double )cost logoStr:(NSString *)logoStr insertTime:(NSDate *)timeStamp contentType:(BOOL )isOutcome;


@property (nonatomic, copy) NSString *content; //Item的内容
@property (nonatomic, assign) double cost; //金额大小
@property (nonatomic, copy) NSString *logo; //图片logo
@property (nonatomic, assign) BOOL isOutcome;  //内容类型
@property (nonatomic, strong) NSDate *timeStamp; //插入时间
@property (nonatomic, assign) BOOL isHeader; //设置标志来看是否需要显示时间

@end
