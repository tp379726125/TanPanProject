//
//  TPPictureCollectionViewCell.m
//  TanPanProject
//
//  Created by wangan on 2017/11/1.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "TPPictureCollectionViewCell.h"

@interface TPPictureCollectionViewCell()

@property (nonatomic,strong)UIImageView     *imgView;

@property (nonatomic,strong)UILabel         *label;
@end

@implementation TPPictureCollectionViewCell

- (void)setName:(NSString *)name
{
    _name = name;
    self.label.text = name;
    
}

- (UILabel *)label
{
    if (!_label) {
        _label = [UILabel new];
        [self.contentView addSubview:_label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo( 100);
            make.top.mas_equalTo(30);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(20);
        }];
    }
    return _label;
}

@end
