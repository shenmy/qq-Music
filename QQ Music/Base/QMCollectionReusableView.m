//
//  QMCollectionReusableView.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/23.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMCollectionReusableView.h"

#import "NSObject+BeeNotification.h"


@implementation QMCollectionReusableView

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

- (void)dealloc
{
    [self unobserveAllNotifications];
}


@end
