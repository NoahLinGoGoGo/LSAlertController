//
//  LSAlertController.h
//  LSAlertController
//
//  Created by 周结论 on 2018/5/24.
//  Copyright © 2018年 周结论. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LSAlertControllerStyle) {
    LSAlertControllerStyleActionSheet = 0,
    LSAlertControllerStyleAlert
} NS_ENUM_AVAILABLE_IOS(8_0);



@interface LSAlertAction : NSObject
/** 按钮文字 */
@property (nullable, nonatomic, copy) NSString *title;
/** 按钮文字颜色，默认是UIControlStateNormal */
@property (nullable,nonatomic, strong) UIColor *textColor;
/** 按钮的点击事件 */
@property(nullable, nonatomic, strong) void (^handler)(LSAlertAction * _Nullable action);

+ (instancetype _Nullable )actionWithTitle:(nullable NSString *)title textColor:(nullable UIColor *)textColor handler:(void (^ __nullable)(LSAlertAction * _Nullable action))handler;
- (instancetype _Nullable )initWithTitle:(nullable NSString *)title textColor:(nullable UIColor *)textColor handler:(void (^ __nullable)(LSAlertAction * _Nullable action))handler;
@end




@interface LSAlertController : UIViewController
/** 白色Container的宽度，默认300 */
@property (nonatomic, assign) CGFloat containerW;
/** 顶部标题 */
@property (nullable, nonatomic, copy) NSString *title;
/** 顶部子标题 */
@property (nullable, nonatomic, copy) NSString *message;
/** 样式，模仿苹果的两种样式ActionSheet和Alert供选择 */
@property (nonatomic, assign) LSAlertControllerStyle preferredStyle;

+ (instancetype _Nullable )alertControllerWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message preferredStyle:(LSAlertControllerStyle)preferredStyle;
- (instancetype _Nonnull )initWithTitle:(NSString *_Nonnull)title message:(NSString *_Nonnull)message preferredStyle:(LSAlertControllerStyle)preferredStyle;
- (void)addAction:(LSAlertAction *_Nullable)action;
- (void)addTextFieldWithConfigurationHandler:(void (^ __nullable)(UITextField * _Nonnull textField))configurationHandler;
- (void)show;
@end
