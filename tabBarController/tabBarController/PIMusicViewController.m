//
// Created by liuqin.sheng on 11/8/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import "PIMusicViewController.h"
#import "subViewController.h"

@implementation PIMusicViewController {

}
- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PIMusicViewController:viewDidLoad");

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"Music" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];

}

- (void)dealloc {
    NSLog(@"dealloc PIMusicViewController ");
}

- (void)buttonClick {
    subViewController *subViewController1 = [[subViewController alloc] init];
    [self presentViewController:subViewController1 animated:YES completion:^{
        NSLog(@"subViewController1");
    }];
}
@end