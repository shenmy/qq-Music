//
//  QMPageControl.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMPageControl.h"

@implementation QMPageControl

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    [super setNumberOfPages:numberOfPages];
    [self updateDots];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    if ([super respondsToSelector:@selector(setCurrentPage:)]) {
        [super setCurrentPage:currentPage];
        [self updateDots];
    }
}

-(void)updateDots
{
    for (UIView *subView in self.subviews) {
        UIColor *currentColor = self.isChangeColor ?self.changeColor :[UIColor whiteColor];
        if (self.currentPage == [self.subviews indexOfObject:subView]) {
            subView.backgroundColor = self.fillColor ?: currentColor;
        }
        else {
            subView.backgroundColor = self.pageFillColor ?: [UIColor clearColor];
        }
        
        subView.layer.borderColor = self.borderColor.CGColor ?: currentColor.CGColor;
        
        subView.layer.borderWidth = self.borderWidth?:1.f;
    }
}



@end
