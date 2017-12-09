//
//  InputTest.h
//  策略模式
//
//  Created by 刘入徵 on 2017/12/9.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import <UIKit/UIKit.h>

/// MARK: 策略类, 抽象类
@interface InputTest : NSObject
/// 验证输入是否正确, 抽象方法
- (BOOL)testInputWithTextField:(UITextField * _Nonnull)tf;
/// 检测正则
- (NSUInteger)testRegexWithRegix:(NSString * _Nonnull)regex andText:(NSString *_Nonnull)text;
/// 描述字段
@property (nonatomic, copy, nullable) NSString *desc;
@end
