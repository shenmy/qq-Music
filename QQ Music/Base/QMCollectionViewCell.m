//
//  QMCollectionViewCell.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/23.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMCollectionViewCell.h"

#import "NSObject+BeeNotification.h"


@implementation QMCollectionViewCell

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (UINib *)nib{
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData
{
    
}

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath
{
    
}

+ (CGSize)sizeForCellData:(id)aData
{
    return CGSizeZero;
}

//这个方法如果滥用，会很恐怖。。。所以不能公开
- (UICollectionView *)__getCollectionView
{
    static int level = 10;
    UICollectionView *collectionView = nil;
    
    UIView *view = self.superview;
    for (int i = 0; i < level; i++) {
        if ([view isKindOfClass:[UICollectionView class]]) {
            collectionView = (UICollectionView *)view;
            break;
        }
        
        if (view.superview) {
            view = view.superview;
        }
        else {
            break;
        }
    }
    
    return collectionView;
}

- (NSIndexPath *)indexPath
{
    if (_indexPath) {
        return _indexPath;
    }
    
    _indexPath = [[self __getCollectionView] indexPathForCell:self];
    return _indexPath;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id)delegate {
    _delegate = delegate;
}


@end
