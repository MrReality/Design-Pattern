//
//  DefenseHandler.m
//  GameTest
//
//  Created by 刘入徵 on 2017/12/27.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "DefenseHandler.h"


@implementation DefenseHandler

/// 处理请求的接口, attacker 攻击者, victimer 受害者
- (void)handleRequest:(BaseAttack *)request attackerName:(NSString *)attacker andVictimerName:(NSString *)victimer{
    if(self.nextHandler)
        [self.nextHandler handleRequest:request attackerName:attacker andVictimerName:victimer];
}

@end
