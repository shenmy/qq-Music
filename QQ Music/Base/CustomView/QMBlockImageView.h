//
//  QMBlockImageView.h
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QMBlockImageView;

typedef void(^QMBlockImageViewClickBlock)(QMBlockImageView *sender);


@interface QMBlockImageView : UIImageView

@property (nonatomic, strong) id data;

- (void)setBlock:(QMBlockImageViewClickBlock)block;

@end
