//
//  MOView.m
//  弹出动画
//
//  Created by 莫莫 on 2017/9/28.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOView.h"
#import "MOButton.h"
#import <POP.h>


#define MOScreenW  [UIScreen mainScreen].bounds.size.width
#define MOScreenH  [UIScreen mainScreen].bounds.size.height

@interface MOView()

@property (nonatomic,strong)NSArray *array_mian;

@property (nonatomic,weak)UILabel *label_main;

@end

@implementation MOView
{
    NSMutableArray *_buttonsArray; //添加的所有按钮
    UIViewController *_fromController; //调起该View的控制器
    
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor whiteColor];
    
    [self addMOButton];
}

- (void)addMOButton{
    
    CGFloat itemW = 60;
    CGFloat itemH = 90;
    

    // 每个按钮之间的间距
    CGFloat itemMargin = (MOScreenW - itemW * 4) / 5;
    
    _buttonsArray = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++) {
        
        MOButton *button = [[MOButton alloc] init];
        [button setTitle:self.array_mian[i][@"title"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:self.array_mian[i][@"icon"]] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = i;
        [button addTarget:self action:@selector(childButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        // 行
        NSInteger col = i % 4;
        // 列
        NSInteger row = i / 4;
        
        CGFloat x = (CGFloat)col * itemW + ((CGFloat)col + 1) * itemMargin;
        CGFloat y = (CGFloat)row * itemH + MOScreenH;
        
        //设置按钮的位置
        button.frame = CGRectMake(x, y, itemW, itemH);
        [self addSubview:button];
        [_buttonsArray addObject:button];
        
    }

}
- (void)childButtonClick:(MOButton *)sender {
    for (MOButton *value in _buttonsArray) {
        [UIView animateWithDuration:0.25 animations:^{
            if (value == sender) {
                value.transform = CGAffineTransformMakeScale(2, 2);
            }else {
                value.transform = CGAffineTransformMakeScale(0.2, 0.2);
            }
            value.alpha = 0.1;
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            
        }];
    }
}


#pragma mark -- 按钮动画
// 按钮弹出动画
- (void)showWithController:(UIViewController *)fromController {
    _fromController = fromController;
    [fromController.view addSubview:self];
    
    [_buttonsArray enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self showAnimationWithButton:obj index:idx isUp:true];
    }];
}
// 按钮滑出动画
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[_buttonsArray reverseObjectEnumerator].allObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self showAnimationWithButton:obj index:idx isUp:false];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

- (void)showAnimationWithButton:(UIButton *)button index:(NSInteger)index isUp:(BOOL)isUp{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(button.center.x, button.center.y + (isUp? -150 : 150))];//最终停止的位置
    animation.springBounciness = 10;
    animation.springSpeed = 12;
    animation.beginTime = CACurrentMediaTime() + (CGFloat)index * 0.125;
    [button pop_addAnimation:animation forKey:nil];
}

- (NSArray *)array_mian{
    if (!_array_mian) {
        _array_mian = [NSArray arrayWithObjects:
                          @{@"icon":@"icon_0",@"title":@"莫"},
                          @{@"icon":@"icon_1",@"title":@"业"},
                          @{@"icon":@"icon_2",@"title":@"金"},
                          @{@"icon":@"icon_3",@"title":@"MOye"},
                       nil];
    }
    return _array_mian;
}

@end
