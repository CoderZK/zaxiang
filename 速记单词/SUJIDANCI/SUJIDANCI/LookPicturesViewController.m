//
//  LookPicturesViewController.m
//  SUIXINJI
//
//  Created by 董成 on 2018/10/27.
//  Copyright © 2018 董成. All rights reserved.
//

#import "LookPicturesViewController.h"
//引入自定义的collectioncell
#import "CollectionViewCell.h"
//引入点击cell后跳转的视图
#import "DetailViewController.h"
#import "DetailViewController2.h"
#import "UIImageView+WebCache.h"
//定义数字3
#define COL_NUM 3
@interface LookPicturesViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic) NSArray *words;
@property (strong,nonatomic) UICollectionView *collectionView;
@end

@implementation LookPicturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //导航栏返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backAct)];
   
    
    //读取所有数据
    NSURL *url = [NSURL URLWithString:@"http://www.studynumber.com/wordskill/json/words.json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    self.words = (NSArray *)jsonObj;
    
    //设置集合视图，方法实现在下面
    [self setupCollectionView];
}


//导航栏返回按钮实现
- (void)backAct{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//实现集合视图
- (void)setupCollectionView{
    
    //设置集合视图格式布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.sectionInset = UIEdgeInsetsMake(15, 15, 30, 15);
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if (screenSize.height>586) {
        layout.itemSize = CGSizeMake(100, 100);
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 15);
    }
    layout.minimumInteritemSpacing = 2;
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册集合视图cell
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
   
    //让集合视图实现两个协议
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //添加集合视图到视图中
    [self.view addSubview:self.collectionView];
}





//集合视图的数据源协议datasource
//设置节的数量
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    int num = [self.words count] % COL_NUM;
    if (num==0) {
        return [self.words count]/COL_NUM;
    }else{
        return [self.words count]/COL_NUM+1;
    }
}
//设置完节后，再设置每个节中的cell量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return COL_NUM;
}



//设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSInteger idx = indexPath.section * COL_NUM + indexPath.row;
    if (self.words.count <= idx) {
        return cell;
    }
    NSDictionary *event = self.words[idx];
    
    //cell.label.text = [event objectForKey:@"name"];
    
    //从本地获取图片
    //cell.imageView.image = [UIImage imageNamed:event[@"image"]];
    
    //从网络获取图片
    NSString *urlstring = event[@"imageurl"];
    NSURL *url = [NSURL URLWithString:urlstring];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //cell.imageView.image = [UIImage imageWithData:data];
    //[cell.imageView sd_setImageWithURL:url];
    //UIImage *image11 = [[UIImage alloc]initWithContentsOfFile:@"4"];
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
    
    
    //返回cell
    return cell;
}






//集合视图的委托协议delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dicword = self.words[indexPath.section * COL_NUM + indexPath.row];
    //新建点击cell后的视图并设置其属性
    //DetailViewController *detailViewController = [[DetailViewController alloc]init];
    //detailViewController.url = dicword[@"url"];
    //detailViewController.title = dicword[@"name"];
    //将这个视图放在导航视图中
    //UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    DetailViewController2 *detailViewController2 = [[DetailViewController2 alloc]init];
    detailViewController2.title = dicword[@"name"];
    detailViewController2.rowdict = dicword;
    //push到指定的视图
    //[self.navigationController pushViewController:detailViewController animated:YES];
    [self.navigationController pushViewController:detailViewController2 animated:YES];
    //这个就是设置点击cell之后跳转到navigationController视图
    //[self presentViewController:navigationController animated:TRUE completion:nil];
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
