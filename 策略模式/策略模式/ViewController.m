//
//  ViewController.m
//  策略模式
//
//  Created by 刘入徵 on 2017/12/9.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "ViewController.h"
#import "MRTextField.h"
#import "InputNumTest.h"
#import "InputEnglishTest.h"

@interface ViewController () <UITextFieldDelegate>
/// 验证数字的 tf
@property (strong, nonatomic) IBOutlet MRTextField *numTF;
/// 验证数字的按钮
@property (strong, nonatomic) IBOutlet UIButton *numButton;
/// 验证英文的 tf
@property (strong, nonatomic) IBOutlet MRTextField *engTF;
/// 验证英文的按钮
@property (strong, nonatomic) IBOutlet UIButton *engButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 创建 UI
    [self _initUI];
}

/// MARK: 创建 UI
- (void)_initUI{
    self.numTF.delegate = self.engTF.delegate = self;
    /// 初始化策略类的具体实现类
    self.numTF.inputTest = [[InputNumTest alloc] init];
    self.engTF.inputTest = [[InputEnglishTest alloc] init];
    
    [self.numButton addTarget:self action:@selector(numButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.engButton addTarget:self action:@selector(engButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

/// MARK: 检查 tf
- (BOOL)testWithTF:(UITextField *)tf{
    if([tf isKindOfClass:[MRTextField class]]){
        return [(MRTextField *)tf checkInput];
    }
    [self.view endEditing:YES];
    return false;
}

/// MARK: 检测数字按钮点击事件
- (void)numButtonAction{
    if([self testWithTF:self.numTF])
        NSLog(@"输入的全部为数字");
    else
        NSLog(@"%@", self.numTF.desc);
}
/// MARK: 检测英文按钮点击事件
- (void)engButtonAction{
    if([self testWithTF:self.engTF])
        NSLog(@"输入的全部为英文");
    else
        NSLog(@"%@", self.engTF.desc);
}





@end
