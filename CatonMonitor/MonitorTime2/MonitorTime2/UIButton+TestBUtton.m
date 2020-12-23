//
//  UIButton+TestBUtton.m
//  MonitorTime2
//
//  Created by Liao PanPan on 2020/12/18.
//  Copyright © 2020 cs. All rights reserved.
//

#import "UIButton+TestBUtton.h"
#import <objc/runtime.h>
static const char btnKey;//注意这里声明了一个静态变量用来作索引key

@implementation UIButton (TestBUtton)

- (void)handelWithBlock:(btnBlock)block
{
    if (block)
    {
        objc_setAssociatedObject(self, &btnKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)logInfo{
   NSLog(@"load-testInfo");

    
}


+ (void)load{
    NSLog(@"load-test");
}
- (void)btnAction
{
  //获取block对象
    btnBlock block = objc_getAssociatedObject(self, &btnKey);
    block();
}


@end
