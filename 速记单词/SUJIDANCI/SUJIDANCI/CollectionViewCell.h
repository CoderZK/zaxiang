//
//  CollectionViewCell.h
//  SUIXINJI
//
//  Created by 董成 on 2018/10/27.
//  Copyright © 2018 董成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface CollectionViewCell : UICollectionViewCell
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UILabel *label;
@end
