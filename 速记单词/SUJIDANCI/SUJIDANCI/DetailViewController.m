


#import "DetailViewController.h"
//使用webkit视图第一步，工具类
#import <WebKit/WebKit.h>
//使用webkit视图第二步，wk导航栏委托协议
@interface DetailViewController () <WKNavigationDelegate>
//使用webkit视图第三步，新建一个wb对象
@property(nonatomic, strong) WKWebView* webView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航条返回键
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backAct)];
    
    // 添加WKWebView
    self.webView = [[WKWebView alloc] initWithFrame: self.view.frame];
    [self.view addSubview: self.webView];
    
    //webview的导航委托对象是自己
    self.webView.navigationDelegate = self;
    //self.url怎么设置？
    NSURL * url = [NSURL URLWithString: self.url];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}


- (void)backAct{
    [self dismissViewControllerAnimated:YES completion:nil];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark  --实现WKNavigationDelegate委托协议
//开始加载时调用
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载");
}
//当内容开始返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"内容开始返回");
}

//加载完成之后调用
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
}

//加载失败时调用
-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败 error :  %@", error.localizedDescription);
}

@end
