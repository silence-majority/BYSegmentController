//
//  BYSegmentControl.h
//  BYSegmentController
//
//  Created by xy_yanfa_imac on 2017/12/18.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BYSegmentControlSliderStyle){
    BYSegmentControlSliderStyleConstant = 0,
    BYSegmentControlSliderStyleFitTitle
};

@interface BYSegmentControl : UIView
@property (nonatomic,copy) NSArray<NSString *> *segmentTitles;
@property (nonatomic,assign) CGFloat horizontalMargin;
@property (nonatomic,strong) UIColor *normalColor;
@property (nonatomic,strong) UIColor *focusColor;
@property (nonatomic,strong) UIFont *normalFont;
@property (nonatomic,strong) UIFont *focusFont;
@property (nonatomic,assign) BYSegmentControlSliderStyle sliderStyle;
@property (nonatomic,assign) CGSize sliderSize;

- (instancetype)initWithFrame:(CGRect)frame segmentTitles:(NSArray<NSString *> *)titles;
@end
