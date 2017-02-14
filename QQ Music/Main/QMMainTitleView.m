//
//  QMMainTitleView.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/22.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMMainTitleView.h"


#define buttomFont(size) [UIFont systemFontOfSize:size]

@interface QMMainTitleView ()

@property (nonatomic, strong) UIButton *myBtn;
@property (nonatomic, strong) UIButton *musicBtn;
@property (nonatomic, strong) UIButton *findBtn;


@end

@implementation QMMainTitleView
-(UIButton *)myBtn{
    if (!_myBtn) {
        _myBtn = [UIButton newAutoLayoutView];
        [_myBtn setTitle:@"我的" forState:UIControlStateNormal];
        _myBtn.titleLabel.font = buttomFont(16);
        [_myBtn addTarget:self action:@selector(myBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myBtn;
}
-(UIButton *)musicBtn{
    if (!_musicBtn) {
        _musicBtn = [UIButton newAutoLayoutView];
        [_musicBtn setTitle:@"音乐馆" forState:UIControlStateNormal];
        _musicBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_musicBtn addTarget:self action:@selector(musicClick) forControlEvents:UIControlEventTouchUpInside];


    }
    return _musicBtn;
}
-(UIButton *)findBtn{
    if (!_findBtn) {
        _findBtn = [UIButton newAutoLayoutView];
        [_findBtn setTitle:@"发现" forState:UIControlStateNormal];
        _findBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_findBtn addTarget:self action:@selector(findClick) forControlEvents:UIControlEventTouchUpInside];


    }
    return _findBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initUI];
        
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.selecteIndex = 1;

    [self addSubview:self.myBtn];
    [self addSubview:self.musicBtn];
    [self addSubview:self.findBtn];
    [self setupConstraints];



}
-(void)setupConstraints{
    
    [self.myBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
    [self.myBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
//    [self.myBtn autoSetDimension:ALDimensionWidth toSize:30];
    
    [self.musicBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.myBtn withOffset:20];
    [self.musicBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [self.musicBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.myBtn];
    
    
    [self.findBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.musicBtn withOffset:20];
    [self.findBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
    [self.findBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [self.findBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.myBtn];

}

-(void)setSelecteIndex:(NSInteger)selecteIndex{
    _selecteIndex = selecteIndex;
    if (selecteIndex == 1) {
        self.myBtn.titleLabel.font = buttomFont(16);
        self.musicBtn.titleLabel.font = buttomFont(14);
        self.findBtn.titleLabel.font = buttomFont(14);

    }else if (selecteIndex == 2){
        self.musicBtn.titleLabel.font = buttomFont(16);
        self.myBtn.titleLabel.font = buttomFont(14);
        self.findBtn.titleLabel.font = buttomFont(14);
    }else{
        self.findBtn.titleLabel.font = buttomFont(16);
        self.myBtn.titleLabel.font = buttomFont(14);
        self.musicBtn.titleLabel.font = buttomFont(14);
    }
    
}

#pragma mark - Action
-(void)myBtnClick{
    self.myBtn.titleLabel.font = buttomFont(16);
    self.musicBtn.titleLabel.font = buttomFont(14);
    self.findBtn.titleLabel.font = buttomFont(14);

    if ([self.delegate respondsToSelector:@selector(mainTitleView:clickIndex:)]) {
        [self.delegate mainTitleView:self clickIndex:1];
    }
}

-(void)musicClick{
    self.musicBtn.titleLabel.font = buttomFont(16);
    self.myBtn.titleLabel.font = buttomFont(14);
    self.findBtn.titleLabel.font = buttomFont(14);
    if ([self.delegate respondsToSelector:@selector(mainTitleView:clickIndex:)]) {
        [self.delegate mainTitleView:self clickIndex:2];
    }
}
-(void)findClick{
    self.findBtn.titleLabel.font = buttomFont(16);
    self.myBtn.titleLabel.font = buttomFont(14);
    self.musicBtn.titleLabel.font = buttomFont(14);
    if ([self.delegate respondsToSelector:@selector(mainTitleView:clickIndex:)]) {
        [self.delegate mainTitleView:self clickIndex:3];
    }

}

@end
