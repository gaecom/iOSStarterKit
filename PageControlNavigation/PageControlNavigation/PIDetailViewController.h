//
// Created by liuqin.sheng on 11/8/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface PIDetailViewController : UIViewController
@property(strong, nonatomic) UIViewController *viewController;

- (id)setImage:(UIImage *)image withColor:(UIColor *)color withIndex:(int)idx;
@end