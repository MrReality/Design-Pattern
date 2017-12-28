//
//  PhysicalDefense.m
//  GameTest
//
//  Created by 刘入徵 on 2017/12/27.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "PhysicalDefense.h"
#import "PhysicalAttack.h"

@implementation PhysicalDefense

/// 处理请求的接口, attacker 攻击者, victimer 受害者
- (void)handleRequest:(BaseAttack *)request attackerName:(NSString *)attacker andVictimerName:(NSString *)victimer{
    if([[request class] isEqual:[PhysicalAttack class]]){       /// 物理攻击
        NSLog(@"%@ 对 %@ 进行了物理攻击, 伤害值: %d", attacker, victimer, kPhysicalBaseDamage);
    }else{                                                                            /// 非物理攻击
        
    }
    if(self.nextHandler)
        [self.nextHandler handleRequest:request attackerName:attacker andVictimerName:victimer];
}

@end
