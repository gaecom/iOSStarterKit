//
//  PIViewController.m
//  PageControlNavigation
//
//  Created by liuqin.sheng on 11/8/13.
//  Copyright (c) 2013 alipay. All rights reserved.
//

#import "PIViewController.h"
#import "PIDetailViewController.h"

@interface PIViewController ()

@end

@implementation PIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height);
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];

    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 80, self.view.bounds.size.width, 20)];


    NSArray *imageArray = [NSArray arrayWithObjects:@"image1.jpg",
                                                    @"image2.jpg",
                                                    @"image3.jpg", nil];
    self.pageControl.numberOfPages = [imageArray count];
    NSArray *colorArray = [NSArray arrayWithObjects:[UIColor grayColor],
                                                    [UIColor blueColor],
                                                    [UIColor yellowColor],
                                                    nil];

    for (int j = 0; j < [imageArray count]; j++) {

        NSString *imgPath = [imageArray objectAtIndex:j];
        UIImage *image = [UIImage imageNamed:imgPath];
        UIColor *color = [colorArray objectAtIndex:j];

        PIDetailViewController *detailViewController = [[PIDetailViewController alloc] initWithNibName:nil bundle:nil];

        [detailViewController setImage:image withColor:color withIndex:j];
        NSLog(@"addSubview");
        [self.scrollView addSubview:detailViewController.view];
    }
    [self.view addSubview:self.pageControl];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"=scrollViewDidScrollToTop=");
}

@end