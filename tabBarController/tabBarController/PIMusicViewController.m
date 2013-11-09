//
// Created by liuqin.sheng on 11/8/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import "PIMusicViewController.h"


@implementation PIMusicViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PIMusicViewController:viewDidLoad");
    self.tabBarItem.title = @"Music";

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text =@"Music";
    [self.view addSubview:label];
}

@end