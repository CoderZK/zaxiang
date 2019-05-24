//
//  NicknameAlertView.m
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/15.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "NicknameAlertView.h"

@implementation NicknameAlertView


- (void)awakeFromNib{
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 13;
    self.bgView.layer.masksToBounds = YES;
    self.textField.delegate = self;
    [self.textField becomeFirstResponder];
    self.isEditor = NO;
}

+ (NicknameAlertView *)loadViewFromXib{
    NicknameAlertView *view = [[NSBundle mainBundle] loadNibNamed:@"NicknameAlertView" owner:self options:nil].lastObject;
    return view;
}


-(void)getCodeBasedInput:(getPayPasswordBack)passwordBlock cancelBlock:(cancelBlock)cancelBlock{
    self.indexCount = 700;
    NSArray * array = @[SMColorFromRGB(0x8AA4AF),SMColorFromRGB(0x958DC1),SMColorFromRGB(0x9EABD2),SMColorFromRGB(0x9EAB82),SMColorFromRGB(0x23878E),SMColorFromRGB(0x23D48E),SMColorFromRGB(0x23128E),SMColorFromRGB(0xA7128E),SMColorFromRGB(0xF4D9B3),SMColorFromRGB(0x56B984),SMColorFromRGB(0x808080),SMColorFromRGB(0x030303)];
    self.svrollView.contentSize = CGSizeMake(45*array.count, 48);
    for (NSInteger i=0; i<array.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(45*i, 4, 40, 40);
        btn.backgroundColor = array[i];
        btn.tag = 600 +i;
        [btn addTarget:self action:@selector(selectedColor:) forControlEvents:UIControlEventTouchUpInside];
        [self.svrollView addSubview:btn];
        
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"mm_ll_os_success"];
        imageView.hidden = YES;
        UIColor * indexColor = array[i];
        if (CGColorEqualToColor(self.color.CGColor, indexColor.CGColor)){
            imageView.hidden = NO;
            self.isEditor = YES;
            self.indexCount = 700 + i;
        }
        imageView.tag = 700+i;
        [self.svrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(btn);
            make.width.mas_offset(15);
            make.height.mas_offset(15);
        }];
    }
    
    _passwordBlock = passwordBlock;
    _cancelBlock = cancelBlock;
}

-(void)selectedColor:(UIButton*)sender{
    if (self.indexCount != sender.tag+100) {
        UIImageView * imageView = [self.bgView viewWithTag:self.indexCount];
        imageView.hidden = YES;
        UIImageView * imageView1 = [self.bgView viewWithTag:sender.tag+100];
        imageView1.hidden = NO;
        self.indexCount = sender.tag+100;
        self.color = sender.backgroundColor;
    }else{
        UIImageView * imageView = [self.bgView viewWithTag:self.indexCount];
        if (imageView.isHidden) {
            imageView.hidden = NO;
            self.color = sender.backgroundColor;
        } else {
            imageView.hidden = YES;
            self.color = SMColorFromRGB(0xC5C2C2);
        }
    }
}

- (IBAction)cancelViewBtn:(UIButton *)sender {
    [UIView animateWithDuration:.25 animations:^{
        self.bgView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 500);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

- (IBAction)sureSubmitBtn:(UIButton *)sender {
    if (self.textField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"分类名称不能为空！"];
        return;
    }
    NSMutableArray * array = [JSUserInfo shareManager].classArray;
    for (JSClassModel * model in array) {
        if ([self.textField.text isEqualToString:model.class_name]&&!self.isEditor) {
            [SVProgressHUD showInfoWithStatus:@"类名不能一样"];
            return;
        }
    }
    [UIView animateWithDuration:.25 animations:^{
        self.bgView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 640);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    if (self.passwordBlock) {
        if (self.color == nil) {
            self.color = SMColorFromRGB(0xC5C2C2);
        }
        self.passwordBlock(self.textField.text,self.color);
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length>=8) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        return NO;
    }
    return YES;
}

@end
