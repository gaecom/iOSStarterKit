//
//  PIViewController.m
//  DataSourceSample
//
//  Created by liuqin.sheng on 11/13/13.
//  Copyright (c) 2013 alipay. All rights reserved.
//

#import "PIViewController.h"

@interface PIViewController () {
    UILabel *nameLabel;
    UILabel *weaLabel;
}
@end

@implementation PIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];

    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"json 解析出错");
    }

    NSString *name = [jsonObj objectForKey:@"name"];
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    nameLabel.text = name;

    NSString *strURL = [[NSString alloc] initWithFormat:@"http://sou.qq.com/online/get_weather.php?city=%@", name];
    NSLog(strURL);
    NSURL *url = [NSURL URLWithString:strURL];
    //NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLCacheStorageAllowedInMemoryOnly timeoutInterval:1000];
    NSError *connectionError;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&connectionError];
    if (connectionError) {
        NSLog(@"%@", connectionError);
    }

    NSLog(@"%@", data);

    NSError *error1;
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];

    weaLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    weaLabel.text = [[resDict objectForKey:@"future"] objectForKey:@"wea_0"];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    self.asyncLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 40)];



    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        // 到主线程更新 UI
        [self performSelectorOnMainThread:@selector(updateAsyncLabel:) withObject:data waitUntilDone:NO];
    }];

    [self.view addSubview:nameLabel];
    [self.view addSubview:weaLabel];
    [self.view addSubview:self.asyncLabel];


}
- (void)updateAsyncLabel:data{
    NSLog(@"updateAsyncLabel:%@",data);
    NSDictionary *resDict2 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"resDict2=%@",resDict2);
    self.asyncLabel.backgroundColor = [UIColor yellowColor];
    self.asyncLabel.text = [[resDict2 objectForKey:@"future"] objectForKey:@"wea_1"];
    self.asyncLabel.textColor = [UIColor blueColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end