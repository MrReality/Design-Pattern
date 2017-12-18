//
//  FirstCtrl.m
//  桥接模式
//
//  Created by 刘入徵 on 2017/12/12.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "FirstCtrl.h"
#import "UniversalKey.h"
#import "BMWCar.h"
#import "AudiCar.h"

@interface FirstCtrl ()

@end

@implementation FirstCtrl

- (void)viewDidLoad {
    [super viewDidLoad];

    UniversalKey *key = [[UniversalKey alloc] init];
    key.car = [[AudiCar alloc] init];
    [key open];
    [key close];
    
    key.car = [[BMWCar alloc] init];
    [key open];
    [key close];
}


@end
