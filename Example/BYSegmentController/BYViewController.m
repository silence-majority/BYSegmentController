//
//  BYViewController.m
//  BYSegmentController
//
//  Created by silence-majority on 12/18/2017.
//  Copyright (c) 2017 silence-majority. All rights reserved.
//

#import "BYViewController.h"
#import <BYSegmentController/BYSegmentControl.h>
@interface BYViewController ()
@property (nonatomic,strong)BYSegmentControl *segmentControl;
@end

@implementation BYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _segmentControl = [[BYSegmentControl alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 50) segmentTitles:@[@"我的老师",@"我的群组",@"我的同学"]];
    _segmentControl.horizontalMargin = 25;
    [self.view addSubview:_segmentControl];

                       
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
