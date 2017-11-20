//
//  ViewController.m
//  TanPanProject
//
//  Created by wangan on 2017/10/25.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "TPTableView.h"
#import "TPView.h"
#import "TPPictureByView.h"
#import "TPToolBar.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)TPTableView         *tableView;
@property (nonatomic,strong)TPPictureByView     *pictureByView;
@property (nonatomic,strong)TPToolBar           *tpToolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
//    view.backgroundColor = [UIColor grayColor];
//    [view showBoderInPosition:InPositionAll andStrokeColor:[UIColor redColor] andLineStyle:0];
//    [self.view addSubview:view];
//    
//    
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 40)];
//    button.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:button];
//    [button setTitle:@"你好" forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"主页-2"] forState:UIControlStateNormal];
//    [button layoutButtonWithEdgeInsetsStyle:TPButtonEdgeInsetsStyleRight imageTitleSpace:5];
//    button.touchBlock = ^(UIButton *sender){
//        NSLog(@"1");
//    };

    
    
    
    
//    [self.view addSubview:self.tableView];
//    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.top.bottom.mas_equalTo(0);
//        
//    }];
//    
//    self.tableView.headerRefreshBlock = ^(TPTableView *tableView){
//        
//        [tableView headerEndRefresh];
//    };
//    
//    self.tableView.footerRefreshBlock = ^(TPTableView *tableView){
//        
//        [tableView footerEndRefresh];
//    };
    
    
    

    TPView *view = [[TPView alloc]init];//WithFrame:CGRectMake(10, 30, self.view.frame.size.width - 20, 40)]
    [self.view addSubview:view];

    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(10);
        make.trailing.mas_equalTo(-10);
        make.top.mas_equalTo(30);
        make.height.mas_equalTo(40);
    }];
    [view showBoderInPosition:InPositionAll andStrokeColor:[UIColor grayColor] andLineStyle:1];
    // 先调用superView的layoutIfNeeded方法再获取frame
    LayoutIfNeeded
    
//    view.textField.text = @"哈哈哈";
//    
//    view.pressedBlock = ^(UIButton *sender){
//        NSLog(@"1");
//    };

 
    
    
    
//    UITextField *text = [UITextField new];
//    [self.view addSubview:text];
//    [text mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.leading.mas_equalTo(10);
//                make.trailing.mas_equalTo(-10);
//                make.top.mas_equalTo(30);
//                make.height.mas_equalTo(40);
//    }];
//    text.backgroundColor = [UIColor grayColor];
//    text.inputAccessoryView = self.tpToolBar;
//
//    self.tpToolBar.sureButtonTouchBlock = ^(UIButton *sender)
//    {
//        [text resignFirstResponder];
//        NSLog(@"1  %@",sender.titleLabel.text);
//    };
    
   
    
}


#pragma mark - UITableViewDataSource<NSObject>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}


#pragma mark - 懒加载
- (TPTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[TPTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UITableView new];
        _tableView.refreshType = TPRefreshPullUp;
    }
    return _tableView;
}

- (TPPictureByView *)pictureByView
{
    if (!_pictureByView) {
        _pictureByView = [TPPictureByView new];
    }
    return _pictureByView;
}

- (TPToolBar *)tpToolBar
{
    if (!_tpToolBar) {
        _tpToolBar = [[TPToolBar alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 40)];
    }
    return _tpToolBar;
}


@end
