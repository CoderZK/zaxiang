//
//  DetailViewController2.m
//  SUIXINJI
//
//  Created by 董成 on 2018/11/9.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DetailViewController2.h"
#import "DetailViewController3.h"
#import <AVFoundation/AVFoundation.h>

@interface DetailViewController2 ()
@property (strong,nonatomic) NSArray *listWords;
@property (nonatomic,strong) AVPlayer *player;
@property (nonatomic,strong) NSData *data;
@end

@implementation DetailViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回键
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backAct)];
    //设置背景图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"wordsdi"];
    [self.view insertSubview:imageView atIndex:0];
    //sreen是主屏幕的范围
    CGRect screen = [[UIScreen mainScreen] bounds];
    //获取所有子视图
    //NSArray *subViewArray = self.view.subviews;
    //新建一个view
    //UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 100, screen.size.width-200, screen.size.height-200)];
    //设置标签
    //view1.tag = 1;
    //设置透明度
    //view1.alpha = 0.3;
    //设置背景颜色
    //view1.backgroundColor = [UIColor redColor];
    //设置边框粗细
    //view1.layer.borderWidth = 10;
    //设置边框颜色
    //view1.layer.borderColor = [UIColor yellowColor].CGColor;
    //设置圆角
    //view1.layer.cornerRadius = 10;
    //设置阴影效果
    //view1.layer.shadowColor = [UIColor greenColor].CGColor;
    //view1.layer.shadowOffset = CGSizeMake(10, 10);
    //view1.layer.shadowOpacity = 0.9;
    //添加到父视图
    //[self.view addSubview:view1];
    
    //设置滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    scrollView.contentSize = CGSizeMake(screen.size.width,screen.size.height+300);
    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    
   
    
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, screen.size.width-40, 0)];
    label1.font = [UIFont systemFontOfSize:15];
    label1.backgroundColor = [UIColor whiteColor];
    label1.layer.borderWidth = 1;
    label1.layer.borderColor = [UIColor grayColor].CGColor;
    label1.layer.cornerRadius = 2;
    label1.numberOfLines = 0;
    label1.text = self.rowdict[@"yuan1"];
    CGSize size = [label1 sizeThatFits:CGSizeMake(label1.frame.size.width, MAXFLOAT)];
    label1.frame = CGRectMake(label1.frame.origin.x, label1.frame.origin.y, label1.frame.size.width,size.height);
    NSLog(@"label1.frame = %@",NSStringFromCGRect(label1.frame));
    [scrollView addSubview:label1];
    
    
    //新建label2
    UILabel *label2 = [[UILabel alloc]init];
    //添加进来后才能相对布局
    [scrollView addSubview:label2];
    //使用NSLayoutConstraint进行相对布局必须把这个属性设置为no
    label2.translatesAutoresizingMaskIntoConstraints = NO;
    //上
    NSLayoutConstraint *label2Top = [NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label1 attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    [scrollView addConstraint:label2Top];
    //左
    NSLayoutConstraint *label2Left = [NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label1 attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [scrollView addConstraint:label2Left];
    //宽
    NSLayoutConstraint *label2Width = [NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:label1 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [scrollView addConstraint:label2Width];
    //高
    //NSLayoutConstraint *label3Height = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:label2 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    //[scrollView addConstraint:label3Height];
    //下面是设置label3的其它属性
    label2.font = [UIFont systemFontOfSize:15];
    label2.backgroundColor = [UIColor whiteColor];
    label2.layer.borderWidth = 1;
    label2.layer.borderColor = [UIColor grayColor].CGColor;
    label2.layer.cornerRadius = 2;
    label2.numberOfLines = 0;
    label2.text = self.rowdict[@"yuan2"];
    CGSize size2 = [label2 sizeThatFits:CGSizeMake(label2.frame.size.width, MAXFLOAT)];
    label2.frame = CGRectMake(label2.frame.origin.x, label2.frame.origin.y, label2.frame.size.width,size2.height);
    NSLog(@"label2.frame = %@",NSStringFromCGRect(label2.frame));
    [scrollView addSubview:label2];
    
    //新建label3
    UILabel *label3 = [[UILabel alloc]init];
    //添加进来后才能相对布局
    [scrollView addSubview:label3];
    //使用NSLayoutConstraint进行相对布局必须把这个属性设置为no
    label3.translatesAutoresizingMaskIntoConstraints = NO;
    //上
    NSLayoutConstraint *label3Top = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label2 attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    [scrollView addConstraint:label3Top];
    //左
    NSLayoutConstraint *label3Left = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label2 attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [scrollView addConstraint:label3Left];
    //宽
    NSLayoutConstraint *label3Width = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:label2 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [scrollView addConstraint:label3Width];
    //高
    //NSLayoutConstraint *label3Height = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:label2 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    //[scrollView addConstraint:label3Height];
    //下面是设置label3的其它属性
    label3.font = [UIFont systemFontOfSize:15];
    label3.backgroundColor = [UIColor whiteColor];
    label3.layer.borderWidth = 1;
    label3.layer.borderColor = [UIColor grayColor].CGColor;
    label3.layer.cornerRadius = 2;
    label3.numberOfLines = 0;
    label3.text = self.rowdict[@"yuan3"];
    CGSize size3 = [label3 sizeThatFits:CGSizeMake(label3.frame.size.width, MAXFLOAT)];
    label3.frame = CGRectMake(label3.frame.origin.x, label3.frame.origin.y, label3.frame.size.width,size3.height);
    NSLog(@"label3.frame = %@",NSStringFromCGRect(label3.frame));
    [scrollView addSubview:label3];

    //新建label4
    UILabel *label4 = [[UILabel alloc]init];
    //添加进来后才能相对布局
    [scrollView addSubview:label4];
    //使用NSLayoutConstraint进行相对布局必须把这个属性设置为no
    label4.translatesAutoresizingMaskIntoConstraints = NO;
    //上
    NSLayoutConstraint *label4Top = [NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    [scrollView addConstraint:label4Top];
    //左
    NSLayoutConstraint *label4Left = [NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [scrollView addConstraint:label4Left];
    //宽
    NSLayoutConstraint *label4Width = [NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [scrollView addConstraint:label4Width];
    //高
    //NSLayoutConstraint *label4Height = [NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    //[scrollView addConstraint:label4Height];
    //下面是设置label4的其它属性
    label4.font = [UIFont systemFontOfSize:15];
    label4.backgroundColor = [UIColor whiteColor];
    label4.layer.borderWidth = 1;
    label4.layer.borderColor = [UIColor grayColor].CGColor;
    label4.layer.cornerRadius = 2;
    label4.numberOfLines = 0;
    label4.text = self.rowdict[@"yuan4"];
    CGSize size4 = [label4 sizeThatFits:CGSizeMake(label4.frame.size.width, MAXFLOAT)];
    label4.frame = CGRectMake(label4.frame.origin.x, label4.frame.origin.y, label4.frame.size.width,size4.height);
    NSLog(@"label4.frame = %@",NSStringFromCGRect(label4.frame));
    [scrollView addSubview:label4];
    
    //新建label5
    UILabel *label5 = [[UILabel alloc]init];
    //添加进来后才能相对布局
    [scrollView addSubview:label5];
    //使用NSLayoutConstraint进行相对布局必须把这个属性设置为no
    label5.translatesAutoresizingMaskIntoConstraints = NO;
    //上
    NSLayoutConstraint *label5Top = [NSLayoutConstraint constraintWithItem:label5 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label4 attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    [scrollView addConstraint:label5Top];
    //左
    NSLayoutConstraint *label5Left = [NSLayoutConstraint constraintWithItem:label5 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label4 attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [scrollView addConstraint:label5Left];
    //宽
    NSLayoutConstraint *label5Width = [NSLayoutConstraint constraintWithItem:label5 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:label4 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [scrollView addConstraint:label5Width];
    //高
    //NSLayoutConstraint *label5Height = [NSLayoutConstraint constraintWithItem:label5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:label4 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    //[scrollView addConstraint:label5Height];
    //下面是设置label5的其它属性
    label5.font = [UIFont systemFontOfSize:15];
    label5.backgroundColor = [UIColor whiteColor];
    label5.layer.borderWidth = 1;
    label5.layer.borderColor = [UIColor grayColor].CGColor;
    label5.layer.cornerRadius = 2;
    label5.numberOfLines = 0;
    label5.text = self.rowdict[@"yuan5"];
    NSLog(@"我是图片的地址%@", label5.text);
    CGSize size5 = [label5 sizeThatFits:CGSizeMake(label5.frame.size.width, MAXFLOAT)];
    label5.frame = CGRectMake(label5.frame.origin.x, label5.frame.origin.y, label5.frame.size.width,size5.height);
    

    
    

    
    UIImageView *imageView2 = [[UIImageView alloc]init];
    [scrollView addSubview:imageView2];
    imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    //上
    NSLayoutConstraint *image2Top = [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label5 attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    [scrollView addConstraint:image2Top];
    //左
    NSLayoutConstraint *image2Left = [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label5 attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [scrollView addConstraint:image2Left];
    //宽
    NSLayoutConstraint *image2Width = [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:label5 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [scrollView addConstraint:image2Width];
    //高
    NSLayoutConstraint *image2Height = [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageView2 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [scrollView addConstraint:image2Height];
    
    
    
    //从网络获取图片
    NSString *urlstring = self.rowdict[@"imageurl"];
    NSLog(@"我是图片的地址%@", urlstring);
    NSURL *url2 = [NSURL URLWithString:urlstring];
    self.data = [NSData dataWithContentsOfURL:url2];
    imageView2.image =  [UIImage imageWithData:self.data];
    
    
    //音乐图片
    UIButton *buttonMusic = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 40, 40)];
    [buttonMusic setBackgroundImage:[UIImage imageWithData:self.data] forState:UIControlStateNormal];
    //buttonMusic.layer.borderWidth = 2;
    //buttonMusic.layer.borderColor = [UIColor redColor].CGColor;
    //buttonMusic.layer.cornerRadius = 20.0;
    [buttonMusic addTarget:self action:@selector(button0act:) forControlEvents:UIControlEventTouchUpInside];
    //网路音乐地址
    NSString *audioFilePath = self.rowdict[@"yuan6"];
    NSURL *ff = [NSURL URLWithString:audioFilePath];
    AVPlayerItem * songItem = [[AVPlayerItem alloc]initWithURL:ff];
    self.player = [[AVPlayer alloc]initWithPlayerItem:songItem];
    
    //[scrollView addSubview:buttonMusic];
    
    //音乐小图片
    UIButton *buttonMusicLeft = [[UIButton alloc]initWithFrame:CGRectMake(70, 15, 15, 20)];
    [buttonMusicLeft setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    //[scrollView addSubview:buttonMusicLeft];
    //音乐小label
    UILabel *musicl2 = [[UILabel alloc]initWithFrame:CGRectMake(90, 15, 110, 20)];
    musicl2.text = self.rowdict[@"yuan8"];
    musicl2.textColor = [UIColor grayColor];
    musicl2.font = [UIFont systemFontOfSize:10];
    //[scrollView addSubview:musicl2];
    //音乐大label
    UILabel *musicl3 = [[UILabel alloc]initWithFrame:CGRectMake(70, 32, 130, 20)];
    musicl3.text = @"用音乐的力量去理解单词";
    musicl3.textColor = [UIColor grayColor];
    musicl3.font = [UIFont systemFontOfSize:10];
    //[scrollView addSubview:musicl3];
    
    
    
    
    
    //参与单词追杀令
    UIButton *buttondi = [[UIButton alloc]init];
    buttondi.backgroundColor = [UIColor redColor];
    // 默认状态的文字
    [buttondi setTitle:@"<<单词追杀令>>" forState:UIControlStateNormal];
    //动作
    [buttondi addTarget:self action:@selector(buttondi) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:buttondi];
    buttondi.translatesAutoresizingMaskIntoConstraints = NO;
    //上
    NSLayoutConstraint *buttondiTop = [NSLayoutConstraint constraintWithItem:buttondi attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imageView2 attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    [scrollView addConstraint:buttondiTop];
    //左
    NSLayoutConstraint *buttondiLeft = [NSLayoutConstraint constraintWithItem:buttondi attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imageView2 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [scrollView addConstraint:buttondiLeft];
    
}

//返回键
- (void)backAct{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//底部按钮动作
-(void)buttondi{
    DetailViewController3 *detailViewController = [[DetailViewController3 alloc]init];
    //detailViewController.url = @"http://www.studynumber.com/wordskill/wordshtml/8.html";
    //detailViewController.title = @"单词追杀令";
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    [self presentViewController:navigationController animated:TRUE completion:nil];
}







//音乐按钮
- (void)button0act:(id)sender{
    //if (self.player) {
      //  [self.player pause];
    //}else{
        [self.player play];
    //}
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
