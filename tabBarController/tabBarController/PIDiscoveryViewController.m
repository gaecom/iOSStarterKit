//
// Created by liuqin.sheng on 11/8/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import "PIDiscoveryViewController.h"


@implementation PIDiscoveryViewController {

}

- (id) init{
    self = [super init];
    if (!self){
        return nil;
    }

    return self ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PIDiscoveryViewController:viewDidLoad");
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    textField.borderStyle = UITextBorderStyleBezel;
    textField.placeholder =@"placeholder";
    [self.view addSubview:textField];
}

@end