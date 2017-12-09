//
//  MRTextField.m
//  策略模式
//
//  Created by 刘入徵 on 2017/12/9.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "MRTextField.h"

@interface MRTextField ()
/// 描述
@property (nonatomic, copy, nonnull) NSString *desc;
@end

@implementation MRTextField

/// MARK: 检测输入是否正确
- (BOOL)checkInput{
    BOOL result = false;
    
    if(self.inputTest)      /// 检测输入
        result = [self.inputTest testInputWithTextField:self];
    if(!result)            /// 输入错误
        self.desc = self.inputTest.desc;
    
    return result;
}

@end
