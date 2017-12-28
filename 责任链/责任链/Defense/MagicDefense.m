//
//  MagicDefense.m
//  GameTest
//
//  Created by 刘入徵 on 2017/12/27.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "MagicDefense.h"
#import "MagicAttack.h"

@implementation MagicDefense

/// 处理请求的接口, attacker 攻击者, victimer 受害者
- (void)handleRequest:(BaseAttack *)request attackerName:(NSString *)attacker andVictimerName:(NSString *)victimer{
    if([[request class] isEqual:[MagicAttack class]]){           /// 魔法攻击
        NSLog(@"%@ 对 %@ 进行了魔法攻击, 伤害值: %d", attacker, victimer, kMagicBaseDamage);
    }else{                                                                            /// 非魔法攻击
        
    }
    if(self.nextHandler)
        [self.nextHandler handleRequest:request attackerName:attacker andVictimerName:victimer];
}

@end
