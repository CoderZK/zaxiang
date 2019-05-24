//
//  DetailViewController3.m
//  SUIXINJI
//
//  Created by 董成 on 2018/12/6.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DetailViewController3.h"
#import <AVOSCloud/AVOSCloud.h>

@interface DetailViewController3 ()<UITextViewDelegate>

@property(strong,nonatomic) UITextView *t1;
@property(strong,nonatomic) UILabel *l1;

@end

@implementation DetailViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"jifa"];
    [self.view insertSubview:imageView atIndex:0];
    
    //添加导航条返回键
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backAct)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:(UIBarButtonItemStyleDone) target:self action:@selector(buttondi)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置屏幕大小
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    //设置UItextfield
    self.t1 = [[UITextView alloc]initWithFrame:CGRectMake(0, 65, screen.size.width, screen.size.height-300)];
    self.t1.backgroundColor = [UIColor whiteColor];
    [self.t1 scrollRangeToVisible:NSMakeRange(self.t1.text.length,1)];
    
    self.t1.layer.borderColor = [[UIColor redColor]CGColor];
    self.t1.layer.borderWidth = 3.0;
    [self.t1.layer setMasksToBounds:YES];
    

    //t1.borderStyle = UITextBorderStyleLine;
    //t1.placeholder = @"请输入您的单词记法并提交，您的记法被采纳后，我们会及时与您联系";
    self.t1.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:self.t1];
    
    
    
    
    
    
    //设置提交按钮
    //UIButton *b1 = [[UIButton alloc]initWithFrame:CGRectMake((screen.size.width-120)/2,screen.size.height-100, 120, 40)];
    //b1.backgroundColor = [UIColor redColor];
    //[b1 setTitle:@"<<提交记法>>" forState:UIControlStateNormal];
    //[b1 addTarget:self action:@selector(buttondi) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:b1];
    
    
    
}


//提交动作
-(void)buttondi{
    
    //1.采集用户输入的数据
    NSString *content = self.t1.text;
    
    //2.存储到云端
    AVObject *todoFolder = [[AVObject alloc] initWithClassName:@"JIFA"];// 构建对象
    [todoFolder setObject:content forKey:@"content"];// 设置名称
    [todoFolder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"成功");
        }else{
            NSLog(@"%@",error);
        }
    }];// 保存到云端
    
    
    //提交成功框
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"单词追杀令" message:@"恭喜您已提交成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"已提交成功");
    }];
    [alertController addAction:yesAction];
    
    [self presentViewController:alertController animated:true completion:nil];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}










- (void)backAct{
    [self dismissViewControllerAnimated:YES completion:nil];
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
