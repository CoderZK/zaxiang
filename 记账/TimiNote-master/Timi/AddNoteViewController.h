//
//  AddNoteViewController.h
//  Timi
//
//  Created by zk on 2018/10/23.
//  Copyright © 2018年 张坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimiDelegate.h"
#import "KeyboardView.h"
#import "AppDelegate.h"



@interface AddNoteViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, ItemCompleteDelegate>

@property (nonatomic, weak) id<ItemCompleteDelegate> delegate;
@property (nonatomic, strong) KeyboardView *keyboardView;

@end
