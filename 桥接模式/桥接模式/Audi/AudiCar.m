//
//  AudiCar.m
//  桥接模式
//
//  Created by 刘入徵 on 2017/12/12.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "AudiCar.h"

@implementation AudiCar

- (void)doWithCommand:(NSString *)command{
    if([command isEqualToString:@"open"])
        NSLog(@"Audi do open");
    if([command isEqualToString:@"close"])
        NSLog(@"Audi do close");
}

@end
