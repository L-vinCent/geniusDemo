//
//  SonView.m
//  MonitorTime2
//
//  Created by Liao PanPan on 2020/12/16.
//  Copyright © 2020 cs. All rights reserved.
//

#import "SonView.h"

@implementation SonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *v= [super hitTest:point withEvent:event];
//       NSInteger count = self.subviews.count;
    
    return [self superview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
@end
