//
//  TPPictureByView.m
//  TanPanProject
//
//  Created by wangan on 2017/10/30.
//  Copyright © 2017年 重庆网安信息技术有限公司. All rights reserved.
//

#import "TPPictureByView.h"
#import "TPPictureCollectionViewCell.h"
static NSString *cellIdef_ = @"cellIdef";

@interface TPPictureByView()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong)UICollectionView  *collectionView;
@property (nonatomic,strong)NSTimer           *timer;
@end


@implementation TPPictureByView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

#pragma mark -

- (void)awakeFromNib
{
    [super awakeFromNib];
    
   
    
    
}

//添加定时器
- (void)addNSTime{
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    //添加到runloop中
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
  //  [timer fire];
    self.timer = timer;
    
    
}

- (void)nextPage
{
    NSInteger indexPage = _collectionView.contentOffset.x / Screen_Width;
    if (indexPage == _pictrueArray.count - 1) {
       // [_collectionView setContentOffset:CGPointMake(Screen_Width, 0) animated:NO];
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        indexPage = 1;
    }
    if (indexPage < _pictrueArray.count - 1 ) {
        
       // [_collectionView setContentOffset:CGPointMake(Screen_Width * (indexPage + 1), 0) animated:YES];
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPage + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
   
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _pictrueArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TPPictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdef_ forIndexPath:indexPath];
    //防止cell复用带来的控件重叠
//    for (UIView *view in cell.contentView.subviews) {
//        [view removeFromSuperview];
//    }
    cell.name = _pictrueArray[indexPath.row];
    

    return cell;

}

#pragma mark - uiscrollviewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
 //   [self addNSTime];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger indexPage = _collectionView.contentOffset.x / Screen_Width;
    if (indexPage == _pictrueArray.count - 1) {
        // [_collectionView setContentOffset:CGPointMake(Screen_Width, 0) animated:NO];
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        indexPage = 1;
    }
    if (indexPage < _pictrueArray.count - 1 ) {
        
        // [_collectionView setContentOffset:CGPointMake(Screen_Width * (indexPage + 1), 0) animated:YES];
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPage + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
    
}



#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(Screen_Width, Screen_Width * 3 / 5);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[TPPictureCollectionViewCell class] forCellWithReuseIdentifier:cellIdef_];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.bounces = NO;
        _collectionView.contentSize = CGSizeMake(_pictrueArray.count  * Screen_Width, 0);
        
        _collectionView.contentOffset = CGPointMake(Screen_Width, 0);

        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self).offset(0);
        }];
        
        
    }
    return _collectionView;
}

- (void)setPictrueArray:(NSArray *)pictrueArray
{
    if (_pictrueArray != pictrueArray) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        [array addObject:pictrueArray[pictrueArray.count - 1]];
        [array addObjectsFromArray:pictrueArray];
        [array addObject:pictrueArray[0]];
        _pictrueArray = (NSArray *)array;
        
        [self addSubview:self.collectionView];
    //    [self addNSTime];
    }
}





@end
