//
//  TPTableView.m
//  TanPanProject
//
//  Created by wangan on 2017/10/26.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "TPTableView.h"

@implementation TPTableView

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
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

- (void)setRefreshType:(TPRefreshType)refreshType
{
    WeakSelf
    if (refreshType & TPRefreshPullUp) { //上拉
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weakSelf.footerRefreshBlock ? weakSelf.footerRefreshBlock(weakSelf) : nil;
        }];
    }
    
    if (refreshType & TPRefreshPullTo) { //下拉
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakSelf.headerRefreshBlock ? weakSelf.headerRefreshBlock(weakSelf) : nil;
        }];
    }
    
}


- (void)headerEndRefresh
{
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }
}

- (void)footerEndRefresh
{
    if (self.mj_footer.isRefreshing) {
        [self.mj_footer endRefreshing];
    }
}




@end
