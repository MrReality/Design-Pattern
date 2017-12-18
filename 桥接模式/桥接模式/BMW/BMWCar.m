//
//  BMWCar.m
//  桥接模式
//
//  Created by 刘入徵 on 2017/12/12.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import "BMWCar.h"

@implementation BMWCar

- (void)doWithCommand:(NSString *)command{
    if([command isEqualToString:@"open"])
        NSLog(@"BMW do open");
    if([command isEqualToString:@"close"])
        NSLog(@"BMW do close");
}

@end
