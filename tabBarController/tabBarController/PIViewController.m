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
    PIDiscoveryViewController *discoveryViewController = [[PIDiscoveryViewController alloc] initWithNibName:nil bundle:nil];
    PIMusicViewController *musicViewController = [[PIMusicViewController alloc] initWithNibName:nil bundle:nil];

    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
            musicViewController,
            discoveryViewController, nil];

    [self.view addSubview:self.tabBarController.view];


}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"didSelectViewController");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end