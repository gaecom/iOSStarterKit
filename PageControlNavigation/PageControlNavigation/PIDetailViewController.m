//
// Created by liuqin.sheng on 11/8/13.
// Copyright (c) 2013 alipay. All rights reserved.
//


#import "PIDetailViewController.h"


@implementation PIDetailViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PIDetailViewController viewDidLoad");
    //self.view.frame = CGRectMake(320 * j, 0, size.width, size.height);
    //self.view.backgroundColor = [color objectAtIndex:j];

    //UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    //imageView.frame = CGRectMake(0, 0, size.width, size.height);

}

- (id)setImage:(UIImage *)image withColor:(UIColor *)color withIndex:(int)idx {
    CGSize size = [UIScreen mainScreen].bounds.size;
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    imageView.image = image;

    [self.view addSubview:imageView];
    self.view.backgroundColor = color;
    self.view.frame = CGRectMake(320 * idx, 0, size.width, size.height);
    return self.view;
}

@end