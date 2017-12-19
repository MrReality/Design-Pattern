//
//  InputNumTest.m
//  策略模式
//
//  Created by 刘入徵 on 2017/12/9.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "InputNumTest.h"

@implementation InputNumTest

- (BOOL)testInputWithTextField:(UITextField *)tf{
    if(!tf.text.length){ /// 如果输入为空, 直接返回
        self.desc = @"输入为空";
        return false;
    }
    /// 正则判断
    NSUInteger numberOfMatches = [self testRegexWithRegix:@"^[0-9]*$" andText:tf.text];
    if(!numberOfMatches)    /// 输入有误
        self.desc = @"输入不全是数字";
    else                                /// 输入正确
        self.desc = nil;
    
    return self.desc ? NO : YES;
}

@end
