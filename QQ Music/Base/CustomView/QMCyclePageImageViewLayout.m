//
//  QMCyclePageImageViewLayout.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMCyclePageImageViewLayout.h"

@implementation QMCyclePageImageViewLayout

- (instancetype)init
{
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
    }
    return self;
}

- (CGSize)itemSize
{
    return self.collectionView.bounds.size;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    [self invalidateLayout];
    return YES;
}


@end
