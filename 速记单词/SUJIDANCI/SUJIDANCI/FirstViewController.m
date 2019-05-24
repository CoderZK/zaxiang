//
//  FirstViewController.m
//  SUIXINJI
//
//  Created by 董成 on 2018/9/24.
//  Copyright © 2018年 董成. All rights reserved.
//

#import "FirstViewController.h"
#import "LookPicturesViewController.h"
#import "LookWordsViewController.h"
#import "LookWaysViewController.h"
#import "DetailViewController2.h"
#import <AVOSCloud/AVOSCloud.h>

@interface FirstViewController ()
@property(strong,nonatomic) UIActivityIndicatorView *activityIndicatorView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //向服务器发送数据
    //AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    //[testObject setObject:@"bar" forKey:@"foo"];
    //[testObject save];
    
    //设置屏幕大小
    CGRect screen = [[UIScreen mainScreen] bounds];
    //设置背景图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"b1"];
    [self.view insertSubview:imageView atIndex:0];
    //设置button1
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    if (screen.size.height>586) {
        button1.frame = CGRectMake((screen.size.width-100)/2, 78, 100, 50);
    }
    button1.frame = CGRectMake((screen.size.width-100)/2, 58, 100, 50);
    button1.layer.borderColor = [UIColor redColor].CGColor;
    button1.layer.borderWidth = 2.0;
    button1.layer.cornerRadius = 10.0;
    [button1 setTitle:@"看词忆图" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    //设置button2
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    if (screen.size.height>586) {
       button2.frame = CGRectMake((screen.size.width-100)/2, 158, 100, 50);
    }
    button2.frame = CGRectMake((screen.size.width-100)/2, 138, 100, 50);
    button2.layer.borderColor = [UIColor greenColor].CGColor;
    button2.layer.borderWidth = 2.0;
    button2.layer.cornerRadius = 10.0;
    [button2 setTitle:@"看图忆词" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    
    
    //设置button3
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    if (screen.size.height>586) {
        button3.frame = CGRectMake((screen.size.width-100)/2, 236, 100, 50);
    }
    button3.frame = CGRectMake((screen.size.width-100)/2, 216, 100, 50);
    button3.layer.borderColor = [UIColor yellowColor].CGColor;
    button3.layer.borderWidth = 2.0;
    button3.layer.cornerRadius = 10.0;
    [button3 setTitle:@"使用方法" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button3show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    //设置button4
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    if (screen.size.height>586) {
        button4.frame = CGRectMake((screen.size.width-100)/2, 286, 100, 50);
    }
    button4.frame = CGRectMake((screen.size.width-100)/2, 276, 100, 50);
    button4.layer.borderColor = [UIColor yellowColor].CGColor;
    button4.layer.borderWidth = 2.0;
    button4.layer.cornerRadius = 10.0;
    [button4 setTitle:@"使用方法" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(button4show:) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:button4];
}
- (void)button1show:(id)sender{
    LookWordsViewController* lookPicturesViewController = [[LookWordsViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:lookPicturesViewController];
    [self presentViewController:navigationController animated:TRUE completion:nil];
}

- (void)button2show:(id)sender{
  
    
    LookPicturesViewController* lookPicturesViewController = [[LookPicturesViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:lookPicturesViewController];
    [self presentViewController:navigationController animated:TRUE completion:nil];
}

- (void)button3show:(id)sender{
    LookWaysViewController* lookPicturesViewController = [[LookWaysViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:lookPicturesViewController];
    [self presentViewController:navigationController animated:TRUE completion:nil];
}

- (void)button4show:(id)sender{
    DetailViewController2* detailViewController2 = [[DetailViewController2 alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController2];
    [self presentViewController:navigationController animated:TRUE completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
