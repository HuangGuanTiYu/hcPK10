//
//  OtherInformationWebViewController.m
//  Lottery123
//
//  Created by 项目2 on 16/9/30.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "OtherInformationWebViewController.h"

@interface OtherInformationWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView * myWebView;
@end

@implementation OtherInformationWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //判断上一级是否有传入相应字段
    if (!self.titleStr) {
        self.titleStr = @"活动";
    }
    
    if (!self.webStr) {
        self.webStr = @"http://www.baidu.com";
    }
   
    self.view.backgroundColor = MainBGColor;

    //网页视图
    self.myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    self.myWebView.delegate = self;
    [self.view addSubview:self.myWebView];
    
    
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webStr] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20]];
    
    //刷新按钮
    UIButton * refershBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW -44, 0 - 44, 44, 44)];
    [self.view addSubview:refershBtn];
    [refershBtn addTarget:self action:@selector(clickRefershBtn) forControlEvents:UIControlEventTouchUpInside];
    [refershBtn setImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal];
}
#pragma mark --- webView代理
- (void)webViewDidStartLoad:(UIWebView *)webView{

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //拿到WebView执行JS的执行环境
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    // *** 打开URL
    context[@"openSafariToWebWithUrl"] = ^(){
        //获得参数
        NSArray *prams = [JSContext currentArguments];
        if (prams.count == 1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",prams[0]]]];
        }
    };
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

    
}
- (void)clickRefershBtn{
    

    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webStr] cachePolicy:0 timeoutInterval:20]];
}

- (void)backButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
