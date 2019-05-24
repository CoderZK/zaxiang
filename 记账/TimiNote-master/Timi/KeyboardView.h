//
//  KeyboardView.h
//  Timi
//
//  Created by zk on 2018/10/23.
//  Copyright © 2018年 张坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimiDelegate.h"

@interface KeyboardView : UIView

@property (nonatomic, assign) BOOL isShrink;
@property (weak, nonatomic) IBOutlet UIImageView *contentLogo;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentCostLabel;

@property (nonatomic, weak) id<ItemCompleteDelegate>delegate;

@end
