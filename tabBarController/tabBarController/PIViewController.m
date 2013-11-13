//
//  PIViewController.m
//  tabBarController
//
//  Created by liuqin.sheng on 11/8/13.
//  Copyright (c) 2013 alipay. All rights reserved.
//

#import "PIViewController.h"
#import "PIDiscoveryViewController.h"
#import "PIMusicViewController.h"

@interface PIViewController ()

@end

@implementation PIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    PIDiscoveryViewController *discoveryViewController = [[PIDiscoveryViewController alloc] init];
    discoveryViewController.tabBarItem.title = @"Discovery";
    discoveryViewController.tabBarItem.image = [UIImage imageNamed:@"TabBar_Assets.png"];

    PIMusicViewController *musicViewController = [[PIMusicViewController alloc] init];
    musicViewController.tabBarItem.title = @"Music";
    musicViewController.tabBarItem.image = [UIImage imageNamed:@"TabBar_Bill.png"];
    // 设置有几个 Tab
    self.tabBarController.viewControllers = @[
            musicViewController,
            discoveryViewController
    ];
    // 必须设置一个默认 tab,否则显示不正确.
    self.tabBarController.selectedViewController = musicViewController;
    self.tabBarController.selectedIndex = 0;

    [self.view addSubview:self.tabBarController.view];


}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    //NSLog(@"didSelectViewController");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end