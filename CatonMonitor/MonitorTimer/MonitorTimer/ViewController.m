//
//  ViewController.m
//  MonitorTimer
//
//  Created by cs on 2019/6/28.
//  Copyright © 2019 cs. All rights reserved.
//

#import "ViewController.h"
#import "Monitor.h"
@interface ViewController ()<UITableViewDataSource> {
    UITableView *_tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//     [self drawTableView];
//
//    // 开始卡顿监听
//    [[Monitor shareInstance] startMonitor];
    
    char_reverse("hello,ollhe");
    
}

//void char_reverse(char* cha)
//{
//    char *begin=cha;
//
//    char *end=cha +strlen(cha)-1;
//
//    while (begin<end) {
//        char temp=*begin;
//        *(begin++)=*end;
//        *(end--)=temp;
//    }
//
//    NSLog(@"123");
//
//}






char findFirstChar(char* cha)
{
    char result = '\0';
    // 定义一个数组 用来存储各个字母出现次数
    int array[256];
    // 对数组进行初始化操作
    for (int i=0; i<256; i++) {
        array[i] =0;
    }
    // 定义一个指针 指向当前字符串头部
    char* p = cha;
    // 遍历每个字符
    while (*p != '\0') {
        // 在字母对应存储位置 进行出现次数+1操作
        array[*(p++)]++;
    }
    
    // 将P指针重新指向字符串头部
    p = cha;
    // 遍历每个字母的出现次数
    while (*p != '\0') {
        // 遇到第一个出现次数为1的字符，打印结果
        if (array[*p] == 1)
        {
            result = *p;
            break;
        }
        // 反之继续向后遍历
        p++;
    }
    
    return result;
}


- (IBAction)click:(id)sender {
    
   NSURL *editPost = [NSURL URLWithString:@"web://post/edit/123?debug=true&foo=bar"];
    [JLRoutes routeURL:editPost withParameters:@{@"test":@"12",@"haha":@"3"}];
}

/// 绘制TableView视图
- (void)drawTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark --------------------------------------------
#pragma mark UITableViewDataSource
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
        usleep(3000 * 1000); // 1 * 1000 * 1000 == 1秒
        text = @"我在做复杂的事情，需要一些时间";
    } else {
        text = [NSString stringWithFormat:@"cell - %ld",indexPath.row];
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

@end
