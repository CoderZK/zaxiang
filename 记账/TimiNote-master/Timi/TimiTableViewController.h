//
//  TimiTableViewController.h
//  Timi
//
//  Created by zk on 2018/10/23.
//  Copyright © 2018年 张坤. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TimiTableViewController<ItemCompleteDelegate> : UITableViewController


@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;



@end
