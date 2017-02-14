//
//  QMPageControl.h
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QMPageControl : UIPageControl

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *pageFillColor; //没有选中点的颜色
@property (nonatomic, assign) NSInteger borderWidth;
@property (nonatomic, strong) UIColor *changeColor;
@property (nonatomic, assign) BOOL isChangeColor;

@end
