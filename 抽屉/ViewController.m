//
//  ViewController.m
//  抽屉
//
//  Created by 高山峰 on 15/10/24.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "ViewController.h"
#import "DACircularProgressView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DACircularProgressView *view = [[DACircularProgressView alloc]initWithFrame:self.view.bounds];
    view.progress = 1;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
