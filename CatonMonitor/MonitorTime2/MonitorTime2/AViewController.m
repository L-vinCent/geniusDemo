//
//  AViewController.m
//  MonitorTime2
//
//  Created by Liao PanPan on 2020/12/21.
//  Copyright © 2020 cs. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

+ (void)load{
    NSLog(@"load-a");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *uiImage = [UIImage imageNamed:@"a"];
    CGImageRef cgRef1 = uiImage.CGImage;
    
//    NSTimer *timer=[NSTimer timerWithTimeInterval:2 target:self selector:@selector(click) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//    [[NSRunLoop currentRunLoop]run];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//             NSLog(@"--------123123");
//
//         }];
//    });
    NSArray *array=@[@"123",@"3"];
    NSLog(@"%@",[array objectAtIndex:3]);
}

-(void)click{
    NSLog(@"123123");
}

- (void)dealloc
{
    NSLog(@"--dealloc");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
