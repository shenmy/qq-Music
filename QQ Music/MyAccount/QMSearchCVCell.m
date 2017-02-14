//
//  QMSearchCVCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/23.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMSearchCVCell.h"

@interface QMSearchCVCell ()

@property (nonatomic, strong)UISearchBar *searchBar;

@end

@implementation QMSearchCVCell

-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [UISearchBar newAutoLayoutView];
        _searchBar.placeholder = @"搜索";
//        _searchBar.backgroundColor = [UIColor orangeColor];
        for (UIView *view in _searchBar.subviews)
            
        {
            for (UIView *subview in view.subviews) {
                if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
                    
                {
                    
                    [subview removeFromSuperview];
                    
//                    break;
                    
                }else {
                    subview.backgroundColor =  UIColorFromRGB(0x1e3649);
                }
            }
            
           
            
        }
        
    }
    return _searchBar;
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
    [self.contentView addSubview:self.searchBar];
    
 
    
    [self setupConstraints];
    
    
}

-(void)setupConstraints{
    
    [self.searchBar autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView ];
    [self.searchBar autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView];
    [self.searchBar autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView];
//    [self.searchBar autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-8];

//    [self.searchBar autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.contentView];
//    [self.searchBar autoSetDimension:ALDimensionHeight toSize:40];
//    [self.searchBar autoSetDimension:ALDimensionWidth toSize:40];
    
//    [self.nickLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.iconImageView withOffset:8];
//    [self.nickLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.iconImageView withOffset:2];
//    
//    [self.timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.iconImageView withOffset:-2];
//    [self.timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nickLabel];
//    
//    
}


@end
