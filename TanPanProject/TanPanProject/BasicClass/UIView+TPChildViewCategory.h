//
//  UIView+TPChildViewCategory.h
//  TanPanProject
//
//  Created by wangan on 2017/10/25.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger,lineInPosition) { //划线的位置
    InPositionNone = 0,          //无边框
    InPositionTop = 1 << 0,      //上边
    InPositionLeft = 1 << 1,     //左边
    InPositionBottom = 1 << 2,   //下边
    InPositionRight = 1 << 3,     //右边
    InPositionAll = 1 << 4     //所有
} ;

typedef NS_ENUM(NSInteger,lineStyle){ //实线、虚线
    fullLine = 0,
    dottedLine = 1
} ;


@interface UIView (TPChildViewCategory)

/**
 给view边框描边

 @param linPosition 选择那一边描边
 @param color 颜色
 @param lineStyle 边线是否实现、虚线
 */
- (void)showBoderInPosition:(lineInPosition)linPosition andStrokeColor:(UIColor *)color andLineStyle:(lineStyle)lineStyle;


@end
