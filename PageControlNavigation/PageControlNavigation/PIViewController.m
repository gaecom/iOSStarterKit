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
    NSArray *imageArray = [NSArray arrayWithObjects:@"image1.jpg",
                                                    @"image2.jpg",
                                                    @"image3.jpg", nil];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * [imageArray count], self.view.bounds.size.height);
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];

    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 80, self.view.bounds.size.width, 20)];


    self.pageControl.numberOfPages = [imageArray count];


    for (int j = 0; j < [imageArray count]; j++) {

        NSString *imgPath = [imageArray objectAtIndex:j];
        UIImage *image = [UIImage imageNamed:imgPath];

        PIDetailViewController *detailViewController = [[PIDetailViewController alloc] initWithNibName:nil bundle:nil];

        [detailViewController setImage:image withIndex:j];
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
    CGPoint offset = scrollView.contentOffset;

    [self.pageControl setCurrentPage:offset.x / [UIScreen mainScreen].bounds.size.width];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    self.pageControl.currentPage = self.scrollView.contentOffset.x / self.view.frame.size.width;
    /**
    *  循环滚动的原理 3 + [1 + 2 + 3] + 1
    *  当滚动到 最后一张图片(1)时,自动跳转到[1](这里没有动画)
    *  当滚动到 第一张 3 时,自动跳转到[3];
    */
//    CGFloat pagewidth = self.scrollView.frame.size.width;
//    int currentPage = floor((self.scrollView.contentOffset.x - pagewidth / 5) / pagewidth) + 1;
////    int currentPage_ = (int)self.scrollView.contentOffset.x/320; // 和上面两行效果一样
////    NSLog(@"currentPage_==%d",currentPage_);
//    if (currentPage == 0) {
//        [self.scrollView scrollRectToVisible:CGRectMake(320 * 5, 0, 320, 460) animated:NO]; // 序号0 最后1页
//    }
//    else if (currentPage == (4)) {
//        [self.scrollView scrollRectToVisible:CGRectMake(320, 0, 320, 460) animated:NO]; // 最后+1,循环第1页
//    }
}

@end