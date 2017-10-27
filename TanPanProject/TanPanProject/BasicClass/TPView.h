//
//  TPView.h
//  TanPanProject
//
//  Created by wangan on 2017/10/27.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^buttonPressedBlock)(UIButton *sender);

@interface TPView : UIView

@property (nonatomic,strong,readonly)UITextField *textField;
@property (nonatomic,strong,readonly)UIImageView *imgView;

@property (nonatomic,copy)buttonPressedBlock     pressedBlock;


@end
