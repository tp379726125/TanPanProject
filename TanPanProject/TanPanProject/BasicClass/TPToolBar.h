//
//  TPToolBar.h
//  TanPanProject
//
//  Created by wangan on 2017/11/2.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^sureButtonTouchBlock)(UIButton *sender);
typedef void(^cancelButtonTouchBlock)(UIButton *sender);

@interface TPToolBar : UIToolbar

@property (nonatomic,copy)sureButtonTouchBlock    sureButtonTouchBlock;

@property (nonatomic,copy)cancelButtonTouchBlock  cancelButtonTouchBlock;
@end
