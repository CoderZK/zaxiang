//
//  CollectionViewCell2.h
//  SUIXINJI
//
//  Created by 董成 on 2018/11/17.
//  Copyright © 2018 董成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CollectionViewCell2 : UICollectionViewCell
@property (nonatomic,strong) AVPlayer *player;//播放器
@property (nonatomic ,strong) AVPlayerItem *playerItem;//播放单元
@property (strong, nonatomic)AVPlayerLayer *playerLayer;//播放界面
@property (strong,nonatomic) UIImageView *imageView1;
@property (strong,nonatomic) UIImageView *imageView2;
@property (strong,nonatomic) UILabel *label1;
@property (strong,nonatomic) UILabel *label2;
@property (strong,nonatomic) UIView *viewlian;

@end
