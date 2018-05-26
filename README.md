# LSAlertController
A similar system UIAlertController

### Demo【演示】
![演示](https://github.com/linshengqi/LSAlertController/blob/master/LSAlertController.gif)

### Examples【示例】

```
LSAlertController *alertController = [LSAlertController alertControllerWithTitle:@"标题" message:@"信息信息信息信" preferredStyle:LSAlertControllerStyleAlert];
    LSAlertAction *okAction = [LSAlertAction actionWithTitle:@"确认" textColor:RGB(53,198,252,1) handler:^(LSAlertAction * _Nullable action) {
        NSLog(@"确认");
    }];
    [alertController addAction:okAction];
    [alertController show];

```


###  Differences With UIAlertController【和UIAlertController的区别】

```

/** 按钮文字 */
@property (nullable, nonatomic, copy) NSString *title;
/** 按钮文字颜色，默认是UIControlStateNormal */
@property (nullable,nonatomic, strong) UIColor *textColor;
/** 按钮的点击事件 */
@property(nullable, nonatomic, strong) void (^handler)(LSAlertAction * _Nullable action);


/** 白色Container的宽度，默认300 */
@property (nonatomic, assign) CGFloat containerW;
/** 顶部标题 */
@property (nullable, nonatomic, copy) NSString *title;
/** 顶部子标题 */
@property (nullable, nonatomic, copy) NSString *message;
/** 样式，模仿苹果的两种样式ActionSheet和Alert供选择 */
@property (nonatomic, assign) LSAlertControllerStyle preferredStyle;

```



### Manually【手动导入】
1. 通过 Clone or download 下载项目里面的 LSAlertController 文件夹内的 LSAlertController 和分类UIButton+Border.
2. 将 LSAlertController 内的源文件添加(拖放)到你的工程.
3. 导入#import "LSAlertController.h".


## License

LSAlertController is released under the MIT license. See LICENSE for details.


