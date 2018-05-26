//
//  ViewController.m
//  LSAlertController
//
//  Created by 周结论 on 2018/5/24.
//  Copyright © 2018年 周结论. All rights reserved.
//

#import "ViewController.h"
#import "LSAlertController.h"
#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)AlertStyle:(id)sender {
    
    LSAlertController *alertController = [LSAlertController alertControllerWithTitle:@"标题" message:@"信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息" preferredStyle:LSAlertControllerStyleAlert];
    LSAlertAction *okAction = [LSAlertAction actionWithTitle:@"确认" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    [alertController addAction:okAction];
    alertController.containerW = 400;
    [alertController show];
}

- (IBAction)AlertStyleWithTextField:(id)sender {
    
    LSAlertController *alertController = [LSAlertController alertControllerWithTitle:@"标题" message:@"信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息" preferredStyle:LSAlertControllerStyleAlert];
    LSAlertAction *okAction = [LSAlertAction actionWithTitle:@"确认" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    LSAlertAction *cancelAction = [LSAlertAction actionWithTitle:@"取消" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"取消");
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"11111111111";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"222222222";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"3333333333333";
    }];
    [alertController show];
    alertController.containerW = 400;
}

- (IBAction)AlertStyleWithVerticalButtons:(id)sender {
    
    LSAlertController *alertController = [LSAlertController alertControllerWithTitle:@"标题" message:@"信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息信息" preferredStyle:LSAlertControllerStyleAlert];
    LSAlertAction *okAction = [LSAlertAction actionWithTitle:@"确认" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    LSAlertAction *cancelAction = [LSAlertAction actionWithTitle:@"取消" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"取消");
    }];
    LSAlertAction *otherOneAction = [LSAlertAction actionWithTitle:@"默认按钮" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    LSAlertAction *otherTwoAction = [LSAlertAction actionWithTitle:@"的总个数大于3" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    LSAlertAction *otherThreeAction = [LSAlertAction actionWithTitle:@"就是垂直排列" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
  
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [alertController addAction:otherOneAction];
    [alertController addAction:otherTwoAction];
    [alertController addAction:otherThreeAction];

    [alertController show];
    alertController.containerW = 400;
}

- (IBAction)AcitonSheet:(id)sender {
    
    LSAlertController *alertController = [LSAlertController alertControllerWithTitle:nil message:nil preferredStyle:LSAlertControllerStyleActionSheet];
    LSAlertAction *okAction = [LSAlertAction actionWithTitle:@"确认" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    LSAlertAction *Action = [LSAlertAction actionWithTitle:@"blalalalla" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"blalalalla");
    }];
    LSAlertAction *cancelAction = [LSAlertAction actionWithTitle:@"取消" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"取消");
    }];
    [alertController addAction:okAction];
    [alertController addAction:Action];
    [alertController addAction:cancelAction];
    [alertController show];
    alertController.containerW = 400;
}


- (IBAction)AcitonSheetWithTitle:(id)sender {
    
    LSAlertController *alertController = [LSAlertController alertControllerWithTitle:@"退出登录" message:nil preferredStyle:LSAlertControllerStyleActionSheet];
    LSAlertAction *okAction = [LSAlertAction actionWithTitle:@"确认" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    LSAlertAction *Action = [LSAlertAction actionWithTitle:@"blalalalla" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"blalalalla");
    }];
    LSAlertAction *cancelAction = [LSAlertAction actionWithTitle:@"取消" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"取消");
    }];
    [alertController addAction:okAction];
    [alertController addAction:Action];
    [alertController addAction:cancelAction];
    [alertController show];
    alertController.containerW = 400;
}

- (IBAction)AcitonSheetWithSubtitle:(id)sender {
    LSAlertController *alertController = [LSAlertController alertControllerWithTitle:@"退出登录" message:@"退出登录后不会清除聊天记录" preferredStyle:LSAlertControllerStyleActionSheet];
    LSAlertAction *okAction = [LSAlertAction actionWithTitle:@"确认" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    LSAlertAction *Action = [LSAlertAction actionWithTitle:@"blalalalla" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"blalalalla");
    }];
    LSAlertAction *cancelAction = [LSAlertAction actionWithTitle:@"取消" textColor:RGB(102,102,102,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"取消");
    }];
    [alertController addAction:okAction];
    [alertController addAction:Action];
    [alertController addAction:cancelAction];
    [alertController show];
    alertController.containerW = 400;
}

@end
