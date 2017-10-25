//
//  UIButton+TPButtonCategory.h
//  TanPanProject
//
//  Created by wangan on 2017/10/25.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonPressedTouchBlock)(UIButton *sender);

@interface UIButton (TPButtonCategory)

//button的点击事件
@property (nonatomic,copy)buttonPressedTouchBlock touchBlock;
@end
