//
//  ViewController.m
//  MonitorTime2
//
//  Created by cs on 2019/7/1.
//  Copyright © 2019 cs. All rights reserved.
//

#import "ViewController.h"
#import "Monitor.h"
#import <objc/runtime.h>
#import "hahaTest.h"
#import "AViewController.h"
//#import "UIButton+mulTest.h"
//#import "UIButton+TestBUtton.h"
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;

@interface ViewController ()<UITableViewDataSource> {
    UITableView *_tableView;
}
@property(nonatomic, strong) NSString *reference;
@end

void(^block)(void);

@implementation ViewController

+ (void)load{
    NSLog(@"load-vc");
}

- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.

//    [self syncAction];
//    [self testtime];
//    hahaTest *t=[[hahaTest alloc]init];
//    [t codeSecret];
//    [self addObserver:self forKeyPath:@"reference" options:NSKeyValueObservingOptionNew context:nil];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
    
    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    v.backgroundColor=[UIColor greenColor];
    [btn addSubview:v];
//    [btn addSubview: [UIView new]];
    
    NSInteger i = 10;
    block=^(){
         
    };
    NSLog(@"--------%@",[block class]);
}

+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    return NO;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
        NSLog(@"触发了kvo%@",object);
}

- (void)setReference:(NSString *)reference{
    if(_reference!=reference){
        [self willChangeValueForKey:@"reference"];
        _reference=reference;
        [self didChangeValueForKey:@"reference"];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    AViewController *a=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"AViewController"];
    [self.navigationController pushViewController:a animated:YES];

}
-(void)testtime{
//    sleep(4);
    
    NSLog(@"%@---%@",[[NSObject alloc]init],[[NSObject alloc]init]);
    NSLog(@"1");
}

-(void)testAsy
{


    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group=dispatch_group_create();
    
    dispatch_semaphore_signal(sem);
    dispatch_group_async(group, queue, ^{
        sleep(5);
        NSLog(@"%@---block1结束。。。",[NSThread currentThread]);
//        dispatch_semaphore_signal(sem);
    });

    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        sleep(3);
        NSLog(@"%@---block2结束。。。",[NSThread currentThread]);

    });

    dispatch_group_async(group, queue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"----------33333");
        }
    });

    dispatch_group_notify(group, queue, ^{
        NSLog(@"玩策划稿");
    });


}

- (void)syncAction{
    
   dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            NSLog(@"任务1:%@",[NSThread currentThread]);
            dispatch_semaphore_signal(sem);
        });
        
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"任务2:%@",[NSThread currentThread]);
            dispatch_semaphore_signal(sem);
        });
        
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"任务3:%@",[NSThread currentThread]);
        });
    
}


- (IBAction)click:(id)sender {
    NSURL *viewUserURL = [NSURL URLWithString:@"bundle://router/push/view"];
    [[UIApplication sharedApplication] openURL:viewUserURL];
    NSLog(@"%@", _reference); // Console: (null)
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@", _reference); // Console: (null)
    });
    
//    [self.reference addObject:@""];
}

/// 绘制TableView视图
- (void)drawTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *text = nil;
    
    if (indexPath.row % 10 == 0) {  // 每10行休眠0.2S
        usleep(2000 * 1000); // 1 * 1000 * 1000 == 1秒
        text = @"我在做复杂的事情，需要一些时间";
    } else {
        text = [NSString stringWithFormat:@"cell - %ld",indexPath.row];
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

@end
