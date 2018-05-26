//
//  UIButton+Border.h
//  LSAlertController
//
//  Created by 周结论 on 2018/5/25.
//  Copyright © 2018年 周结论. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Border)
-(void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;  
@end
