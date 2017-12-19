//
//  Key.h
//  桥接模式
//
//  Created by 刘入徵 on 2017/12/12.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

/// MARK: 钥匙类
@interface Key : NSObject

/// 车
@property (nonatomic, strong, nonnull) Car *car;
/// 开
- (void)open;
/// 关
- (void)close;

@end
