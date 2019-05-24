//
//  DefaultInstance.h
//  SUIXINJI
//
//  Created by 董成 on 2018/11/19.
//  Copyright © 2018 董成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultInstance : NSObject

+(instancetype)shareInstance;


@property (strong,nonatomic) NSDictionary *dic;
@property (strong,nonatomic) NSString *str;

@end
