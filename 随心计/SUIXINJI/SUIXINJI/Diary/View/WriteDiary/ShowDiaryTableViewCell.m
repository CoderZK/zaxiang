//
//  ShowDiaryTableViewCell.m
//  SUIXINJI
//
//  Created by 锋子 on 2018/11/29.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "ShowDiaryTableViewCell.h"

@implementation ShowDiaryTableViewCell

+ (ShowDiaryTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"ShowDiaryTableViewCell";
    ShowDiaryTableViewCell *cell=(ShowDiaryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"ShowDiaryTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (ShowDiaryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
