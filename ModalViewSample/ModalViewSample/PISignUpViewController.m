//
// Created by liuqin.sheng on 11/7/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import "PISignUpViewController.h"


@implementation PISignUpViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PISignUpViewController:viewDidLoad");

    self.userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 40)];
    self.userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.userNameTextField.placeholder = @"请输入用户名";
    [self.view addSubview:self.userNameTextField];


    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveButton.frame = CGRectMake(0, 220, self.view.bounds.size.width, 40);
    [self.saveButton setTitle:@"完成" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveButton];
}

- (void)saveButtonClick {
    [self dismissViewControllerAnimated:YES completion:^{

        NSLog(@"dismissViewControllerAnimated");
        NSLog(@"%@",self.userNameTextField.text);

        NSDictionary *dataDict = [NSDictionary dictionaryWithObject:self.userNameTextField.text forKey:@"username"];

        NSLog(@"%@",dataDict);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"registerCompletionNotification"
                                                            object:nil
                                                          userInfo:dataDict];
        NSLog(@"Done!");



    }];
}
@end