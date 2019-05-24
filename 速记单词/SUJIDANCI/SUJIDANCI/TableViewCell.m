//
//  TableViewCell.m
//  SUIXINJI
//
//  Created by 董成 on 2018/10/29.
//  Copyright © 2018 董成. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //单元格的高度
        CGFloat cellHeight = self.frame.size.height;
        //添加imageView
        CGFloat imageViewWidth = 39;
        CGFloat imageViewHeight = 28;
        CGFloat imageViewLeftView = 300;
        self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewLeftView, (cellHeight-imageViewHeight)/2, imageViewWidth, imageViewHeight)];
        [self addSubview:self.myImageView];
        //添加标签
        CGFloat labelWidth = 120;
        CGFloat labelHeight = 21;
        CGFloat labelLeftView = 15;
        self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelLeftView, (cellHeight-labelHeight)/2, labelWidth, labelHeight)];
        [self addSubview:self.myLabel];
    }
    return self;
    
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
