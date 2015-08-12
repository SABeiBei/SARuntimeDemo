//
//  NSDateFormatter+singleton.h
//  SARuntimeDemo
//
//  Created by Andy on 15/8/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (singleton)


+ (instancetype)shareInstance;

/**
 *  重写setDataFormat的方法
 *  用于和原生的方法交换
 */
- (void)overrideSetDataFormat:(NSString *)dateFormat;

@end
