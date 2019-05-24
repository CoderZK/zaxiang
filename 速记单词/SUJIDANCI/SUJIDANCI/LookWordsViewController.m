//
//  LookWordsViewController.m
//  SUIXINJI
//
//  Created by 董成 on 2018/10/27.
//  Copyright © 2018 董成. All rights reserved.
//

#import "LookWordsViewController.h"
#import "DetailViewController.h"
#import "DetailViewController2.h"
#import "LookPicturesViewController.h"

//在这里定义cell名字
#define CellIdentifier @"CellIdentifier"
@interface LookWordsViewController ()<UISearchBarDelegate,UISearchResultsUpdating>
@property (strong,nonatomic) NSArray *listWords;
@property (strong,nonatomic) NSMutableArray *listWords2;
@property (strong,nonatomic) UISearchController *searchController;
@property (strong,nonatomic) UITableView *tableView;

//内容过滤方法
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSInteger)scope;
@end

@implementation LookWordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backAct)];
    
    //实例化表视图
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    
    
    //获取全部数据1
    NSURL *url = [NSURL URLWithString:@"http://www.studynumber.com/wordskill/json/words.json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    self.listWords = (NSArray *)jsonObj;
    //获取全部数据2
    //NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
    //self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
    //查询所有数据
    [self filterContentForSearchText:@"" scope:-1];
    
    //实例化UISearchController
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    //设置self为更新搜索结果对象
    self.searchController.searchResultsUpdater = self;
    //在搜索时设置背景为灰色
    self.searchController.dimsBackgroundDuringPresentation = false;
    //设置searchBar的委托对象
    self.searchController.searchBar.delegate = self;
    //将搜索栏放在表视图的表头中
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
}

//返回键
- (void)backAct{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//实现内容过滤方法，这是实现搜索框的方法
-(void)filterContentForSearchText:(NSString *)searchText scope:(NSInteger)scope{
    if ([searchText length]==0) {
        self.listWords2 = [NSMutableArray arrayWithArray:self.listWords];
        return;
    }
    NSPredicate *scopePredicate;
    NSArray *tempArray;
    switch (scope) {
        case 0:
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
            tempArray = [self.listWords filteredArrayUsingPredicate:scopePredicate];
            self.listWords2 = [NSMutableArray arrayWithArray:tempArray];
            break;
        case 1:
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
            tempArray = [self.listWords filteredArrayUsingPredicate:scopePredicate];
            self.listWords2 = [NSMutableArray arrayWithArray:tempArray];
            break;
        default:
            self.listWords2 = [NSMutableArray arrayWithArray:self.listWords];
            break;
    }
}




#pragma mark -- 实现UISearchBarDelegate协议方法
-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    [self updateSearchResultsForSearchController:self.searchController];
}

#pragma mark -- 实现UISearchResultsUpdating协议方法
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *searchString = searchController.searchBar.text;
    [self filterContentForSearchText:searchString scope:searchController.searchBar.selectedScopeButtonIndex];
    
    [self.tableView reloadData];
}





#pragma mark -- 实现表视图数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //如果搜索框有动作，就用搜索后的列表，否则用原列表。改1。。。这个cell行数
    if (self.searchController.active) {
        return [self.listWords2 count];
    }else{
        return [self.listWords count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //在上面规定完cell行数后，这一步就开始新建cell了
    //通过可重用标识符获得可重用单元格对象
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //判断cell有没有，没有的话调用cell的构造函数新建
    if (cell == nil) {
        //设置cell的类型
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //得到cell的索引
    NSUInteger row = [indexPath row];
    
    
    //通过索引，我们就可以得到cell的标题了，注意搜索框2
    if (self.searchController.active) {
        NSDictionary *rowDict = self.listWords2[row];
        cell.textLabel.text = rowDict[@"name"];
    }else{
        NSDictionary *rowDict = self.listWords[row];
        cell.textLabel.text = rowDict[@"name"];
    }
    
    //NSString *imagePath = [[NSString alloc]initWithFormat:@"%@.jpg",rowDict[@"image"]];
    //cell.imageView.image = [UIImage imageNamed:imagePath];
    //设置cell的配件类型
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark -- 选择表视图行时触发
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //选中的cell在数组中的索引
    NSInteger selectedIndex = indexPath.row;
    //建立一个空的字典，用来存放被选中的数组元素
    NSDictionary *dict = @{};
    
    //如果搜索框有动作，那么就用刷新后的数据，否则用原数据。 改4
    if (self.searchController.active) {
        dict = self.listWords2[selectedIndex];
    }else{
        dict = self.listWords[selectedIndex];
    }
    
    //我们点击cell后会得到对应的字典数据dict，根据这个字典数据去设置下一个视图控制器页
    //在push前，要建立push视图控制器对象，并且设置其属性
    //在搬家前，要建立新家，并且要布置新家
    //DetailViewController *detailViewController = [[DetailViewController alloc]init];
    //detailViewController.url = dict[@"url"];
    //detailViewController.title = dict[@"name"];
    DetailViewController2 *detailViewController2 = [[DetailViewController2 alloc]init];
    detailViewController2.title = dict[@"name"];
    detailViewController2.rowdict = dict;
    //push到指定的视图
    //[self.navigationController pushViewController:detailViewController animated:YES];
    [self.navigationController pushViewController:detailViewController2 animated:YES];
    
    
    
    
    //UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
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
