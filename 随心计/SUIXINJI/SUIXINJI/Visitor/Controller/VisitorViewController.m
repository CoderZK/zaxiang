//
//  VisitorViewController.m
//  SUIXINJI
//
//  Created by 刘成 on 2018/11/27.
//  Copyright © 2018 锋子. All rights reserved.
//
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#import "VisitorViewController.h"
#import "LTSCalendarManager.h"

@interface VisitorViewController ()<LTSCalendarEventSource>
{
    NSMutableDictionary *eventsByDate;
}

@property (nonatomic,strong)LTSCalendarManager *manager;

@end

@implementation VisitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SMColorFromRGB(0xF0F4F7);
    [self lts_InitUI];
}

- (void)lts_InitUI{
    self.manager = [LTSCalendarManager new];
    self.manager.eventSource = self;
    self.manager.weekDayView = [[LTSCalendarWeekDayView alloc]initWithFrame:CGRectMake(0, 15, ScreenWidth, 30)];
    [LTSCalendarAppearance share].weekDayBgColor = SMColorFromRGB(0xF0F4F7);
    [LTSCalendarAppearance share].calendarBgColor = SMColorFromRGB(0xF0F4F7);
    [self.manager showSingleWeek];
    [self.view addSubview:self.manager.weekDayView];
    
    self.manager.calenderScrollView = [[LTSCalendarScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.manager.weekDayView.frame), ScreenWidth, ScreenHeight-CGRectGetMaxY(self.manager.weekDayView.frame))];
    self.manager.calenderScrollView.calendarViewController = self;
    [self cusotmDataSource];
    
    [self.view addSubview:self.manager.calenderScrollView];
    [self createRandomEvents];
    self.automaticallyAdjustsScrollViewInsets = false;
    @weakify(self);
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"CalenRefreshDiaryClassNotication" object:nil]takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self cusotmDataSource];
    }];
}

-(void)cusotmDataSource{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy.MM.dd";
    }
    NSMutableArray * arr = [NSMutableArray array];
    NSString *key1 = [dateFormatter stringFromDate:[NSDate date]];
    NSMutableArray * array = [JSUserInfo shareManager].allArray;
    if (array.count>0) {
        for (JSFastLoginModel * model in array) {
            NSString * str = [NSString stringWithFormat:@"%@.%@",model.class_year,model.class_day];
            if ([key1 isEqualToString:str]) {
                [arr addObject:model];
            }
        }
    }
    self.manager.calenderScrollView.dataArr = arr;
    [self.manager.calenderScrollView.tableView reloadData];
}


#pragma mark - JTCalendarDataSource
// 该日期是否有事件
- (BOOL)calendarHaveEventWithDate:(NSDate *)date {
    
    NSString *key = [[self dateFormatter] stringFromDate:date];
    
    if(eventsByDate[key] && [eventsByDate[key] count] > 0){
        return YES;
    }
    return NO;
}
//当前 选中的日期  执行的方法
- (void)calendarDidSelectedDate:(NSDate *)date {
    
    NSString *key = [[self dateFormatter] stringFromDate:date];
    NSArray *events = eventsByDate[key];
    self.navigationItem.title = key;
    NSLog(@"%@",date);
    NSMutableArray * arr = [NSMutableArray array];
    //    if (events.count>0) {
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy.MM.dd";
    }
    NSString *key1 = [dateFormatter stringFromDate:date];
    NSMutableArray * array = [JSUserInfo shareManager].allArray;
    if (array.count>0) {
        for (JSFastLoginModel * model in array) {
            NSString * str = [NSString stringWithFormat:@"%@.%@",model.class_year,model.class_day];
            if ([key1 isEqualToString:str]) {
                [arr addObject:model];
            }
        }
    }
    //    }
    self.manager.calenderScrollView.dataArr = arr;
    //该日期有事件    tableView 加载数据
    [self.manager.calenderScrollView.tableView reloadData];
}



- (void)createRandomEvents
{
    eventsByDate = [NSMutableDictionary new];
    
    for(int i = 0; i < 30; ++i){
        // Generate 30 random dates between now and 60 days later
        NSDate *randomDate = [NSDate dateWithTimeInterval:(rand() % (3600 * 24 * 60)) sinceDate:[NSDate date]];
        
        // Use the date as key for eventsByDate
        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
        if(!eventsByDate[key]){
            eventsByDate[key] = [NSMutableArray new];
        }
        
        [eventsByDate[key] addObject:randomDate];
    }
    [self.manager reloadAppearanceAndData];
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy.MM.dd";
    }
    
    return dateFormatter;
}

@end
