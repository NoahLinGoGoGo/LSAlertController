//
//  LSAlertController.m
//  LSAlertController
//
//  Created by 周结论 on 2018/5/24.
//  Copyright © 2018年 周结论. All rights reserved.
//

#import "LSAlertController.h"
#import "UIButton+Border.h"

#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define iosVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define screenW  [UIScreen mainScreen].bounds.size.width
#define screenH  [UIScreen mainScreen].bounds.size.height

static CGFloat containerW = 300.0;
static CGFloat containerH = 160.0;
static CGFloat margin = 15.0;
static CGFloat messageTitleH = 30.0;


@implementation LSAlertAction

+ (instancetype)actionWithTitle:(NSString *)title textColor:(UIColor *)textColor handler:(void (^)(LSAlertAction * _Nullable))handler {
    
    return [[self alloc] initWithTitle:title textColor:textColor handler:handler];
}

- (instancetype)initWithTitle:(NSString *)title textColor:(UIColor *)textColor handler:(void (^)(LSAlertAction * _Nullable))handler {
    
    if (self = [super init]) {
        self.title = title;
        self.textColor = textColor;
        self.handler = handler;
    }
    return self;
}



@end



@interface LSAlertController ()

@property (nonatomic, strong) NSMutableArray *actionItems;
@property (nonatomic, strong) NSMutableArray *textFieldItems;

@property(nonatomic, strong) UIView *containerView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *messageLabel;


@end

@implementation LSAlertController
@synthesize title = _title;

#pragma mark - Life Cycle
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(LSAlertControllerStyle)preferredStyle {
    
    return [[self alloc]initWithTitle:title message:message preferredStyle:preferredStyle];
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(LSAlertControllerStyle)preferredStyle {
    
    if (self = [super init]) {
        
        self.title = title;
        self.message = message;
        self.preferredStyle = preferredStyle;
        [self initData];
        [self initUI];
    }
    return self;
}


- (void)initData {
    self.actionItems = [NSMutableArray array];
    self.textFieldItems = [NSMutableArray array];
}


- (void)initUI {
    self.view.backgroundColor = [UIColor colorWithWhite:.0f alpha:.45f];
    [self.view addSubview:self.containerView];
    if (![self isEmptyString:self.title]) {
        [self.containerView addSubview:self.titleLabel];
    }
    if (![self isEmptyString:self.message]) {
        [self.containerView addSubview:self.messageLabel];
    }
}


- (void)viewWillLayoutSubviews {
    
    if (self.preferredStyle == LSAlertControllerStyleActionSheet) {
        [self setupActionSheetStyleSubViews];
    } else {
        [self setupAlertStyleSubViews];
    }
}

- (void)setupActionSheetStyleSubViews {
    NSUInteger actionLength = self.actionItems.count;
    CGFloat buttonH = 50.0;
    containerH += actionLength * buttonH;
    
    if (![self isEmptyString:self.title] || ![self isEmptyString:self.message]) {
        containerH += buttonH;
    }
    
    self.containerView.frame = CGRectMake((screenW - containerW)* 0.5, screenH - containerH, containerW, containerH);
    
    if (![self isEmptyString:self.title] && ![self isEmptyString:self.message]) {
        self.titleLabel.frame = CGRectMake(margin, 0, containerW - 2 * margin, buttonH * 0.5);
        self.messageLabel.frame = CGRectMake(margin, buttonH * 0.5, containerW - 2 * margin, buttonH * 0.5);
    } else {
        self.titleLabel.frame = CGRectMake(margin, 0, containerW - 2 * margin, buttonH);
        self.messageLabel.frame = self.titleLabel.frame;
    }
    
    for (NSUInteger i = 0; i < actionLength; i++) {
        LSAlertAction *action = self.actionItems[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:action.title forState:UIControlStateNormal];
        [button setTitleColor:action.textColor forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, containerH - (actionLength - i) * buttonH , containerW, buttonH)];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderColor = RGB(228, 228, 228, 1).CGColor;
        button.layer.borderWidth = 0.5;
        button.tag = 100 + i;
        if (i == actionLength - 1) {
            [button addTopBorderWithColor:RGB(102, 102, 102, 0.2) andWidth:5.0];
            [button setFrame:CGRectMake(0, containerH - (actionLength - i) * buttonH , containerW, buttonH + 5)];
        }
        [self.containerView addSubview:button];
    }
}





- (void)setupAlertStyleSubViews {
    NSUInteger actionLength = self.actionItems.count;
    NSUInteger textFieldLength = self.textFieldItems.count;
    CGFloat textFieldW = containerW - margin * 2;
    CGFloat textFieldH = 40.0;
    CGFloat buttonH = 50.0;
    CGFloat buttonW;
    if (actionLength > 2) {
        buttonW = containerW;
        containerH += actionLength * buttonH - buttonH;
    } else {
        buttonW = containerW / actionLength;
    }
    
    containerH += textFieldLength * textFieldH;
    messageTitleH = [self.message boundingRectWithSize:CGSizeMake(containerW - 2 * margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]} context:nil].size.height;
    if (messageTitleH < margin *2) {
        messageTitleH = margin *2;

    } else if ([self isEmptyString:self.title] && [self isEmptyString:self.message]) {
        containerH = buttonH ;
    } else {
        containerH += messageTitleH - margin * 2;
        
    }
    
    
    self.containerView.frame = CGRectMake((screenW - containerW)* 0.5, (screenH - containerH)* 0.5, containerW, containerH);
    
    
    
    if (![self isEmptyString:self.title] && ![self isEmptyString:self.message]) {
        self.titleLabel.frame = CGRectMake(margin, margin, containerW - 2 * margin, margin * 2);
        self.messageLabel.frame = CGRectMake(margin, margin * 3, containerW - 2 * margin, messageTitleH);
    } else {
        self.titleLabel.frame = CGRectMake(margin, margin * 3.5, containerW - 2 * margin, margin * 2);
        self.messageLabel.frame = CGRectMake(margin, margin * 3.5, containerW - 2 * margin, messageTitleH);
    }
    
    
    for (NSUInteger i = 0; i < textFieldLength; i++) {
        UITextField *textField = self.textFieldItems[i];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [textField setFrame:CGRectMake(margin, CGRectGetMaxY(self.messageLabel.frame) + 10 + i * textFieldH, textFieldW, textFieldH)];
        [self.containerView addSubview:textField];
    }
    
    
    for (NSUInteger i = 0; i < actionLength; i++) {
        LSAlertAction *action = self.actionItems[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:action.title forState:UIControlStateNormal];
        [button setTitleColor:action.textColor forState:UIControlStateNormal];
        if (actionLength > 2) {
            [button setFrame:CGRectMake(0, containerH - (actionLength - i) * buttonH , buttonW, buttonH)];
        } else {
            [button setFrame:CGRectMake(i * buttonW, containerH - buttonH, buttonW, buttonH)];
        }
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderColor = RGB(228, 228, 228, 1).CGColor;
        button.layer.borderWidth = 0.5;
        button.tag = 100 + i;
        [self.containerView addSubview:button];
    }
}

- (void)dealloc {
    NSLog(@"dealloc");
}

#pragma mark - Public
- (void)addAction:(LSAlertAction *)action {
    [self.actionItems addObject:action];
}


- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField * _Nonnull))configurationHandler{
    if (self.preferredStyle == LSAlertControllerStyleActionSheet) {
        @throw [NSException exceptionWithName:@"ohohoh,crash~~~~~~~~~~~~" reason:@"LSAlertControllerStyleActionSheet Do Not Support addTextFieldWithConfigurationHandler:" userInfo:nil];
    }
    UITextField *textField = [[UITextField alloc]init];
    [self.textFieldItems addObject:textField];
    configurationHandler(textField);
}

- (void)buttonClick:(UIButton *)button {
    NSUInteger tag = button.tag - 100;
    LSAlertAction *action = self.actionItems[tag];
    if (action.handler) {
        action.handler(action);
    }
    [self dismiss];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}



#pragma mark - setter & getter
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}


- (void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = message;
}

- (void)setPreferredStyle:(LSAlertControllerStyle)preferredStyle {
    _preferredStyle = preferredStyle;
    if (_preferredStyle == LSAlertControllerStyleActionSheet) {
        containerW = screenW;
        containerH = 0.0;
        self.containerView.layer.cornerRadius = 0;
    } else {
        containerW = 300.0;
        containerH = 160.0;
    }
}

#pragma mark - Lazy Load
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc]init];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.layer.cornerRadius = 10.0;
        _containerView.layer.masksToBounds = YES;
    }
    return _containerView;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = RGB(51, 51, 51, 1);
    }
    return _titleLabel;
}


- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.font = [UIFont systemFontOfSize:12.0];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.textColor = RGB(51, 51, 51, 1);
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}


#pragma mark - Pravite
- (void)show {
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [[self theTopviewControler] presentViewController:self animated:YES completion:nil];
}


- (UIViewController *)theTopviewControler {
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    UIViewController *parent = rootVC;
    while ((parent = rootVC.presentedViewController) != nil ) {
        rootVC = parent;
        
    } while ([rootVC isKindOfClass:[UINavigationController class]]){
        rootVC = [(UINavigationController *)rootVC topViewController];
        
    }
    return rootVC;
}

- (BOOL)isEmptyString:(NSString *)string {
    if ([string isKindOfClass:[NSNull class]] ||  [string isEqualToString:@""] || string.length == 0) {
        return YES;
    } else {
        return NO;
    }
}


- (void)dismiss {
    containerH = 160.0;
    [self.actionItems removeAllObjects];
    [self.textFieldItems removeAllObjects];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
