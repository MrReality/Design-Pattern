//
//  MRTextField.h
//  策略模式
//
//  Created by 刘入徵 on 2017/12/9.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputTest.h"

/// MARK: 子类化的输入框
@interface MRTextField : UITextField

/// 聚合策略类
@property (nonatomic, strong, nullable) InputTest *inputTest;
/// 检测输入是否正确
- (BOOL)checkInput;
/// 描述
@property (nonatomic, copy, nonnull, readonly) NSString *desc;

@end
