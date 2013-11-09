//
//  PIViewController.h
//  tabBarController
//
//  Created by liuqin.sheng on 11/8/13.
//  Copyright (c) 2013 alipay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PIViewController : UIViewController <UITabBarControllerDelegate>
@property(strong, nonatomic) UITabBarController *tabBarController;
@end