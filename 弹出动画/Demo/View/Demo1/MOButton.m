//
//  MOButton.m
//  弹出动画
//
//  Created by 莫莫 on 2017/9/28.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOButton.h"

@implementation MOButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
//    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    self.titleLabel.frame = CGRectMake(0, self.frame.size.width, self.frame.size.width, self.frame.size.height - self.frame.size.width);
}

- (void)setHighlighted:(BOOL)highlighted {
    
}


@end
