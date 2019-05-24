//
//  DelegateViewController.m
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/21.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "DelegateViewController.h"
#import "JSRootTabBarViewController.h"
#import "MJRefresh.h"

@interface DelegateViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"协议";
    self.webView.scrollView.backgroundColor = [UIColor whiteColor];
    [self refreshData];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshData)];
    self.webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
}

- (void)refreshData{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.33or.cn/ys.html"]];
    [self.webView loadRequest:request];
    [self.webView.scrollView.mj_header endRefreshing];
}


- (IBAction)agreeDelegateBtn:(UIButton *)sender {
    [JSUserInfo shareManager].token = @"token_key";
    JSRootTabBarViewController* control = [JSRootTabBarViewController shareInstance];
    KEY_WINDOW.rootViewController = control;
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
