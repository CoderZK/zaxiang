//
//  LookWaysViewController.m
//  SUIXINJI
//
//  Created by 董成 on 2018/10/27.
//  Copyright © 2018 董成. All rights reserved.
//

#import "LookWaysViewController.h"
#import "DetailViewController.h"
#define CellIdentifier @"CellIdentifier"
#import "UIImageView+WebCache.h"
#import <AVOSCloud/AVOSCloud.h>
#import "AFNetworking.h"
#import <AFNetworkActivityIndicatorManager.h>



@interface LookWaysViewController ()
@property (strong,nonatomic) NSString *imageName;
@property (strong,nonatomic) NSArray *listWords;
@property (strong,nonatomic) UITableView *tableView;

@end

@implementation LookWaysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏返回键
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backAct)];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    
    //实例化查询类
    //AVQuery *query = [AVQuery queryWithClassName:@"_File"];
    
    //设计查询条件
    
    //执行查询
    
    //[query getObjectInBackgroundWithId:@"5c092037303f39005f56175c" block:^(AVObject *object, NSError *error) {
      //  NSLog(@"设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件设计查询条件");
        //NSLog(@"->%@",object);
    //}];
    
  
    
    
    //获取表视图所有数据
    NSURL *url = [NSURL URLWithString:@"http://www.studynumber.com/wordskill/json/ways.json"];
    //NSURL *url = [NSURL URLWithString:@"http://lc-rewx3m7r.cn-n1.lcfile.com/04db5a501ec530945f98.json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    self.listWords = (NSArray *)jsonObj;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 300, screen.size.width, screen.size.height-300) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    //轮播图
    NSMutableArray *imagesArray = [[NSMutableArray alloc]init];
    
    
    //获取图片添加到轮播图图片数组中
    //for (int i = 0; i<1; i++) {
        //self.imageName = [NSString stringWithFormat:@"%d.png",i];
        //UIImage *image = [UIImage imageNamed:self.imageName];
        //image.accessibilityIdentifier = [NSString stringWithFormat:@"http://www.studynumber.com/wordskill/wordshtml/%d.html",i];
        //[imagesArray addObject:image];
    //}

    //从网络获取图片添加到轮播图数组中
    
    
    
    //NSDictionary *dicword = self.listWords[0];
    //NSString *urlstring = dicword[@"imageurl"];
    //NSURL *url2 = [NSURL URLWithString:urlstring];
    //NSData *data = [NSData dataWithContentsOfURL:url2];
    //UIImage *lbimage = [UIImage imageWithData:data];
    //先判断是否为nil，然后才能添加
    //if (lbimage) {
      //  [imagesArray addObject:lbimage];
    //}
    
    ///NSDictionary *dicword1 = self.listWords[1];
    //NSString *urlstring1 = dicword1[@"imageurl"];
    //NSURL *url3 = [NSURL URLWithString:urlstring1];
    //NSData *data1 = [NSData dataWithContentsOfURL:url3];
    //UIImage *lbimage1 = [UIImage imageWithData:data1];
    //if (lbimage1) {
      //  [imagesArray addObject:lbimage1];
    //}
    
    
    //NSDictionary *dicword2 = self.listWords[2];
    //NSString *urlstring2 = dicword2[@"imageurl"];
    //NSURL *url4 = [NSURL URLWithString:urlstring2];
    //NSData *data2 = [NSData dataWithContentsOfURL:url4];
    //UIImage *lbimage2 = [UIImage imageWithData:data2];
    //if (lbimage2) {
      //  [imagesArray addObject:lbimage2];
    //}
    
    //设置图片视图的大小、轮播总时长及对应的图片数组
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen.size.width, 300)];
    //[imageview sd_setImageWithURL:url4 placeholderImage:[UIImage imageNamed:@"4"]];
    //[imageview sd_setImageWithURL:url3 placeholderImage:[UIImage imageNamed:@"4"]];
    [imageview setImage:[UIImage imageNamed:@"lbt1"]];
    imageview.animationDuration = 8;
    imageview.animationImages = imagesArray;
    
    
    //打开用户交互
    imageview.userInteractionEnabled = YES;
    //初始化一个手势，这个手势需要实现的方法在下面
    UIGestureRecognizer *singleTap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)];
    //为轮播图添加手势
    [imageview addGestureRecognizer:singleTap];
    
    [self.view addSubview:imageview];
    [imageview startAnimating];
}


//轮播图点击事件
- (void)clickCategory:(UIGestureRecognizer *)sender{
    //无用，以后调
    DetailViewController *detailViewController = [[DetailViewController alloc]init];
    //NSString *urlstring = event[@"imageurl"];
    NSString *urlstring = @"http://www.studynumber.com/wordskill/wordshtml/darkside.html";
    //NSURL *url = [NSURL URLWithString:urlstring];
    detailViewController.url = urlstring;
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    [self presentViewController:navigationController animated:TRUE completion:nil];
    
}


//navigation返回按钮
- (void)backAct{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -- 实现表视图数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listWords count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowDict = self.listWords[row];
    
    cell.textLabel.text = rowDict[@"name"];
    
    //NSString *imagePath = [[NSString alloc]initWithFormat:@"%@.jpg",rowDict[@"image"]];
    
    //cell.imageView.image = [UIImage imageNamed:imagePath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark -- 选择表视图行时触发
/*
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 if ([segue.identifier isEqualToString:@"CellIdentifier"]) {
 NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
 NSInteger selectedIndex = indexPath.row;
 NSDictionary *dict = self.listTeams[selectedIndex];
 DetailViewController *detailViewController = segue.destinationViewController;
 detailViewController.url = dict[@"url"];
 detailViewController.title = dict[@"name"];
 }
 }
 */




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger selectedIndex = indexPath.row;
    NSDictionary *dict = self.listWords[selectedIndex];
    DetailViewController *detailViewController = [[DetailViewController alloc]init];
    detailViewController.url = dict[@"url"];
    detailViewController.title = dict[@"name"];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    [self presentViewController:navigationController animated:TRUE completion:nil];
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
