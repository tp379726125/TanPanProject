//
//  UIButton+TPButtonCategory.m
//  TanPanProject
//
//  Created by wangan on 2017/10/25.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "UIButton+TPButtonCategory.h"
#import <objc/runtime.h>

@implementation UIButton (TPButtonCategory)

static char *const touchBlockKey = "touchBlockKey";
- (buttonPressedTouchBlock)touchBlock
{
    return objc_getAssociatedObject(self, &touchBlockKey);
}

- (void)setTouchBlock:(buttonPressedTouchBlock)touchBlock
{
    objc_setAssociatedObject(self, &touchBlockKey, touchBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonPressed:(UIButton *)sender
{
    self.touchBlock ? self.touchBlock(sender) : nil;
}


@end
