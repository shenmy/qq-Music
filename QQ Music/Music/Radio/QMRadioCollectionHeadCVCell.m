//
//  QMRadioCollectionHeadCVCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMRadioCollectionHeadCVCell.h"

@interface QMRadioCollectionHeadCVCell ()

@property (nonatomic, strong) UILabel *typelabel;
@property (nonatomic, strong) UILabel *leftLinelabel;
@property (nonatomic, strong) UILabel *rightLinelabel;
@property (nonatomic, strong) NSArray *typeArray;


@end

@implementation QMRadioCollectionHeadCVCell

-(UILabel *)typelabel{
    if (!_typelabel) {
        _typelabel = [UILabel newAutoLayoutView];
        _typelabel.textColor = [UIColor whiteColor];
        _typelabel.text = @"流行";
        _typelabel.textAlignment = NSTextAlignmentCenter;
        _typelabel.font = [UIFont systemFontOfSize:10];
    }
    return _typelabel;
}

-(UILabel *)leftLinelabel{
    if (!_leftLinelabel) {
        _leftLinelabel = [UILabel newAutoLayoutView];
        _leftLinelabel.backgroundColor = [UIColor whiteColor];
    }
    return _leftLinelabel;
}
-(UILabel *)rightLinelabel{
    if (!_rightLinelabel) {
        _rightLinelabel = [UILabel newAutoLayoutView];
        _rightLinelabel.backgroundColor = [UIColor whiteColor];
    }
    return _rightLinelabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    
    return self;
}


-(void)initUI{
    self.typeArray = @[@"热门",@"中午",@"最紧",@"情感",@"主题",@"FM",@"场景",@"语种",@"曲风",@"人群",@"乐器"];
    
    [self.contentView addSubview:self.typelabel];
    [self.contentView addSubview:self.leftLinelabel];
    [self.contentView addSubview:self.rightLinelabel];
    
    [self setupConstraints];
    
    
}

-(void)setupConstraints{
    
    [self.leftLinelabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
    [self.leftLinelabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [self.leftLinelabel autoSetDimension:ALDimensionWidth toSize:80];
    [self.leftLinelabel autoSetDimension:ALDimensionHeight toSize:0.5];
    
    [self.rightLinelabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-20];
    [self.rightLinelabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [self.rightLinelabel autoSetDimension:ALDimensionWidth toSize:80];
    [self.rightLinelabel autoSetDimension:ALDimensionHeight toSize:0.5];
    
    
    [self.typelabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.leftLinelabel withOffset:10];
    [self.typelabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rightLinelabel withOffset:-10];
    [self.typelabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    
}

-(void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{
    
    self.typelabel.text = self.typeArray[indexPath.section];
    
}


@end
