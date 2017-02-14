//
//  QMConstraintHelper.h
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QMConstraintHelper : NSObject

/**
 *  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview;

/*  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 *  @param aInsets    相对于父view的缩进
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets;

/*  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 *  @param aInsets    相对于父view的缩进
 *  @param propert    缩进的优先级
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets propert:(CGFloat)property;

/*  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 *  @param aInsets    相对于父view的缩进
 *  @param properts   各方向缩进的优先级
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets propertys:(UIEdgeInsets)propertys;

/**
 *  aViews等分aSuperview的宽或者高
 *
 *  @param aViews
 *  @param aSuperview
 *  @param isHorizontal
 */
+ (void)setViews:(NSArray *)aViews equalToSuperview:(UIView *)aSuperview isHorizontal:(BOOL)isHorizontal;

/**
 *  测试View是否有错误的约束
 *
 *  @return BOOL
 */
+ (void)testAmbiguity:(UIView *)aView;


@end
