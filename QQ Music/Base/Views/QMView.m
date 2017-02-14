//
//  QMView.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMView.h"
#import "NSObject+BeeNotification.h"


@implementation QMView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
