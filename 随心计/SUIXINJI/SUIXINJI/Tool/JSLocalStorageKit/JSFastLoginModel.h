//
//  JSFastLoginModel.h
//  MatchingPlatform
//
//  Created by nuomi on 2016/12/19.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSImageModel.h"

@interface JSFastLoginModel : NSObject<NSCoding>

/*!
 日记图片
 */
@property(copy,nonatomic) NSMutableArray * class_imageArr;
/*!
 写日记时间年月
 */
@property(copy,nonatomic) NSString* class_year;

/*!
 写日记时间日
 */
@property(copy,nonatomic) NSString* class_day;

/*!
 写日记时间小时分钟
 */
@property(copy,nonatomic) NSString* class_hour;

/*!
 写日记时间周
 */
@property(copy,nonatomic) NSString* class_week;
/*!
 日记内容
 */
@property(copy,nonatomic) NSString* class_note;
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
