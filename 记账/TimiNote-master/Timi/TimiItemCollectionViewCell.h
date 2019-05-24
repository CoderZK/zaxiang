//
//  TimiItemCollectionViewCell.h
//  Timi
//
//  Created by zk on 2018/10/23.
//  Copyright © 2018年 张坤. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface TimiItemCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *cellImage;
@property (nonatomic, strong) UILabel *cellLabel;

@property (nonatomic, strong) UIImageView *cellPic;



+ (instancetype)createCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath reuseIdentifier:(NSString *)identifier;

@end
