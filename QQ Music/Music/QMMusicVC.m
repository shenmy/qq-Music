//
//  QMMusicVC.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/22.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMMusicVC.h"
#import "QMSelectedTypeMusicCVCell.h"

#import "QMEssenceVC.h"
#import "QMRankingVC.h"
#import "QMMusicListVC.h"
#import "QMRadioVC.h"
#import "QMMVVC.h"

@interface QMMusicVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (nonatomic, strong) QMCollectionView *categoryView;


@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, strong) NSMutableArray *contentPageVCs;
@property (nonatomic, strong) QMEssenceVC *essenceVC;
@property (nonatomic, strong) QMRankingVC *rankingVC;
@property (nonatomic, strong) QMMusicListVC *musicListVC;
@property (nonatomic, strong) QMRadioVC *radioVC;
@property (nonatomic, strong) QMMVVC *mvVC;

@end

@implementation QMMusicVC

- (QMCollectionView *)categoryView
{
    if (!_categoryView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _categoryView = [[QMCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _categoryView.backgroundColor = UIColorFromRGB(0x1e3649);;
        _categoryView.dataSource = self;
        _categoryView.delegate = self;
        _categoryView.showsHorizontalScrollIndicator = NO;
        
        [_categoryView registerClass:[QMSelectedTypeMusicCVCell class] forCellWithReuseIdentifier:[QMSelectedTypeMusicCVCell cellReuseIdentifier]];
        
        
    }
    return _categoryView;
}

- (UIPageViewController *)pageViewController
{
    if (!_pageViewController) {
        
        NSDictionary *options =[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        _pageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
    }
    return _pageViewController;
}

-(QMEssenceVC *)essenceVC{
    if (!_essenceVC) {
        _essenceVC = [QMEssenceVC new];
    }
    return _essenceVC;
}
-(QMRankingVC *)rankingVC{
    if (!_rankingVC) {
        _rankingVC = [QMRankingVC new];
    }
    return _rankingVC;
}
-(QMMusicListVC *)musicListVC{
    if (!_musicListVC) {
        _musicListVC = [QMMusicListVC new];
    }
    return _musicListVC;
}
-(QMRadioVC *)radioVC{
    if (!_radioVC) {
        _radioVC = [QMRadioVC new];
    }
    return _radioVC;
}
-(QMMVVC *)mvVC{
    if (!_mvVC) {
        _mvVC = [QMMVVC new];
    }
    return _mvVC;
}

-(NSMutableArray *)contentPageVCs{
    if (!_contentPageVCs) {
        _contentPageVCs = [[NSMutableArray alloc]initWithArray:@[self.essenceVC,self.rankingVC,self.musicListVC,self.radioVC,self.mvVC]];
        
    }
    return _contentPageVCs;
}


#pragma mark - UI

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];


    // Do any additional setup after loading the view.
}

-(void)initUI{
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [self.categoryView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
    [self.view addSubview:self.categoryView];
    
 
    [self.pageViewController setViewControllers:@[self.essenceVC]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
    [self setupConstraints];

    
    
}

-(void)setupConstraints{
    
    [self.categoryView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [self.categoryView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [self.categoryView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view];
    [self.categoryView autoSetDimension:ALDimensionHeight toSize:40];
    
    [self.pageViewController.view autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [self.pageViewController.view autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [self.pageViewController.view autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view];
    [self.pageViewController.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.categoryView];


}

- (UIViewController *)lastContentVC:(UIViewController *)viewController
{
    NSInteger index = [self.contentPageVCs indexOfObject:viewController];
    if (index <= 0) {
        index = 0;
    }else{
        index--;
    }
    return [self.contentPageVCs objectAtIndex:index];
}

- (UIViewController *)nextContentVC:(UIViewController *)viewController
{
    NSInteger index = [self.contentPageVCs indexOfObject:viewController];
    if (index >= 4) {
        index = 4;
    }else{
        index++;
    }
    return [self.contentPageVCs objectAtIndex:index];
}


// 得到相应的VC对象
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    if ((self.contentPageVCs.count == 0) || (index >= self.contentPageVCs.count) ) {
        return nil;
    }
    return [self.contentPageVCs objectAtIndex:index];
}

// 根据数组元素值，得到下标值
- (NSUInteger)indexOfViewController:(UIViewController *)viewController {
    return [self.contentPageVCs indexOfObject:viewController];
}

//-(void)setupConstraints{
//    [self.categoryView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
//    [self.categoryView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
//    [self.categoryView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view];
//    [self.categoryView autoSetDimension:ALDimensionWidth toSize:40];

//}
#pragma mark- UIPageViewControllerDataSource

// 返回上一个ViewController对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:viewController];
    if (index <= 0 || index == NSNotFound) {
        return nil;
    }
    
    UIViewController *contentVC = [self lastContentVC:viewController];
    
    index--;
    
//    contentVC.modelYearListDic =[self.pageContentData safeObjectAtIndex:index];
    
    return contentVC;
    
}

// 返回下一个ViewController对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:viewController];
    if (index == NSNotFound || index >= 4) {
        return nil;
    }
    
    UIViewController *contentVC = [self nextContentVC:viewController];
    index++;
//    contentVC.modelYearListDic =[self.pageContentData safeObjectAtIndex:index];
    return contentVC;
    
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController *viewController = self.pageViewController.viewControllers[0];
//    QMEssenceVC *contentVC = (QMEssenceVC *)viewController;
    
    
    // Select tab
    NSUInteger index = [self indexOfViewController:viewController];

    //选中的item显示
    [self.categoryView selectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    
    return;
}


#pragma mark -UICollectionViewDataSource代理
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    QMSelectedTypeMusicCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMSelectedTypeMusicCVCell cellReuseIdentifier] forIndexPath:indexPath];
    [cell updateWithCellData:nil atIndexPath:indexPath];
    return cell;

}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self dealSelectItemForRow:indexPath.row];
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(SCREEN_WIDTH/5, 40);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


#pragma mark - Action
- (void)dealSelectItemForRow:(NSInteger)aRow
{
    UIViewController *viewController = [self viewControllerAtIndex:aRow];
    [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
