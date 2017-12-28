//
//  Human.h
//  GameTest
//
//  Created by 刘入徵 on 2017/12/27.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "DefenseHandler.h"
#import <UIKit/UIKit.h>

/// MARK: 人
@interface Human : DefenseHandler

/// 血量
@property (nonatomic, assign) CGFloat hp;
/// 护甲值 如 0.3
@property (nonatomic, assign) CGFloat armor;
/// 魔抗 如 0.45
@property (nonatomic, assign) CGFloat magicResistance;

//@property (nonatomic, assign) 

@end
