//
//  Human.m
//  GameTest
//
//  Created by 刘入徵 on 2017/12/27.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "Human.h"
#import "PhysicalAttack.h"
#import "MagicAttack.h"
#import "LightningSkill.h"

@implementation Human

/// 处理请求的接口, attacker 攻击者, victimer 受害者
- (void)handleRequest:(BaseAttack *)request attackerName:(NSString *)attacker andVictimerName:(NSString *)victimer{
    if([[request class] isEqual:[PhysicalAttack class]]){       /// 物理攻击
        CGFloat damage = kPhysicalBaseDamage * self.armor;
        self.hp -= damage;
        NSLog(@"%@ 的护甲为: %.2f, 受到的伤害值为: %.2f, 剩余血量为: %.2f", victimer, self.armor, damage, self.hp);
        NSLog(@"--------------------------------------------------------------");
    }
    if([[request class] isEqual:[MagicAttack class]]){           /// 魔法攻击
        CGFloat damage = kMagicBaseDamage * self.magicResistance;
        self.hp -= damage;
        NSLog(@"%@ 的魔抗为: %.2f, 受到的伤害值为: %.2f, 剩余血量为: %.2f", victimer, self.magicResistance, damage, self.hp);
        NSLog(@"--------------------------------------------------------------");
    }
    if([[request class] isEqual:[LightningSkill class]]){          /// 闪电攻击
        CGFloat damage = kLightningBaseDamage;
        self.hp -= damage;
        NSLog(@"%@ 对 %@ 进行闪电伤害, 护甲魔抗不起作用", attacker,  victimer);
        NSLog(@"%@ 受到的伤害值为: %.2f, 剩余血量为: %.2f", victimer, damage, self.hp);
        NSLog(@"--------------------------------------------------------------");
    }
    if(self.nextHandler)
        [self.nextHandler handleRequest:request attackerName:attacker andVictimerName:victimer];
}

@end
