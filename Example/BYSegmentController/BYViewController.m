//
//  BYViewController.m
//  BYSegmentController
//
//  Created by silence-majority on 12/18/2017.
//  Copyright (c) 2017 silence-majority. All rights reserved.
//

#import "BYViewController.h"
#import <BYSegmentController/BYSegmentControl.h>
@interface BYViewController ()<BYSegmentControlDelegate,UIScrollViewDelegate>
@property (nonatomic,strong) BYSegmentControl *segmentControl;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation BYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    _segmentControl = [[BYSegmentControl alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 50) segmentTitles:@[@"我的老师",@"我的群组",@"我的同学"]];
    _segmentControl.horizontalMargin = 25;
    _segmentControl.delegate = self;
    _segmentControl.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_segmentControl];
    [_segmentControl updateBadge:0 forSegmentIndex:0];
    [_segmentControl updateBadge:1 forSegmentIndex:1];
    [_segmentControl updateBadge:1000 forSegmentIndex:2];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+ 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-60-10)];
    _scrollView.backgroundColor = [UIColor magentaColor];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*3, 0);
    [self.view addSubview:_scrollView];
    _scrollView.pagingEnabled = true;
    _scrollView.bounces = false;
    _scrollView.delegate = self;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(500, 200, 100, 100)];
    view.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:view];
    
                       
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelecteSegmentIndex:(NSInteger)index{
    [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*index, 0) animated:true];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_segmentControl updateSegmentWithRatio:_scrollView.contentOffset.x/_scrollView.frame.size.width];
}

@end
