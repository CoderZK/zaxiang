//
//  JSClassModel.h
//  SUIXINJI
//
//  Created by 锋子 on 2018/12/3.
//  Copyright © 2018 锋子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSFastLoginModel.h"
#import "JSLocalStorageKit.h"

@interface JSClassModel : NSObject

@property (strong, nonatomic) NSMutableArray <JSFastLoginModel *> * userInfoArray;

/*!
 日记类别
 */
@property(copy,nonatomic) NSString* class_name;
/*!
 类别方式(颜色)
 */
@property(strong,nonatomic) UIColor * class_color;


- (instancetype)init;

- (void)encodeWithCoder:(NSCoder *)aCoder;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;



@end

