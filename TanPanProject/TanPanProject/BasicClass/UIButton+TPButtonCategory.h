//
//  UIButton+TPButtonCategory.h
//  TanPanProject
//
//  Created by wangan on 2017/10/25.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonPressedTouchBlock)(UIButton *sender);

typedef NS_ENUM(NSInteger,TPButtonEdgeInsetsStyle) {
    TPButtonEdgeInsetsStyleTop, // image在上，label在下
    TPButtonEdgeInsetsStyleLeft, // image在左，label在右
    TPButtonEdgeInsetsStyleBottom, // image在下，label在上
    TPButtonEdgeInsetsStyleRight // image在右，label在左
};


@interface UIButton (TPButtonCategory)

//button的点击事件
@property (nonatomic,copy)buttonPressedTouchBlock touchBlock;

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(TPButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;



@end
