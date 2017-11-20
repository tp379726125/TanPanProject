//
//  TPView.m
//  TanPanProject
//
//  Created by wangan on 2017/10/27.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "TPView.h"
@interface TPView()

@property (nonatomic,strong)UIButton *button;

@end
@implementation TPView

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
        [self awakeFromNib];
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _textField = [UITextField new];
    _textField.placeholder = @"当前";
    [self addSubview:_textField];
    
    _button = [UIButton new];
    [self addSubview:_button];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.leading.mas_equalTo(10);
        make.trailing.mas_equalTo(-10);
        make.bottom.mas_offset(0);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.trailing.mas_equalTo(0);
    }];
    
    WeakSelf
    _button.touchBlock = ^(UIButton *sender){
        weakSelf.pressedBlock ? weakSelf.pressedBlock(sender) : nil;
    };
}

 




@end
