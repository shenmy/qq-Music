//
//  QMMainVC.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/22.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMMainVC.h"
#import "QMMainTitleView.h"
#import "QMFindVC.h"
#import "QMMusicVC.h"
#import "QMMyVC.h"

@interface QMMainVC ()<QMMainTitleViewDelegate,UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (nonatomic, strong)UIImageView *bgImageView;

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *contentPageVCs;
@property (nonatomic, strong)QMMainTitleView *titleView;


@property (nonatomic, strong) QMMyVC *myVC;
@property (nonatomic, strong) QMMusicVC *musicVC;
@property (nonatomic, strong) QMFindVC *findVC;


@end

@implementation QMMainVC

-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [UIImageView newAutoLayoutView];
        _bgImageView.image = [UIImage imageNamed:@"Main_bgImage"];
    }
    return _bgImageView;
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
-(QMMyVC *)myVC{

    if (!_myVC) {
        _myVC = [QMMyVC new];
        
    }
    return _myVC;
}
-(QMMusicVC *)musicVC{
    if (!_musicVC) {
        _musicVC = [QMMusicVC new];
    }
    return _musicVC;
}

-(QMFindVC *)findVC{
    if (!_findVC) {
        _findVC = [QMFindVC new];
    }
    return _findVC;
}

-(NSMutableArray *)contentPageVCs{
    if (!_contentPageVCs) {
        _contentPageVCs = [[NSMutableArray alloc]initWithArray:@[self.myVC,self.musicVC,self.findVC]];
        
    }
    return _contentPageVCs;
}

#pragma mark - UI
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    
    [self initUI];
    // Do any additional setup after loading the view.
}

-(void)initNav{
    
    _titleView = [[QMMainTitleView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    _titleView.delegate = self;
    self.navigationItem.titleView = _titleView;
    
    
    //右边
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
    [rightButton setImage:[UIImage imageNamed:@"Main_search_18"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;

}

-(void)initUI{
    [self.view addSubview:self.bgImageView];
    
    [self.bgImageView autoPinEdgesToSuperviewEdges];
    
    
    [self.pageViewController setViewControllers:@[self.myVC]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];


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
    if (index >= 2) {
        index = 2;
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
    if (index == NSNotFound || index >= 2) {
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
    
    
    // Select tab
    NSUInteger index = [self indexOfViewController:viewController];
    self.titleView.selecteIndex = index + 1;

    
    return;
}


#pragma mark - QMMainTitleViewDelegate
-(void)mainTitleView:(QMMainTitleView *)view clickIndex:(NSInteger)index{
    
    
    UIViewController *viewController = [self viewControllerAtIndex:index-1];
    [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        
    }];

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
