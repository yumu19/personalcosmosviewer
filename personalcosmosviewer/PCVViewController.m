//
//  PCVViewController.m
//  personalcosmosviewer
//
//  Created by Yumura Tsubasa on 2013/08/04.
//  Copyright (c) 2013年 Yumura Tsubasa. All rights reserved.
//

#import "PCVViewController.h"

@interface PCVViewController ()

@end

@implementation PCVViewController {
    UIScrollView* _scrollView;
    UIPageControl* _pageControl;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSInteger pageSize = 3;
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = self.view.bounds;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.delegate = self;

    [_scrollView setContentSize:CGSizeMake((pageSize * width),height)];
    [self.view addSubview:_scrollView];
    
    for (int i = 0; i< pageSize; i++) {
        CGRect frame = CGRectMake(i * width, 0, width, height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        
        NSString *fileName = [NSString stringWithFormat:@"%d.png", i+1];
        UIImage *image = [UIImage imageNamed:fileName];
        imageView.image = image;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:imageView];
    }
    
    CGFloat x = (width-300)/2;
    CGFloat y = height-50;
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(x,y,300,50)];
    _pageControl.backgroundColor = [UIColor blackColor];
    _pageControl.numberOfPages = pageSize;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    if ((NSInteger)fmod(scrollView.contentOffset.x, pageWidth) == 0) {
        _pageControl.currentPage = scrollView.contentOffset.x / pageWidth;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
