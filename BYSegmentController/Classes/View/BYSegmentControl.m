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
@property (nonatomic,assign) NSInteger baseTag;

@property (nonatomic,assign) CGFloat segmentMaxWidth;
@property (nonatomic,assign) CGFloat segmentInterSpace;

@end

@implementation BYSegmentControl

- (instancetype)initWithFrame:(CGRect)frame segmentTitles:(NSArray<NSString *> *)titles{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor cyanColor];
        _baseTag = 1000;
        _horizontalMargin = 16;
        _normalColor  = [UIColor darkGrayColor];
        _focusColor = [UIColor redColor];
        _normalFont = [UIFont systemFontOfSize:15];
        _focusFont = [UIFont systemFontOfSize:15];
        _segmentTitles = titles;
        for (NSInteger i = 0; i < _segmentTitles.count; i++){
            BYSegmentBadgeButton *button = [[BYSegmentBadgeButton alloc] init];
            [button setTitle:_segmentTitles[i] forState:UIControlStateNormal];
            [button setTitleColor:_normalColor forState:UIControlStateNormal];
            button.titleLabel.font = _normalFont;
            button.tag = _baseTag + i;
            [button addTarget:self action:@selector(segmentButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:button];
        }
    }
    return self;
}

- (void)layoutSubviews{
    _segmentMaxWidth = [self getMaxSegmentWidth:_segmentTitles font:_normalFont];
    _segmentInterSpace = [self getSegmentInterSpace];
    
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
