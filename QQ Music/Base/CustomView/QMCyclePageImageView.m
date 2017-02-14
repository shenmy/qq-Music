//
//  QMCyclePageImageView.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMCyclePageImageView.h"
#import "QMCyclePageImageViewLayout.h"
#import "QMCyclePageImageViewCell.h"
#import "QMConstraintHelper.h"
#import "QMPageControl.h"

@interface QMCyclePageImageView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) QMCollectionView *contentView;
@property (nonatomic) NSUInteger totalPageCount;
@property (nonatomic) NSUInteger pageCount;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic) NSInteger currentPage;

@end

@implementation QMCyclePageImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _JPPageView_setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self _JPPageView_setup];
}

- (void)_JPPageView_setup
{
    self.interval = 5.f;
    
    self.contentView = [[QMCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[QMCyclePageImageViewLayout new]];
    [self addSubview:self.contentView];
    [self.contentView registerClass:[QMCyclePageImageViewCell class] forCellWithReuseIdentifier:[QMCyclePageImageViewCell cellReuseIdentifier]];
    [QMConstraintHelper setView:self.contentView fullAsSuperview:self];
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.scrollsToTop = NO;
    self.contentView.pagingEnabled = YES;
    self.contentView.dataSource = self;
    self.contentView.delegate = self;
    self.contentView.bounces = NO;
    self.contentView.showsHorizontalScrollIndicator = NO;
}

- (NSUInteger)totalPageCount
{
    if (self.disableCycle) {
        return self.pageCount;
    }
    else {
        return self.pageCount ? (self.pageCount + 2) : 0;
    }
}

- (NSInteger)curragePage{
    return self.curragePage;
}

- (void)reloadData
{
    [self.timer invalidate];
    
    self.pageCount = [self.dataSource numberOfPagesInPageView:self];
    self.pageControl.numberOfPages = self.pageCount;
    
    if (self.pageCount <= 1) {
        self.disableCycle = YES;
        self.contentView.scrollEnabled = NO;
        self.pageControl.hidden = YES;
    } else {
        self.disableCycle = NO;
        self.contentView.scrollEnabled = YES;
        self.pageControl.hidden = NO;
    }
    
    [self.contentView reloadData];
    
    if (self.startPageIndex) {
        [self.contentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.startPageIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    [self runAutoPage];
    
}



- (void)runAutoPage
{
    [self.timer invalidate];
    if (self.totalPageCount && !self.disableAutoRunPage) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(runCyclePageImageView) userInfo:nil repeats:YES];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)runCyclePageImageView
{
    if (self.totalPageCount && !self.disableAutoRunPage) {
        NSIndexPath *indexPath = [[self.contentView indexPathsForVisibleItems] firstObject];
        NSInteger nextIndex = indexPath.item + 1;
        if (nextIndex < self.totalPageCount) {
            [self.contentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
            
            if (nextIndex < self.pageCount) {
                self.pageControl.currentPage = nextIndex;
            }
            if ([self.delegate respondsToSelector:@selector(pageView:didChangeToIndex:)]) {
                [self.delegate pageView:self didChangeToIndex:nextIndex];
            }
            
            if ([self.delegate respondsToSelector:@selector(pageView:didChangeToIndex:)] && self.disableCycle) {
                if (nextIndex + 1 == self.pageCount) {
                    [self.delegate pageViewScrollEndOfPage:self];
                }
            }
        }
    }
}

- (void)setDisableAutoRunPage:(BOOL)disableAutoRunPage
{
    _disableAutoRunPage = disableAutoRunPage;
    [self runAutoPage];
}

- (void)showPageAtIndex:(NSUInteger)aIndex
{
    [self showPageAtIndex:aIndex animated:NO];
}

- (void)showPageAtIndex:(NSUInteger)aIndex animated:(BOOL)animated
{
    if (aIndex < self.pageCount) {
        [self.contentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:aIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:animated];
    }
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
    UICollectionView *cv = (UICollectionView *)scrollView;
    NSIndexPath *indexPath = [cv indexPathForItemAtPoint:scrollView.contentOffset];
    if (indexPath.item == 0 && !self.disableCycle) {
        [self.contentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.pageCount inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];//只是为了少写代码
    [self runAutoPage];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    UICollectionView *cv = (UICollectionView *)scrollView;
    NSIndexPath *indexPath = [cv indexPathForItemAtPoint:scrollView.contentOffset];
    
    self.pageControl.currentPage = indexPath.item % self.pageCount;
    if ([self.delegate respondsToSelector:@selector(pageView:didChangeToIndex:)]) {
        [self.delegate pageView:self didChangeToIndex:indexPath.item % self.pageCount];
    }
    
    if ([self.delegate respondsToSelector:@selector(pageView:didChangeToIndex:)] && self.disableCycle) {
        if ((indexPath.item % self.pageCount) + 1 == self.pageCount) {
            [self.delegate pageViewScrollEndOfPage:self];
        }
    }
    
    if (!self.disableCycle) {
        if (indexPath.item == 0) {
            [self.contentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.pageCount inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        }
        else if (indexPath.item + 1 == self.totalPageCount) {
            [self.contentView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        }
    }
}

#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return self.totalPageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    QMCyclePageImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMCyclePageImageViewCell cellReuseIdentifier] forIndexPath:indexPath];
    
    WEAK_SELF;
    [cell updateWithImageUrlString:[self.dataSource pageView:self imageUrlStringAtIndex:indexPath.item % self.pageCount] andClickBlock:^(QMBlockImageView *sender) {
        STRONG_SELF;
        if (!self.disableClickEffect) {
            self.layer.opacity = .5f;
            [UIView animateWithDuration:.5f animations:^{
                self.layer.opacity = 1.f;
            }];
        }
        [self.delegate pageView:self didSelectedPageAtIndex:indexPath.item % self.pageCount];
    } andImageNilBlock:^(QMBlockImageView *sender) {
        STRONG_SELF;
        self.emptyGridForMonkeyTest = sender?NO:YES;
    }];
    
    return cell;
}

@end
