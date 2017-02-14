//
//  QMBlockImageView.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMBlockImageView.h"

@interface QMBlockImageView ()

@property (nonatomic, copy) QMBlockImageViewClickBlock clickBlock;


@end

@implementation QMBlockImageView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.userInteractionEnabled = NO;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPressedImageView:)];
    [self addGestureRecognizer:tap];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPressedImageView:)];
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

- (void)onPressedImageView:(QMBlockImageView *)sender;
{
    if (self.clickBlock) {
        self.clickBlock(self);
    }
}

- (void)setBlock:(QMBlockImageViewClickBlock)block
{
    self.clickBlock = block;
    if (self.clickBlock) {
        self.userInteractionEnabled = YES;
    }
    else {
        self.userInteractionEnabled = NO;
    }
}



@end
