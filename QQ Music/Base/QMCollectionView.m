//
//  QMCollectionView.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/23.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMCollectionView.h"

#import "QMCollectionViewCell.h"
#import "QMCollectionReusableView.h"

#import "QMWeakObjectDeathNotifier.h"


//category
#import "NSObject+BeeNotification.h"

@implementation QMCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[QMCollectionViewCell class]]) {
        [(QMCollectionViewCell *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[QMCollectionReusableView class]]) {
        [(QMCollectionReusableView *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (void)scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [super scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition
{
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [super selectItemAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}
- (void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id<UICollectionViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    QMWeakObjectDeathNotifier *wo = [QMWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(QMWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
        self.dataSource = nil;
    }];
}

- (void)reloadData
{
    [self.collectionViewLayout invalidateLayout];
    [super reloadData];
}



@end
