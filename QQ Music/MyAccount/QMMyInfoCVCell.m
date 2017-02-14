//
//  QMMyInfoCVCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/23.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMMyInfoCVCell.h"

@interface QMMyInfoCVCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nickLabel;
@property (nonatomic, strong) UILabel *timeLabel;


@end

@implementation QMMyInfoCVCell
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView newAutoLayoutView];
        _bgView.backgroundColor = [UIColor lightGrayColor];
        _bgView.alpha = 0.05;
        
    }
    return _bgView;
}
-(UIImageView *)iconImageView{

    if (!_iconImageView) {
        _iconImageView = [UIImageView newAutoLayoutView];
        _iconImageView.backgroundColor = [UIColor blueColor];
        _iconImageView.layer.cornerRadius = 20;
        _iconImageView.clipsToBounds = YES;
    }
    return _iconImageView;
}

-(UILabel *)nickLabel{
    if (!_nickLabel) {
        _nickLabel = [UILabel newAutoLayoutView];
        _nickLabel.text = @"...";
        _nickLabel.textColor = [UIColor whiteColor];
        _nickLabel.font = [UIFont systemFontOfSize:10];

    }
    return _nickLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.text = @"今日听歌10分钟";
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        
    }
    return _timeLabel;
}

#pragma mark - UI
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initUI];
    }
    return self;
}


-(void)initUI{
    
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nickLabel];
    [self.contentView addSubview:self.timeLabel];
    
    [self setupConstraints];


}

-(void)setupConstraints{
    
    [self.bgView autoPinEdgesToSuperviewEdges];
    
    [self.iconImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:8];
    [self.iconImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.contentView];
    [self.iconImageView autoSetDimension:ALDimensionHeight toSize:40];
    [self.iconImageView autoSetDimension:ALDimensionWidth toSize:40];
    
    [self.nickLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.iconImageView withOffset:8];
    [self.nickLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.iconImageView withOffset:2];
    
    [self.timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.iconImageView withOffset:-2];
    [self.timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nickLabel];


}

@end
