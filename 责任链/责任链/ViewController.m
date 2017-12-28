//
//  ViewController.m
//  责任链
//
//  Created by Mac on 2017/12/28.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "ViewController.h"

#import "Human.h"
#import "PhysicalDefense.h"
#import "MagicDefense.h"

#import "PhysicalAttack.h"
#import "MagicAttack.h"

#import "LightningSkill.h"

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object)              autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object)              autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object)              try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object)              try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object)            autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object)            autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object)            try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object)            try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#define kScreenWidth               [UIScreen mainScreen].bounds.size.width
#define kScreenHeight              [UIScreen mainScreen].bounds.size.height

/// 时间间隔
#define kTime 0.5
/// 随机血量
#define kHp (arc4random_uniform(3) + 4) * 100
/// 随机护甲
#define kArmor (arc4random_uniform(3) + 3) * 0.1
/// 随机魔抗
#define kMagicResistance (arc4random_uniform(3) + 3) * 0.1

@interface ViewController ()

/// 定时器
@property (nonatomic, strong, nullable) NSTimer *timer;
/// 开始按钮
@property (nonatomic, strong, nullable) UIButton *startButton;
/// 是否是玩家 1 攻击玩家 2
@property (nonatomic, assign) BOOL isPerson1HitPerson2;

/// 玩家 1
@property (nonatomic, strong, nullable) Human *person1;
/// 玩家 2
@property (nonatomic, strong, nullable) Human *person2;

/// 玩家 1 的抗性
@property (nonatomic, strong, nullable) MagicDefense *p1Defense;
/// 玩家 2 的抗性
@property (nonatomic, strong, nullable) MagicDefense *p2Defense;

/// 随机放技能的数组
@property (nonatomic, strong, nullable) NSMutableArray *randomArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 创建 UI
    [self _initUI];
}

/// MARK: 创建 UI
- (void)_initUI{
    self.isPerson1HitPerson2 = YES;
    [self.view addSubview:self.startButton];
}

/// MARK: 重置玩家信息
- (void)_resetPlayer{
    /// 玩家 1
    /// 添加护甲
    PhysicalDefense *phyDefense1 = [[PhysicalDefense alloc] init];
    phyDefense1.nextHandler = self.person1;
    /// 添加魔抗
    self.p1Defense = [[MagicDefense alloc] init];
    self.p1Defense.nextHandler = phyDefense1;
    NSLog(@"------------------------------- 玩家 1 信息 -------------------------------");
    NSLog(@"血量: %.f, 护甲: %.2f, 魔抗: %.2f", self.person1.hp, self.person1.armor, self.person1.magicResistance);
    
    /// 玩家 2
    /// 添加护甲
    PhysicalDefense *phyDefense2 = [[PhysicalDefense alloc] init];
    phyDefense2.nextHandler = self.person2;
    /// 添加魔抗
    self.p2Defense = [[MagicDefense alloc] init];
    self.p2Defense.nextHandler = phyDefense2;
    NSLog(@"------------------------------- 玩家 2 信息 -------------------------------");
    NSLog(@"血量: %.f, 护甲: %.2f, 魔抗: %.2f", self.person2.hp, self.person2.armor, self.person2.magicResistance);
}

/// 创建定时器
- (void)_creatTimer{
    NSLog(@"------------------------------- pk 开始 -------------------------------");
    self.startButton.enabled = NO;
    @weakify(self);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kTime repeats:YES block:^(NSTimer * _Nonnull timer) {
        @strongify(self);
        if(self.person1.hp <= 0 || self.person2.hp <= 0){       /// pk 结束
            [self _closeTimer];
            return;
        }
        NSInteger random = arc4random_uniform((int)self.randomArray.count);
        id attack = NSClassFromString(self.randomArray[random]);
        /// 响应攻击
        self.isPerson1HitPerson2 ? [self.p2Defense handleRequest:attack attackerName:@"玩家 1" andVictimerName:@"玩家 2"] : [self.p1Defense handleRequest:attack attackerName:@"玩家 2" andVictimerName:@"玩家 1"];
        self.isPerson1HitPerson2 = !self.isPerson1HitPerson2;
    }];
}

/// 关闭定时器
- (void)_closeTimer{
    NSLog(@"------------------------------- pk 结束 -------------------------------");
    if(self.person1.hp <=0){        /// 玩家 2 获胜
        NSLog(@"玩家 2 获胜");
    }else{                                    /// 玩家 1 获胜
        NSLog(@"玩家 1 获胜");
    }
    self.person1 = nil;
    self.person2 = nil;
    self.startButton.enabled = YES;
    [self.timer invalidate];
    self.timer = nil;
}

/// MARK: 按钮点击事件
- (void)buttonAction{
    NSLog(@"------------------------------- pk 开始 -------------------------------");
    [self _resetPlayer];
    [self _creatTimer];
    [self.timer fire];
}

/// MARK: 懒加载
- (Human *)person1{
    if(!_person1){
        _person1 = [[Human alloc] init];
        _person1.hp = kHp;
        _person1.magicResistance = kMagicResistance;
        _person1.armor = kArmor;
    }
    return _person1;
}

- (Human *)person2{
    if(!_person2){
        _person2 = [[Human alloc] init];
        _person2.hp = kHp;
        _person2.magicResistance = kArmor;
        _person2.armor = kArmor;
    }
    return _person2;
}

- (NSMutableArray *)randomArray{
    if(!_randomArray){
        _randomArray = @[@"PhysicalAttack", @"MagicAttack", @"LightningSkill"].mutableCopy;
    }
    return _randomArray;
}

- (UIButton *)startButton{
    if(!_startButton){
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat width = 100;
        CGFloat height = 50;
        _startButton.frame = CGRectMake(kScreenWidth / 2 - width / 2, kScreenHeight / 2 - height / 2, width, height);
        _startButton.backgroundColor = [UIColor colorWithRed:0.15 green:0.60 blue:0.80 alpha:1.00];
        [_startButton setTitle:@"点击开始" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}


@end
