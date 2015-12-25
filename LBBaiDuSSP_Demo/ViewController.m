//
//  ViewController.m
//  LBBaiDuSSP_Demo
//
//  Created by bison on 15/12/25.
//  Copyright © 2015年 Bison. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    _webView.scrollView.bounces = NO;
    
    //刷新数据
    [self reloadData];
    
}

- (void)reloadData{
    
    // 耗时的操作
    NSURL *url = [NSURL URLWithString:@"http://allluckly.cn"];
    
    NSString *str = [NSString stringWithContentsOfURL:url usedEncoding:nil error:nil];
    [_webView loadHTMLString:str baseURL:url];

    // 更新界面
    _webView.opaque = NO;
    _webView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_webView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
