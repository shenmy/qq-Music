//
//  QMCyclePageImageViewCell.h
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMCollectionViewCell.h"
#import "QMPlaceholderImageView.h"

@interface QMCyclePageImageViewCell : QMCollectionViewCell

@property (nonatomic, readonly) QMPlaceholderImageView *imageView;

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(QMBlockImageViewClickBlock)aBlock;

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(QMBlockImageViewClickBlock)aBlock andImageNilBlock:(QMBlockImageViewClickBlock)bBlock;

@end
