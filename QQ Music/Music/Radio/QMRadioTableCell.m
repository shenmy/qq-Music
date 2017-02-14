//
//  QMRadioTableCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMRadioTableCell.h"

@interface QMRadioTableCell ()

@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) NSArray *typeArray;

@end

@implementation QMRadioTableCell

-(UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.text = @"流行";
        _typeLabel.textColor = [UIColor whiteColor];
        _typeLabel.backgroundColor = [UIColor clearColor];
        _typeLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _typeLabel;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.typeArray = @[@"热门",@"中午",@"最紧",@"情感",@"主题",@"FM",@"场景",@"语种",@"曲风",@"人群",@"乐器"];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.typeLabel];
    
    [self.typeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:30];
    [self.typeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-10];
    [self.typeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.contentView];

    
//    self.contentView.backgroundColor = [UIColor redColor];
}

-(void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{

    self.typeLabel.text = self.typeArray[indexPath.row];
}


-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    self.typeLabel.textColor = selected ? UIColorFromRGB(0x30b979):[UIColor whiteColor];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
