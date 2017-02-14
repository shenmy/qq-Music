//
//  QMPlaceholderImageView.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMPlaceholderImageView.h"
#import "UIView+create.h"

@interface QMPlaceholderImageView ()

@property (nonatomic, strong) UIImageView *placeholder;

@end

@implementation QMPlaceholderImageView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
    }
    
    return self;
}

- (void)setupView
{
    self.placeholder = [UIImageView autolayoutView];
    [self addSubview:self.placeholder];
    
    self.placeholder.image = [UIImage imageNamed:@"loadingimg"];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
}

- (void)setImage:(UIImage *)image
{
    [super setImage:image];
    self.placeholder.hidden = (self.image ? YES : NO);
}


@end
