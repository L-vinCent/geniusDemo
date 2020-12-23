//
//  UIButton+TestBUtton.h
//  MonitorTime2
//
//  Created by Liao PanPan on 2020/12/18.
//  Copyright © 2020 cs. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^btnBlock)();

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TestBUtton)

- (void)handelWithBlock:(btnBlock)block;

-(void)logInfo;

@end

NS_ASSUME_NONNULL_END
