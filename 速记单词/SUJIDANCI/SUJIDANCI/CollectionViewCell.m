//
//  CollectionViewCell.m
//  SUIXINJI
//
//  Created by 董成 on 2018/10/27.
//  Copyright © 2018 董成. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //cellWidth
        CGFloat cellWidth = self.frame.size.width;
        //imageView单元格的宽度
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellWidth-101)/2, 15, 101, 101)];
        [self addSubview:self.imageView];
        //label
        self.label = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth-121)/2, 135, 131, 16)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.label];
    }
    return self;
}
@end
