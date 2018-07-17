//
//  HomeController.m
//  HBFrame
//
//  Created by guahibo on 16/5/27.
//  Copyright © 2016年 guahibo. All rights reserved.
//

#import "HomeController.h"
#import "HBText1Controller.h"
#import "AFNetworking.h"
#import "HBUser.h"
#import "MJExtension.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    
    //AFN网络请求
//    [self AFNGetData];
    
    [self PlistGetData];
}

- (void) AFNGetData
{
   
}

- (void) PlistGetData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"UserData" ofType:@"plist"];
    HBUser *user = [HBUser objectWithFile:plistPath];
}

- (void)push
{
    HBText1Controller *text1Vc = [[HBText1Controller alloc] init];
    text1Vc.name = @"你好";
    text1Vc.title = @"标题";
    [self.navigationController pushViewController:text1Vc animated:YES];
}

@end
