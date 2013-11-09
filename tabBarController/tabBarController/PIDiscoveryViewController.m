//
// Created by liuqin.sheng on 11/8/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import "PIDiscoveryViewController.h"


@implementation PIDiscoveryViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PIDiscoveryViewController:viewDidLoad");
    self.tabBarItem.title = @"Discovery";
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    textField.borderStyle = UITextBorderStyleBezel;
    textField.placeholder =@"placeholder";
    [self.view addSubview:textField];
}

@end