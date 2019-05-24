//
//  MineTableViewCell.m
//  SUIXINJI
//
//  Created by 锋子 on 2018/11/29.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell

+ (MineTableViewCell *)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"MineTableViewCell";
    MineTableViewCell *cell=(MineTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"MineTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (MineTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 50, 0, 0)];
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
