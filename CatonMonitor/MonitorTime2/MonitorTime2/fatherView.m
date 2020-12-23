//
//  fatherView.m
//  MonitorTime2
//
//  Created by Liao PanPan on 2020/12/16.
//  Copyright © 2020 cs. All rights reserved.
//

#import "fatherView.h"

@implementation fatherView


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *v=[super hitTest:point withEvent:event];
    NSInteger count = self.subviews.count;
    return v;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)drawRect:(CGRect)rect{
 
}
@end
