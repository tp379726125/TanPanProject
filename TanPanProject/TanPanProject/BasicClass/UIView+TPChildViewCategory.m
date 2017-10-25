//
//  UIView+TPChildViewCategory.m
//  TanPanProject
//
//  Created by wangan on 2017/10/25.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "UIView+TPChildViewCategory.h"

@implementation UIView (TPChildViewCategory)

/**
 给view边框描边
 
 @param linPosition 选择那一边描边
 @param color 颜色
 @param lineStyle 边线是否实现、虚线
 */
- (void)showBoderInPosition:(lineInPosition)linPosition andStrokeColor:(UIColor *)color andLineStyle:(lineStyle)lineStyle
{
    self.layer.masksToBounds = YES;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    layer.lineWidth = 1.0;
    layer.strokeColor = color.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *currenPath = [UIBezierPath bezierPathWithRoundedRect:CGRectZero cornerRadius:30];
    
    if (linPosition & InPositionAll) { //所有
        // 设置起点
        [currenPath moveToPoint:CGPointMake(0, 0)];
        //把点加入到路径里面
        [currenPath addLineToPoint:CGPointMake(0, self.frame.size.height)];
        [currenPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [currenPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
        [currenPath addLineToPoint:CGPointMake(0, 0)];
    }
    
    if (linPosition & InPositionLeft) //左边
    {
        // 设置起点
        [currenPath moveToPoint:CGPointMake(0, 0)];
        [currenPath addLineToPoint:CGPointMake(0, self.frame.size.height)];
        
    }
    if (linPosition & InPositionTop) //上边
    {
        // 设置起点
        [currenPath moveToPoint:CGPointMake(0, 0)];
        //把点加入到路径里面
        [currenPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    }
    if (linPosition & InPositionBottom) //下面
    {
        // 设置起点
        [currenPath moveToPoint:CGPointMake(0, self.frame.size.height)];
        //把点加入到路径里面
        [currenPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    }
    if (linPosition & InPositionRight) //右边
    {
        // 设置起点
        [currenPath moveToPoint:CGPointMake(self.frame.size.width, 0)];
        //把点加入到路径里面
        [currenPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    }
    
    if (lineStyle & dottedLine) //虚线
    {
        //  设置线宽，线间距
        [layer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:5], [NSNumber numberWithInt:2], nil]];
        
    }
    
    layer.path = currenPath.CGPath;
    UIGraphicsBeginImageContext(self.bounds.size);
    [currenPath stroke];
    UIGraphicsEndImageContext();
    
    [self.layer addSublayer:layer];
    

}

@end
