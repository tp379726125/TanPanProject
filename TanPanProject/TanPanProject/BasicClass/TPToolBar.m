//
//  TPToolBar.m
//  TanPanProject
//
//  Created by wangan on 2017/11/2.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "TPToolBar.h"

@interface TPToolBar()

@property (nonatomic,strong)UIButton *cancelButton;

@property (nonatomic,strong)UIButton *sureButton;

@end

@implementation TPToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeUserInterface];
    }
    return self;
}

- (void)initializeUserInterface
{
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithCustomView:self.cancelButton];
    UIBarButtonItem *sureButton = [[UIBarButtonItem alloc]initWithCustomView:self.sureButton];
    UIBarButtonItem *one = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:Nil];
    [self setItems:@[cancelButton,one,sureButton] animated:YES];
    
    self.sureButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    
    WeakSelf
    self.sureButton .touchBlock = ^(UIButton *sender){
        weakSelf.sureButtonTouchBlock ? weakSelf.sureButtonTouchBlock(sender) :nil;
    };
    
    self.cancelButton .touchBlock = ^(UIButton *sender){
        weakSelf.cancelButtonTouchBlock ? weakSelf.cancelButtonTouchBlock(sender) :nil;
    };
}

#pragma mark - 懒加载
-(UIButton *)sureButton
{
    if (!_sureButton) {
        _sureButton = [[UIButton alloc]initWithFrame:CGRectMake(Screen_Width - 50, 0, 50, 40)];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _sureButton;
}

-(UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _cancelButton;
}

@end
