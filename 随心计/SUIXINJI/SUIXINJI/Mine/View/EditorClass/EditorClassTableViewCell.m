//
//  EditorClassTableViewCell.m
//  SUIXINJI
//
//  Created by 锋子 on 2018/11/30.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "EditorClassTableViewCell.h"

@implementation EditorClassTableViewCell

+ (EditorClassTableViewCell *)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"EditorClassTableViewCell";
    EditorClassTableViewCell *cell=(EditorClassTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"EditorClassTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (EditorClassTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.colorView.layer.cornerRadius = 7.5;
    self.colorView.layer.borderWidth = 1;
    self.colorView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
