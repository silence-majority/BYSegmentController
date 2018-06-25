//
//  XBYSegmentControl.h
//  BYSegmentController_Example
//
//  Created by xy_yanfa_imac on 2018/6/25.
//  Copyright © 2018年 silence-majority. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XBYSegmentControl;
@protocol XBYSegmentControlDataSoure

@required
- (NSArray *)titlesForSegmentControl:(XBYSegmentControl *)segmentControl;

@optional
//如果为0 或者 不实现 则自动计算。
- (CGFloat)intervalBetweenSegmentForSegmentControl:(XBYSegmentControl *)segmentControl;
// 底部滑动条的尺寸 如果为CGSizeZero 或者 不实现 则自适应title。
- (CGSize *)sliderSizeForSegmentControl:(XBYSegmentControl *)segmentControl;
@end

@protocol XBYSegmentControlDelegate
- (void)segment:(XBYSegmentControl *)segment didSelecteSegmentAtIndex:(NSUInteger)index;
@end

@protocol XBYSegmentDelegate

@end

@interface XBYSegmentControl : UIView
@property (nonatomic,assign) UIEdgeInsets *contentInset;
- (UICollectionViewCell<XBYSegmentControlDataSoure> *)hello;

@end
