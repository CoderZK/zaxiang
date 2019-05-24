//
//  TimiTableViewCell.h
//  Timi
//
//  Created by zk on 2018/10/23.
//  Copyright © 2018年 张坤. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TimiItem.h"
#import "TimiDelegate.h"




@interface TimiTableViewCell : UITableViewCell

@property (nonatomic, weak) id <TimiTableViewCellDelegate> delegate;

- (void)configureCell:(TimiItem *)item;

@end


//收入cell
@interface LeftCell : TimiTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

//支出cell
@interface RightCell : TimiTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end



