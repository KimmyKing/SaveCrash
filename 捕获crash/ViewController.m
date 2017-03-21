//
//  ViewController.m
//  捕获crash
//
//  Created by Cain on 16/10/19.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSHomeDirectory());
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(crashTapped:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - 单击按钮产生崩溃事件
- (void)crashTapped:(id)sender
{
    //常见异常1---不存在方法引用
    
    //    [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
    
    //常见异常2---键值对引用nil
    
//        [[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
    
    //常见异常3---数组越界
    
    [[NSArray array] objectAtIndex:1];
    
    //常见异常4---memory warning 级别3以上
    
//    [self performSelector:@selector(killMemory) withObject:nil];
    
    //其他大家去想吧  
    
}

#pragma mark - custom method
- (void) killMemory
{
    for (int i = 0; i < 3000; i ++)
        
    {        
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        
        tmpLabel.layer.masksToBounds = YES;
        
        tmpLabel.layer.cornerRadius = 10;
        
        tmpLabel.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:tmpLabel];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"%s",__func__);
}

@end
