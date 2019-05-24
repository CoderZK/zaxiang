//
//  NicknameAlertView.h
//  JSNotepadProject
//
//  Created by 刘成 on 2018/11/15.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NicknameAlertView : UIView<UITextFieldDelegate>

typedef void(^getPayPasswordBack)(NSString * password,UIColor * color);

typedef void(^cancelBlock)();

@property (nonatomic, strong)cancelBlock cancelBlock;

@property (nonatomic, strong) UIColor * color;

@property (nonatomic, strong)getPayPasswordBack passwordBlock;

@property (nonatomic, assign) NSInteger indexCount;

@property (nonatomic, assign) BOOL isEditor;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *canlelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *svrollView;


+ (NicknameAlertView *)loadViewFromXib;

-(void)getCodeBasedInput:(getPayPasswordBack)passwordBlock cancelBlock:(cancelBlock)cancelBlock;


@end

NS_ASSUME_NONNULL_END
