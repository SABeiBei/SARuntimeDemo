//
//  NSDateFormatter+singleton.m
//  SARuntimeDemo
//
//  Created by Andy on 15/8/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "NSDateFormatter+singleton.h"
#import <objc/runtime.h>

@implementation NSDateFormatter (singleton)

+(instancetype)shareInstance {
    
    static NSDateFormatter *shareInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance = [[NSDateFormatter alloc] init];
    });
    return shareInstance;
}

-(void)overrideSetDataFormat:(NSString *)dateFormat {
    
    // 交换方法
    Method setDataFormat = class_getInstanceMethod([NSDateFormatter class], @selector(setDateFormat:));
    Method overrideSetDataFormat = class_getInstanceMethod([NSDateFormatter class], @selector(overrideSetDataFormat:));
    method_exchangeImplementations(setDataFormat, overrideSetDataFormat);
    NSLog(@"又交换回来");
    
    
}

-(void)setDateFormat:(NSString *)dateFormat {
    
    @synchronized (self) {
        // 交换方法
        Method setDataFormat = class_getInstanceMethod([NSDateFormatter class], @selector(setDateFormat:));
        Method overrideSetDataFormat = class_getInstanceMethod([NSDateFormatter class], @selector(overrideSetDataFormat:));
        method_exchangeImplementations(setDataFormat, overrideSetDataFormat);
        NSLog(@"交换了方法");
        
        // 进行赋值
        self.dateFormat = dateFormat;
    }
    
    
}

@end
