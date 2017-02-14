//
//  QMRadioVC.m
//  QQ Music
//
//  Created by 沈梦月 on 16/8/24.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import "QMRadioVC.h"

#import "QMRadioCollectionCVCell.h"
#import "QMRadioCollectionHeadCVCell.h"

#import "QMRadioTableCell.h"


@interface QMRadioVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) QMCollectionView *collectionView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) BOOL isScrollDown; //记录滚动的方向


@end

@implementation QMRadioVC


-(QMCollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[QMCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[QMRadioCollectionCVCell class] forCellWithReuseIdentifier:[QMRadioCollectionCVCell cellReuseIdentifier]];
        [_collectionView registerClass:[QMRadioCollectionHeadCVCell class] forCellWithReuseIdentifier:[QMRadioCollectionHeadCVCell cellReuseIdentifier]];
        
    }
    return _collectionView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[QMRadioTableCell class] forCellReuseIdentifier:[QMRadioTableCell cellReuseIdentifier]];
    }
    return _tableView;
}


#pragma  mark - UI
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    // Do any additional setup after loading the view.
}

-(void)initUI{
    
    [self.view addSubview:self.collectionView];
    
    [self.view addSubview:self.tableView];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];

    [self setupConstraints];



}
-(void)setupConstraints{

    [self.collectionView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [self.collectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view];
    [self.collectionView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view];

    [self.tableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view];
    [self.tableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view];
    [self.tableView autoSetDimension:ALDimensionWidth toSize:80];
    [self.tableView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.collectionView];

}

#pragma  mark -UICollectionViewDataSource代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 11;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 11;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        QMRadioCollectionHeadCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMRadioCollectionHeadCVCell cellReuseIdentifier] forIndexPath:indexPath];
        [cell updateWithCellData:nil atIndexPath:indexPath];
        return cell;
    }else{
        QMRadioCollectionCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[QMRadioCollectionCVCell cellReuseIdentifier] forIndexPath:indexPath];
        return cell;
    }

    
    
}

//CollectionView分区即将展示
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    // 当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (!_isScrollDown && collectionView.dragging)
    {
        [self selectRowAtIndexPath:indexPath.section];
    }
    
}
//CollectionView分区即将消失
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (_isScrollDown && collectionView.dragging)
    {
        [self selectRowAtIndexPath:indexPath.section + 1];
    }

}

// 当拖动CollectionView的时候，处理TableView
- (void)selectRowAtIndexPath:(NSInteger)index
{
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - UIScrollView Delegate
// 标记一下CollectionView的滚动方向，是向上还是向下
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float lastOffsetY = 0;
    
    if (self.collectionView == scrollView)
    {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}
#pragma mark -UICollectionViewDelegateFlowLayout
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 20);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return CGSizeMake(collectionView.width, 20);

    }else{
        return CGSizeMake((SCREEN_WIDTH-110)/2, (SCREEN_WIDTH-110)/2);

    }
    
}



#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QMRadioTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[QMRadioTableCell cellReuseIdentifier]];
    [cell updateWithCellData:nil atIndexPath:indexPath];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectIndex = indexPath.row;

    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]
                                animated:YES
                          scrollPosition:UITableViewScrollPositionMiddle];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:_selectIndex] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
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
