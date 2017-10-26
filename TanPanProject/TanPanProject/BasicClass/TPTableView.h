//
//  TPTableView.h
//  TanPanProject
//
//  Created by wangan on 2017/10/26.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TPRefreshType)
{
    TPRefreshNone = 0,      //不刷新
    TPRefreshPullUp,        //上拉刷新
    TPRefreshPullTo,        //下拉刷新
    TPRefreshPullNormal = TPRefreshPullUp | TPRefreshPullTo      //上下刷新
};

@class TPTableView;
typedef void (^TPTableviewRefreshBlock)(TPTableView *tableView);

@interface TPTableView : UITableView

//刷新block；
@property (copy, nonatomic) TPTableviewRefreshBlock    headerRefreshBlock;
@property (copy, nonatomic) TPTableviewRefreshBlock    footerRefreshBlock;

//是否刷新
@property (assign, nonatomic) TPRefreshType            refreshType;


- (void)headerEndRefresh;
- (void)footerEndRefresh;

@end
