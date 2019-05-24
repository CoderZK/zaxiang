//
//  VideoViewController.m
//  SUIXINJI
//
//  Created by 董成 on 2018/11/18.
//  Copyright © 2018 董成. All rights reserved.
//

#import "VideoViewController.h"
#import<AVFoundation/AVFoundation.h>
#import "DefaultInstance.h"
@interface VideoViewController ()
@property (strong, nonatomic)AVPlayer *myPlayer;//播放器
@property (strong, nonatomic)AVPlayerItem *item;//播放单元
@property (strong, nonatomic)AVPlayerLayer *playerLayer;//播放界面（layer）
@property (strong,nonatomic) NSArray *videos;


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    
    //单例传值——接收
    NSString *sss = [DefaultInstance shareInstance].str;
    NSLog(@"%@",sss);
    NSURL *mediaURL = [NSURL URLWithString:sss];
    self.item = [AVPlayerItem playerItemWithURL:mediaURL];
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.item];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.playerLayer.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.width*13/9);
    [self.view.layer addSublayer:self.playerLayer];
    [self.myPlayer play];
    
    UIButton *b1 = [[UIButton alloc]initWithFrame:CGRectMake((screen.size.width-80)/2, ((self.view.bounds.size.width*13/9)+20), 80, 50)];
    [b1 setTitle:@"返回" forState:UIControlStateNormal];
    b1.backgroundColor = [UIColor redColor];
    [b1 addTarget:self action:@selector(backAct) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b1];
}


- (void)backAct{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
