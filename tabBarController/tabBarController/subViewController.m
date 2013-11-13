//
// Created by liuqin.sheng on 11/13/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import "subViewController.h"


@implementation subViewController {

}
- (id) init{
    self = [super init];
    return self;
}
- (void)viewDidLoad {
    NSLog(@"subViewCOntroller did load");
    self.view.backgroundColor = [UIColor blueColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button setTitleColor: [UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void) buttonClick{
    NSLog(@"back");
    [self dismissViewControllerAnimated:YES completion:^{}];
}
@end