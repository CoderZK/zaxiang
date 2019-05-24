//
//  JSRootTabBarViewController.m
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/12.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "JSRootTabBarViewController.h"
#import "DiaryViewController.h"
#import "VisitorViewController.h"
#import "MineViewController.h"

@interface JSRootTabBarViewController ()<UITabBarControllerDelegate>

@property(strong,nonatomic) DiaryViewController * diaryViewControl;

@property(strong,nonatomic) VisitorViewController * visitorViewControl;

@property(strong,nonatomic) MineViewController * mineViewControl;

@end

@implementation JSRootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = SMColorFromRGB(0x787DB1);
    //全局tab属性配置
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"" size:12]} forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"" size:12]} forState:UIControlStateSelected];
    [self prepareSubViews];
    self.delegate = self;
}

+(instancetype)shareInstance
{
    static JSRootTabBarViewController* rootTabbar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rootTabbar = [JSRootTabBarViewController new];
    });
    return rootTabbar;
}


#pragma mark - Delegate & DataSource
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if([item.title isEqualToString:@""]){
        
    }
    
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //拦截记账
//    if([tabBarController.viewControllers indexOfObject:viewController] == 2){
//        if([self.viewControllers indexOfObject:self.selectedViewController] != 2){
//            HomeViewController * homeViewControl = [HomeViewController new];
//            homeViewControl.hidesBottomBarWhenPushed = YES;
//            [((UINavigationController*)tabBarController.selectedViewController).topViewController presentViewController:[[UINavigationController alloc]initWithRootViewController:homeViewControl] animated:YES completion:nil];
//        }
//        return NO;
//    }
    return YES;
}
    
#pragma mark - 初始化子视图
    -(void)prepareSubViews
    {
    [self rootMainSubViews];
}

-(void)rootMainSubViews
{

    UINavigationController* booksNav = [[UINavigationController alloc]initWithRootViewController:self.diaryViewControl];
 
    UINavigationController* chartNav = [[UINavigationController alloc]initWithRootViewController:self.visitorViewControl];

    UINavigationController* mineNav = [[UINavigationController alloc]initWithRootViewController:self.mineViewControl];
    
    self.viewControllers = @[booksNav,chartNav,mineNav];
}
#pragma mark - getter & setter

-(DiaryViewController *)diaryViewControl
{
    if(_diaryViewControl==nil){
        _diaryViewControl = [DiaryViewController new];
        _diaryViewControl.tabBarItem.title = @"日记";
        _diaryViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"日记选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _diaryViewControl.tabBarItem.image = [[UIImage imageNamed:@"日记未选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _diaryViewControl;
}

-(VisitorViewController *)visitorViewControl
{
    if(_visitorViewControl==nil){
        _visitorViewControl = [VisitorViewController new];
        _visitorViewControl.tabBarItem.title = @"日历";
        _visitorViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"日历选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _visitorViewControl.tabBarItem.image = [[UIImage imageNamed:@"未选中日历"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _visitorViewControl;
}

-(MineViewController*)mineViewControl
{
    if(_mineViewControl==nil){
        _mineViewControl = [MineViewController new];
        _mineViewControl.tabBarItem.title = @"我的";
        _mineViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _mineViewControl.tabBarItem.image = [[UIImage imageNamed:@"未选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _mineViewControl;
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
