//
//  BYSegmentControl.m
//  BYSegmentController
//
//  Created by xy_yanfa_imac on 2017/12/18.
//

#import "BYSegmentControl.h"
#import "BYSegmentBadgeButton.h"
#import <Masonry/Masonry.h>

@interface BYSegmentControl()
@property (nonatomic,strong) UIView *slider;
@property (nonatomic,assign) NSInteger baseTag;

@property (nonatomic,assign) CGFloat segmentMaxWidth;
@property (nonatomic,assign) CGFloat segmentInterSpace;
@property (nonatomic,assign) NSInteger focusTag;

@end

@implementation BYSegmentControl

- (instancetype)initWithFrame:(CGRect)frame segmentTitles:(NSArray<NSString *> *)titles{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor cyanColor];
      
        _baseTag = 1000;
        _sliderSize = CGSizeMake(30, 3);
        _focusTag = _baseTag;
        _horizontalMargin = 16;
        _normalSegmentColor  = [UIColor darkGrayColor];
        _focusSegmentColor = [UIColor orangeColor];
        _normalSegmentFont = [UIFont systemFontOfSize:15];
        _focusSegmentFont = [UIFont systemFontOfSize:15];
        _segmentTitles = titles;
        
        for (NSInteger i = 0; i < _segmentTitles.count; i++){
            BYSegmentBadgeButton *button = [[BYSegmentBadgeButton alloc] init];
            button.tag = _baseTag + i;
            button.normalTitleFont = _normalSegmentFont;
            button.focusTitleFont = _focusSegmentFont;
            button.normalTitleColor = _normalSegmentColor;
            button.focusTitleColor = _focusSegmentColor;
            [button setTitle:_segmentTitles[i] forState:UIControlStateNormal];
            if (_focusTag == _baseTag+i){
                [button setStyle:BYSegmentBadgeButtonStyleFocus];
            }else{
                 [button setStyle:BYSegmentBadgeButtonStyleNormal];
            }
            [button addTarget:self action:@selector(segmentButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:button];
        }
        
        _slider = [[UIView alloc] init];
        [self addSubview:_slider];
    }
    return self;
}

- (void)layoutSubviews{
    _segmentMaxWidth = [self getMaxSegmentWidth:_segmentTitles font:_normalSegmentFont];
    _segmentInterSpace = [self getSegmentInterSpace];
    
    _slider.backgroundColor = _focusSegmentColor;
    _slider.frame = CGRectMake(0, 0, _sliderSize.width, _sliderSize.height);
    _slider.clipsToBounds = true;
    _slider.layer.cornerRadius = _sliderSize.height/2;
    _slider.center = CGPointMake(_horizontalMargin + (_segmentMaxWidth+_segmentInterSpace)*(_focusTag-_baseTag) + _segmentMaxWidth/2, self.bounds.size.height - 8);
    
    for(NSInteger i = 0; i < _segmentTitles.count; i++){
        BYSegmentBadgeButton *button = [self viewWithTag:i+_baseTag];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(_horizontalMargin + (_segmentMaxWidth+_segmentInterSpace)*(i));
            make.centerY.offset(0);
            make.height.mas_equalTo(30);
        }];
    }
}

- (void)segmentButtonAction:(id)sender{
    
}

#pragma mark - private
- (CGFloat)getWidthWith:(NSString *)text font:(UIFont *)font{
    NSDictionary *attr=@{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    return size.width;
}

- (CGFloat)getMaxSegmentWidth:(NSArray<NSString *> *)titles font:(UIFont*)font{
    CGFloat maxWidth = 0;
    for (NSString *title in titles){
        CGFloat titleWidth = [self getWidthWith:title font:font];
        if (titleWidth > maxWidth){
            maxWidth = titleWidth;
        }
    }
    return maxWidth+10;
}

- (CGFloat)getSegmentInterSpace{
    return (self.frame.size.width - _horizontalMargin*2 - _segmentTitles.count*_segmentMaxWidth)/(_segmentTitles.count-1);
}

@end
