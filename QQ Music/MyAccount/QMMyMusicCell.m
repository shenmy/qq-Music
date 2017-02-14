//
//  QMMyMusicCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/23.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMMyMusicCell.h"

@interface QMMyMusicCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numLabel;


@end

@implementation QMMyMusicCell

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView newAutoLayoutView];
        _bgView.backgroundColor = [UIColor lightGrayColor];
        _bgView.alpha = 0.05;
        
    }
    return _bgView;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor yellowColor];
        
    }
    return _imageView;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.text = @"全部歌曲";
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _nameLabel;
}

-(UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [UILabel newAutoLayoutView];
        _numLabel.text = @"10";
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.font = [UIFont systemFontOfSize:10];
        
    }
    return _numLabel;
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
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numLabel];
    
    [self setupConstraints];
    
    
}

-(void)setupConstraints{
    [self.bgView autoPinEdgesToSuperviewEdges];
    
    [self.imageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:8];
    [self.imageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.contentView];
    [self.imageView autoSetDimension:ALDimensionHeight toSize:40];
    [self.imageView autoSetDimension:ALDimensionWidth toSize:40];
    
    [self.nameLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.imageView];
    [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView withOffset:5];
    
    [self.numLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.imageView];
    [self.numLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:5];
    
    
}
-(void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{
    self.numLabel.hidden = NO;

    self.indexPath = indexPath;
    if (indexPath.row == 0) {
        self.nameLabel.text = @"全部歌曲";
        self.numLabel.text = @"40";
    }else if (indexPath.row == 1){
        self.nameLabel.text = @"下载歌曲";
        self.numLabel.text = @"10";
    }else if (indexPath.row == 2){
        self.nameLabel.text = @"最近播放";
        self.numLabel.text = @"5";
    }else if (indexPath.row == 3){
        self.nameLabel.text = @"我喜欢";
        self.numLabel.text = @"6";

    }else if (indexPath.row == 4){
        self.nameLabel.text = @"下载MV";
        self.numLabel.hidden = YES;
    }else if (indexPath.row == 5){
        self.nameLabel.text = @"听歌识曲";
        self.numLabel.hidden = YES;
    }

}

@end
