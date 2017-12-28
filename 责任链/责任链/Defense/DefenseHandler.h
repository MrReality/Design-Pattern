//
//  DefenseHandler.h
//  GameTest
//
//  Created by 刘入徵 on 2017/12/27.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefenseInterface.h"

/// MARK: 防御处理者
@interface DefenseHandler : NSObject <DefenseInterface>

/// 下一响应者
@property (nonatomic, strong, nullable) DefenseHandler *nextHandler;


@end
