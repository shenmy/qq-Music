//
//  QMCyclePageImageView.h
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMView.h"

@class QMCyclePageImageView,QMPageControl;
@protocol QMCyclePageImageViewDataSource <NSObject>

@required
/**
 *  轮播图数量
 *
 *  @param aPageView
 *
 *  @return
 */
- (NSUInteger)numberOfPagesInPageView:(QMCyclePageImageView *)aPageView;
/**
 *  轮播图view
 *
 *  @param aPageView self
 *  @param aIndex    次序
 *
 *  @return
 */
- (NSString *)pageView:(QMCyclePageImageView *)aPageView imageUrlStringAtIndex:(NSUInteger)aIndex;

//@optional
//
//- (NSArray *)adsOfPageView:(QMCyclePageImageView *)aPageView;

@end

@protocol QMCyclePageImageViewDelegate <NSObject>

@optional
/**
 *  点击事件
 *
 *  @param aPageView
 *  @param aIndex
 */
- (void)pageView:(QMCyclePageImageView *)aPageView didSelectedPageAtIndex:(NSUInteger)aIndex;

/**
 *	功能:从当前页 切换另一页时,此方法会被调用
 *
 *	@param pageView :
 *	@param aIndex   :另一页面的索引
 */
- (void)pageView:(QMCyclePageImageView *)pageView didChangeToIndex:(NSUInteger)aIndex;

/**
 *  功能:非循环页面，滑动到最后一页继续往后滑动
 */
- (void)pageViewScrollEndOfPage:(QMCyclePageImageView *)aPageView;

@end

@interface QMCyclePageImageView : QMView

@property (nonatomic, weak) id <QMCyclePageImageViewDataSource> dataSource;
@property (nonatomic, weak) id <QMCyclePageImageViewDelegate> delegate;

/**
 *  reload之后显示第几个图片
 */
@property (nonatomic) NSInteger startPageIndex;

/**
 *  轮播循环间隔
 */
@property (nonatomic) NSTimeInterval interval;
/**
 *  分页控件
 */
@property (nonatomic, weak) QMPageControl *pageControl;

@property (nonatomic) BOOL disableAutoRunPage;//是否禁止自动轮播

@property (nonatomic) BOOL disableCycle;//是否禁止循环

@property (nonatomic) BOOL disableClickEffect;//是否禁止点击特效

@property (nonatomic) BOOL emptyGridForMonkeyTest;//检测是否有空窗

/**
 *  显示第n个
 *
 *  @param aIndex
 */
- (void)showPageAtIndex:(NSUInteger)aIndex;
- (void)showPageAtIndex:(NSUInteger)aIndex animated:(BOOL)animated;

/**
 *  刷新数据
 */
- (void)reloadData;

- (NSInteger)curragePage;

@end
