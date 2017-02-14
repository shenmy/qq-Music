//
//  QMEssenceVC.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMEssenceVC.h"
#import "QMCyclePageImageView.h"
#import "QMPageControl.h"

@interface QMEssenceVC ()<QMCyclePageImageViewDelegate,QMCyclePageImageViewDataSource>

@property (nonatomic,strong)QMCyclePageImageView *pageView;
@property (nonatomic,strong)QMPageControl *pageControl;

@property (nonatomic,strong)NSArray *adsArray;//广告数组

@end

@implementation QMEssenceVC
- (QMCyclePageImageView *)pageView{
    if (!_pageView) {
        _pageView = [QMCyclePageImageView newAutoLayoutView];
        _pageView.dataSource = self;
        _pageView.delegate = self;
    }
    return _pageView;
}

- (QMPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [QMPageControl newAutoLayoutView];
        
    }
    return _pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //测试广告
    self.adsArray = @[@"http://posts.cdn.wallstcn.com/e4/42/c8/243110454432623041.jpg",
                      @"http://posts.cdn.wallstcn.com/6f/13/43/342-15061fz4052h.jpg",
                      @"http://posts.cdn.wallstcn.com/d5/15/ea/1-pic.jpg"];
    
    [self initUI];
    [self.pageView reloadData];

    // Do any additional setup after loading the view.
}


- (void)initUI{
    
//    [self.view addSubview:self.tableView];
    [self.view addSubview:self.pageView];
    [self.view addSubview:self.pageControl];
    self.pageView.pageControl = self.pageControl;
    
//    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 126, 0)];
    
    [self.pageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [self.pageView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [self.pageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view];
    [self.pageView autoSetDimension:ALDimensionHeight toSize:160];

    
    [self.pageControl autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:20];
    [self.pageControl autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-20];
    [self.pageControl autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.pageView withOffset:-15];
    [self.pageControl autoSetDimension:ALDimensionHeight toSize:20];
    
}

#pragma mark - JPCyclePageImageViewDataSource
- (NSUInteger)numberOfPagesInPageView:(QMCyclePageImageView *)aPageView {
    
    return self.adsArray.count;//滚动广告数量
}

- (NSString *)pageView:(QMCyclePageImageView *)aPageView imageUrlStringAtIndex:(NSUInteger)aIndex {
    
    return [self.adsArray objectAtIndex:aIndex];//图片地址
    
}

- (void)pageView:(QMCyclePageImageView *)aPageView didSelectedPageAtIndex:(NSUInteger)aIndex{
    
    //
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
