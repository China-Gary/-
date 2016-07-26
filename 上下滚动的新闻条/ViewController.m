//
//  ViewController.m
//  上下滚动的新闻条
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TZtouTiaoView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TZtouTiaoView *toutiao = [[TZtouTiaoView alloc] init];
    NSMutableArray *imageArr = [[NSMutableArray alloc] init];
    NSArray *titleARR = @[@"2",@"1",@"2",@"1"];
    for (int i = 0; i <titleARR.count; i ++) {
        UIImage *image = [UIImage imageNamed:titleARR[i]];
        [imageArr addObject:image];
    }
    toutiao.headLineArray = imageArr;
    [self.view addSubview:toutiao];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
