//
//  CollectionViewCell2.m
//  SUIXINJI
//
//  Created by 董成 on 2018/11/17.
//  Copyright © 2018 董成. All rights reserved.
//

#import "CollectionViewCell2.h"

@implementation CollectionViewCell2





-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect screen = [[UIScreen mainScreen] bounds];
        
        //imageView1
        self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen.size.width, 230)];
        self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView1.clipsToBounds = true;
        [self addSubview:self.imageView1];
        //imageView2
        self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 240, 60, 60)];
        self.imageView2.layer.cornerRadius = 30;
        self.imageView2.layer.masksToBounds = true;
        [self addSubview:self.imageView2];
        //label1
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 253, 201, 16)];
        //self.label1.textAlignment = NSTextAlignmentCenter;
        self.label1.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.label1];
        //label2
        self.label2= [[UILabel alloc] initWithFrame:CGRectMake(90, 275, 201, 16)];
        //self.label2.textAlignment = NSTextAlignmentCenter;
        self.label2.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.label2];
        //viewxian
        self.viewlian = [[UIView alloc]initWithFrame:CGRectMake(0, 310, screen.size.width, 1)];
        self.viewlian.backgroundColor = [UIColor grayColor];
        [self addSubview:self.viewlian];
    }
    return self;
}

@end
