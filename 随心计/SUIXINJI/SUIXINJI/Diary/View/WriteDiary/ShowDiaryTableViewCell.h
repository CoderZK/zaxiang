//
//  ShowDiaryTableViewCell.h
//  SUIXINJI
//
//  Created by 锋子 on 2018/11/29.
//  Copyright © 2018 锋子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowDiaryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;

+ (ShowDiaryTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
