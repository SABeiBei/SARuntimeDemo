//
//  ViewController.m
//  SARuntimeDemo
//
//  Created by Andy on 15/8/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "ViewController.h"
#import "NSDateFormatter+singleton.h"
#import <Foundation/NSDateFormatter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (int i = 0; i < 100; i++) {
        //[self performSelector:@selector(setupDataFormatter)];
        [NSThread detachNewThreadSelector:@selector(setupDataFormatter) toTarget:self withObject:nil];
    }
    
}

- (void)setupDataFormatter {
    
    NSLog(@"%@",[NSThread currentThread]);
    NSDateFormatter *formatter = [NSDateFormatter shareInstance];
    [formatter setDateFormat:@"yyyy-MM-dd"];
}

@end
