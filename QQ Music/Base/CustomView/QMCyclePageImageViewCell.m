//
//  QMCyclePageImageViewCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMCyclePageImageViewCell.h"
#import "UIView+create.h"
#import "QMConstraintHelper.h"

@interface QMCyclePageImageViewCell ()

@property (nonatomic, strong) QMPlaceholderImageView *imageView;

@end

@implementation QMCyclePageImageViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView = [QMPlaceholderImageView autolayoutView];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:self.imageView];
        [QMConstraintHelper setView:self.imageView fullAsSuperview:self.contentView];
    }
    return self;
}

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(QMBlockImageViewClickBlock)aBlock andImageNilBlock:(QMBlockImageViewClickBlock)bBlock
{
    [self.imageView setBlock:^(QMBlockImageView *sender) {
        aBlock(sender);
    }];
    
    if (aUrlString) {
        if (self.contentView.bounds.size.width && self.contentView.bounds.size.height) {
            //NSString *tempString = [JPConvertImageString convertPicURL:aUrlString viewWidth:self.contentView.bounds.size.width viewHeight:self.contentView.bounds.size.height];
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString]];
                    bBlock(nil);
                }
            }];
        }
        else {
            self.imageView.image = nil;
            bBlock(nil);
        }
    }else{
        bBlock(nil);
    }
}

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(QMBlockImageViewClickBlock)aBlock
{
    
    [self.imageView setBlock:^(QMBlockImageView *sender) {
        aBlock(sender);
    }];
    
    if (aUrlString) {
        if (self.contentView.bounds.size.width && self.contentView.bounds.size.height) {
            //NSString *tempString = [JPConvertImageString convertPicURL:aUrlString viewWidth:self.contentView.bounds.size.width viewHeight:self.contentView.bounds.size.height];
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString]];
                }
            }];
        }
        else {
            self.imageView.image = nil;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
