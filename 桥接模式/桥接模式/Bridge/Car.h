//
//  Car.h
//  桥接模式
//
//  Created by 刘入徵 on 2017/12/12.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import <Foundation/Foundation.h>

/// MARK: 车类
@interface Car : NSObject

/// 根据指令做事情
- (void)doWithCommand:(NSString *)command;

@end
