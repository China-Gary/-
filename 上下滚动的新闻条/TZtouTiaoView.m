//
//  TZtouTiaoView.m
//  autoMasterTM
//
//  Created by my-pc on 16/5/25.
//  Copyright © 2016年 qianjinding. All rights reserved.
//

#define scrollHeight 40
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#import "TZtouTiaoView.h"

@interface TZtouTiaoView()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *headScrollView;
@property(nonatomic,retain)NSTimer *myTimer;


@end

@implementation TZtouTiaoView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

-(void)creatScrollView:(NSArray*)array
{
    
    
//    //1.左边头条图片
//    self.headImgView = [[UIImageView alloc]init];
//    self.headImgView.image = [UIImage imageNamed:@"主页-切图_51"];
//    self.headImgView.x = 25;
//    self.headImgView.width = 61.5*RWTDTH;
//    self.headImgView.height = 13;
//    self.headImgView.y = scrollHeight/2 - self.headImgView.height/2;
    
//    [self addSubview:self.headImgView];
    
    //2.创建ScrollView
      NSLog(@"333");
    self.headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(50, 50, 150, 30)];
//    self.headScrollView.delegate = self;
    self.headScrollView.backgroundColor = [UIColor grayColor];
    self.headScrollView.contentOffset = CGPointMake(0, 0);
    self.headScrollView.pagingEnabled = YES; // 设置按页移动
    self.headScrollView.bounces = NO; // 取消边框反弹
    self.headScrollView.showsVerticalScrollIndicator = NO;
    self.headScrollView.contentSize = CGSizeMake(self.frame.size.width, self.headScrollView.frame.size.height * array.count);

    [self addSubview:self.headScrollView];
    

}

-(void)creaetImage:(NSArray*)array
{
    NSLog(@"222");
    for (int i = 0; i < array.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.headScrollView.frame.size.height*i, SCREEN_WIDTH -  (SCREEN_WIDTH / 3 + 20), self.headScrollView.frame.size.height)];;
        [imageView setImage:array[i]];
        //图片自适应imageview的大小
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 1010 + i;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//        [imageView addGestureRecognizer:tap];
        
        [self.headScrollView addSubview:imageView];
    }
         self.myTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}


//-(void)tapAction:(UITapGestureRecognizer*)tap
//{
//    
//    [self.delegete pushToNextVc:(UIImageView *)tap.view];
//    
//    
//}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    
//    if (self.headScrollView.contentOffset.y == 0 * self.headScrollView.frame.size.height * RHEIGHT) {
//        self.headScrollView.contentOffset = CGPointMake(0,(self.headLineArray.count - 2) * self.headScrollView.frame.size.height * RHEIGHT);
//    }
//    else if (self.headScrollView.contentOffset.y == (self.headLineArray.count - 1) * self.headScrollView.frame.size.height * RHEIGHT)
//    {
//        
//        
//        self.headScrollView.contentOffset = CGPointMake(0, self.headScrollView.frame.size.height * RHEIGHT);
//        
//        
//    }
//    
//}

-(void)timerAction:(NSTimer *)timer
{
    NSLog(@"444");
    //使用scrollview自带的滚动动画,实现起来效果不好,有bug.所以需要自己写动画效果
    [UIView animateWithDuration:1 animations:^{
        
        [self.headScrollView setContentOffset:CGPointMake(0,self.headScrollView.frame.size.height + self.headScrollView.contentOffset.y) animated:YES];
        
    }];
    if (self.headScrollView.contentOffset.y == self.headScrollView.frame.size.height * (self.headLineArray.count - 2))
    {
        
        self.headScrollView.contentOffset = CGPointMake(0, 0);
        
        CGPoint NEWcontentsize = self.headScrollView.contentOffset;
        NEWcontentsize.y += self.headScrollView.frame.size.height;
    }
    
}
//当手指接触的时候让定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.myTimer invalidate];
    self.myTimer = nil;
}

//当手指离开的时候开始滑动
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
}


-(void)setHeadLineArray:(NSMutableArray *)headLineArray
{
    NSLog(@"1111");
    if (_headLineArray!=headLineArray) {
        _headLineArray = headLineArray;
        
        [self creatScrollView:headLineArray];
        [self creaetImage:headLineArray];
        

    }
    
    

}
@end











