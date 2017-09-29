//
//  ViewController.m
//  弹出动画
//
//  Created by 莫莫 on 2017/9/28.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "ViewController.h"
#import "zhPopupController.h"
#import "MOView.h"
#import "Demo.h"

#define MOScreenW  [UIScreen mainScreen].bounds.size.width
#define MOScreenH  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)btn:(UIButton *)sender {
    
    if (sender.tag == 1) {
        
        MOView *vie = [[MOView alloc] init];
        [vie showWithController:self];
        return;
    }
    
    
    
    Demo *demo = [[Demo alloc] init];

    
    if (sender.tag == 2){
        
        self.zh_popupController = [[zhPopupController alloc] init];
        demo.frame = CGRectMake((MOScreenW - 100) * 0.5,(MOScreenH - 100) * 0.5,100, 100);
        [self.zh_popupController dropAnimatedWithRotateAngle:30];
        [self.zh_popupController presentContentView:demo duration:0.75 springAnimated:YES];
        
    }else if (sender.tag == 3){
        
        demo.frame = CGRectMake((MOScreenW - 150) * 0.5,(MOScreenH - 150) * 0.5, 150, 150);
        self.zh_popupController = [zhPopupController popupControllerWithMaskType:zhPopupMaskTypeBlackBlur];
        self.zh_popupController.slideStyle = zhPopupSlideStyleShrinkInOut;
        self.zh_popupController.allowPan = YES;
        // 弹出2秒后消失
        [self.zh_popupController presentContentView:demo duration:0.75 springAnimated:YES inView:nil displayTime:2];
        
    }else if (sender.tag == 4){
        
        
        demo.frame = CGRectMake((MOScreenW - 300) * 0.5,(MOScreenH - 350) * 0.5, 300, 350);
        self.zh_popupController = [zhPopupController new];
        self.zh_popupController.dismissOnMaskTouched = NO;
        self.zh_popupController.dismissOppositeDirection = YES;
        self.zh_popupController.slideStyle = zhPopupSlideStyleFromBottom;
        [self.zh_popupController presentContentView:demo duration:0.75 springAnimated:YES];
        
    }else if (sender.tag == 5){
        
        demo.frame = CGRectMake(0,0, MOScreenW, 180);
        self.zh_popupController = [zhPopupController new];
        self.zh_popupController.layoutType = zhPopupLayoutTypeTop;
        self.zh_popupController.allowPan = YES;
        
        self.zh_popupController.maskTouched = ^(zhPopupController * _Nonnull popupController) {
            [popupController dismissWithDuration:0.25 springAnimated:NO];
        };
        [self.zh_popupController presentContentView:demo duration:0.75 springAnimated:YES];
        
    }else if (sender.tag == 6){
        
        demo.frame = CGRectMake(0,0, 200, MOScreenH);
        self.zh_popupController = [zhPopupController new];
        self.zh_popupController.layoutType = zhPopupLayoutTypeLeft;
        self.zh_popupController.allowPan = YES;
        [self.zh_popupController presentContentView:demo];
  
    }else if (sender.tag == 7){
        
        demo.frame = CGRectMake(0,MOScreenH - 200, MOScreenW, 200);
        self.zh_popupController = [zhPopupController new];
        self.zh_popupController.layoutType = zhPopupLayoutTypeBottom;
        [self.zh_popupController presentContentView:demo];
        
    }else{
     
        UITextField *mo = [[UITextField alloc] initWithFrame:CGRectMake(0, 150, 200, 30)];
        mo.text = @"view会根据键盘的弹起而往上";
        [mo becomeFirstResponder];
        
        [demo addSubview:mo];
        demo.frame = CGRectMake(0,0, 300, 236);
        self.zh_popupController = [zhPopupController popupControllerWithMaskType:zhPopupMaskTypeBlackBlur];
        self.zh_popupController.layoutType = zhPopupLayoutTypeCenter;
        [self.zh_popupController presentContentView:demo duration:0.25 springAnimated:NO];
        

        
    }
    
   
    demo.DemoBlock = ^{
        
        [self.zh_popupController dismiss];
    };
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


@end
