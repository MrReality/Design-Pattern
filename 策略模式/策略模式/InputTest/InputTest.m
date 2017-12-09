//
//  InputTest.m
//  策略模式
//
//  Created by 刘入徵 on 2017/12/9.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "InputTest.h"

@implementation InputTest

/// MARK: 验证输入是否正确, 抽象方法, 不用实现
- (BOOL)testInputWithTextField:(UITextField *)tf{
    return false;
}

/// MARK: 检测正则
- (NSUInteger)testRegexWithRegix:(NSString * _Nonnull)regex andText:(NSString *_Nonnull)text{
    /// 正则判断
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSUInteger numberOfMatches = [regular numberOfMatchesInString:text options:NSMatchingAnchored range:NSMakeRange(0, text.length)];
    return numberOfMatches;
}

@end
