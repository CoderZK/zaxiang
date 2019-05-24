//
//  JSClassModel.m
//  SUIXINJI
//
//  Created by 锋子 on 2018/12/3.
//  Copyright © 2018 锋子. All rights reserved.
//
//全部日记数组
#define ClassUserNameArray @"ClassUserNameArray"
//类别名称
#define Class_name @"Class_name"
//类别颜色
#define Class_color @"Class_color"

#import "JSClassModel.h"
#import <objc/runtime.h>

@implementation JSClassModel

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder{
    Class c = self.class;
    
    while (c && c!=[NSObject class]) {
        unsigned int propertyCount;
        objc_property_t * propertys = class_copyPropertyList([c class], &propertyCount);
        for (int i = 0; i < propertyCount; i++) {
            objc_property_t property = propertys[i];
            const char * propertyName = property_getName(property);
            NSString * name = [NSString stringWithUTF8String:propertyName];
            
            [aCoder encodeObject:[self valueForKey:name] forKey:name];
        }
        free(propertys);
        c = [c superclass];
    }
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        Class c = self.class;
        while (c && c!=[NSObject class]) {
            unsigned int propertyCount;
            objc_property_t * propertys = class_copyPropertyList([c class], &propertyCount);
            for (int i = 0; i < propertyCount; i++) {
                objc_property_t property = propertys[i];
                const char * propertyName = property_getName(property);
                NSString * name = [NSString stringWithUTF8String:propertyName];
                id tmp = [aDecoder decodeObjectForKey:name];
                if (tmp != nil) {
                    [self setValue:[aDecoder decodeObjectForKey:name] forKey:name];
                }
                
                
            }
            free(propertys);
            c = [c superclass];
        }
    }
    return self;
}

#pragma mark - save & queue
//-(id)getUserDefaultByKey:(NSString*)key
//{
//    return [JSLocalStorageKit queryForKey:key localStorageType:JSLocalStorageTypeUserDefault];
//}
//
//-(void)saveUserDefaultByKey:(NSString*)key result:(id)value
//{
//    [JSLocalStorageKit save:value forKey:key localStorageType:JSLocalStorageTypeUserDefault];
//}

#pragma mark - getter & setter




@end
