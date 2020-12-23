//
//  UIButton+mulTest.m
//  MonitorTime2
//
//  Created by Liao PanPan on 2020/12/22.
//  Copyright © 2020 cs. All rights reserved.
//

#import "UIButton+mulTest.h"


@implementation UIButton (mulTest)
+ (void)load{
    NSLog(@"load-mulTest");
}

-(void)logInfo{
   NSLog(@"load-mulTestInfo");
}

- (void)addSubview:(UIView *)view{
    [super addSubview:view];
    NSLog(@"load-multestInfoview");

}
@end
