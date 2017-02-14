//
//  QMSelectedTypeMusicCVCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/23.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMSelectedTypeMusicCVCell.h"

@interface QMSelectedTypeMusicCVCell ()

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation QMSelectedTypeMusicCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initUI];
    }
    
    return self;
}


- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor whiteColor];
        //_nameLabel.text = @"2016";
    }
    return _nameLabel;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UIView newAutoLayoutView];
        _bottomLine.backgroundColor = UIColorFromRGB(0x30b979);
        _bottomLine.hidden = YES;
    }
    return _bottomLine;
}

- (void)initUI{

    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.bottomLine];
    
    [self.nameLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 2, 0)];
    [self.bottomLine autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(38, 0, 0, 0)];
    
}


-(void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.nameLabel.text = @"精选";
    }else if (indexPath.row == 1){
        self.nameLabel.text = @"排行";

    }else if (indexPath.row == 2){
        self.nameLabel.text = @"歌单";
        
    }else if (indexPath.row == 3){
        self.nameLabel.text = @"电台";
        
    }else if (indexPath.row == 4){
        self.nameLabel.text = @"MV";
        
    }
}


- (void)setSelected:(BOOL)selected{
    self.bottomLine.hidden = !selected;
    
    self.nameLabel.textColor = selected ? UIColorFromRGB(0x30b979):[UIColor whiteColor];
}

@end
