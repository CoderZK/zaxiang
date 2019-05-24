//
//  EditorClassTableViewCell.h
//  SUIXINJI
//
//  Created by 锋子 on 2018/11/30.
//  Copyright © 2018 锋子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditorClassTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;


+ (EditorClassTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
