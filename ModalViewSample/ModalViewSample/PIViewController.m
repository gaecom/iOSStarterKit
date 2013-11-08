//
//  PIViewController.m
//  ModalViewSample
//
//  Created by liuqin.sheng on 11/7/13.
//  Copyright (c) 2013 alipay. All rights reserved.
//

#import "PIViewController.h"
#import "PISignUpViewController.h"

@interface PIViewController ()

@end

@implementation PIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width-40, 40)];
    self.userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.userNameTextField.placeholder = @"请输入用户名";
    [self.view addSubview:self.userNameTextField];

    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 160, self.view.bounds.size.width-40, 40)];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.placeholder = @"请输入密码";
    [self.view addSubview:self.passwordTextField];

    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.frame = CGRectMake(0, 220, self.view.bounds.size.width, 40);
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:self.loginButton];

    self.signUpButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 100) / 2, 280, 100, 40)];
    [self.signUpButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:self.signUpButton];
    [self.signUpButton addTarget:self action:@selector(signUpClick) forControlEvents:UIControlEventTouchUpInside];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(registerCompletion:)
                                                 name:@"registerCompletionNotification"
                                               object:nil];


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) signUpClick{
    PISignUpViewController *signUpViewController = [[PISignUpViewController alloc] init];
    signUpViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:signUpViewController animated:YES completion:^{
        NSLog(@"completion");
    }];
}

- (void) registerCompletion:(NSNotification *) notification{


    NSDictionary *data = [notification userInfo];
    NSString *username = [data objectForKey:@"username"];
    NSLog(@"registerCompletion %@",username);
    self.userNameTextField.text = username;
}

@end