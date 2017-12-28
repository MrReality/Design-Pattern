//
//  Defense.h
//  GameTest
//
//  Created by 刘入徵 on 2017/12/27.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "BaseAttack.h"

/// 基础物理伤害
#define kPhysicalBaseDamage 100
/// 基础魔法伤害
#define kMagicBaseDamage 150
/// 基础闪电伤害
#define kLightningBaseDamage 150

/// MARK: 防御接口
 @protocol DefenseInterface <NSObject>

/// 处理请求的接口, attacker 攻击者, victimer 受害者
- (void)handleRequest:(BaseAttack *)request attackerName:(NSString *)attacker andVictimerName:(NSString *)victimer;

@end




