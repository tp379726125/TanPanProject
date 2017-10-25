//
//  ViewController.m
//  TanPanProject
//
//  Created by wangan on 2017/10/25.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    view.backgroundColor = [UIColor grayColor];
    [view showBoderInPosition:InPositionAll andStrokeColor:[UIColor redColor] andLineStyle:0];
    [self.view addSubview:view];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 40)];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
    
    button.touchBlock = ^(UIButton *sender){
        NSLog(@"1");
    };
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
