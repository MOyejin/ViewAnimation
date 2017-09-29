//
//  Demo2.m
//  弹出动画
//
//  Created by 莫莫 on 2017/9/29.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "Demo.h"

//随机色
#define RGBRandom [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

@implementation Demo

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
   
        self.backgroundColor = RGBRandom;
        UITapGestureRecognizer *get = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:get];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)get{
    
    if (self.DemoBlock) {
        self.DemoBlock();
    }
    
}

@end
