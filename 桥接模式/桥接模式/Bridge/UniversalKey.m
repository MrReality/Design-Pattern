//
//  UniversalKey.m
//  桥接模式
//
//  Created by 刘入徵 on 2017/12/12.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "UniversalKey.h"

@implementation UniversalKey
/// 开
- (void)open{
    [self.car doWithCommand:@"open"];
}
/// 关
- (void)close{
    [self.car doWithCommand:@"close"];
}
@end
