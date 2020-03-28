//
//  UIButton+Extension.h
//  SDArtWorldCloud
//
//  Created by metis on 2019/11/18.
//  Copyright © 2019 Sudo. All rights reserved.
//

#import "VACategoryRightCollectionCell.h"

@interface VACategoryRightCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *goodImageView;
@property (nonatomic, retain) UILabel *goodNameLabel;

@end

@implementation VACategoryRightCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    self.goodImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width)];
    self.goodImageView.centerX = self.width/2;
    KClipsCornerRadius(self.goodImageView, 5);
    [self.contentView addSubview:self.goodImageView];
    self.goodImageView.backgroundColor = VAGrayUnUseColor;
    
    self.goodNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.goodImageView.frame), self.width, 20)];
    self.goodNameLabel.textAlignment = NSTextAlignmentCenter;
    self.goodNameLabel.text = @"niaho";
//    [self.contentView addSubview:self.goodNameLabel];
}


@end

@interface VACategoryRightHeaderView : UICollectionReusableView
@property (nonatomic, retain) UILabel *titleLabel;
@end

@implementation VACategoryRightHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, self.width-30, 97)];
//    [self addSubview:imageView];
    KImageViewURl(imageView, @"https://himg2.huanqiucdn.cn/attachment2010/2019/1120/20191120050413173.jpg");
    self.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, self.width, 30)];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel = titleLabel;
    self.titleLabel.text = @"标题";
    titleLabel.font = VASubTitleFont;
    [self addSubview:titleLabel];
    
}

@end

@interface VACategoryRightCollectionCell ()<UICollectionViewDelegate, UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic, strong) UIButton *allBtn;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSString *titleStr;
@property (assign, nonatomic) CGFloat collectionViewCellWidth;
@property (nonatomic, strong) VACategoryRightHeaderView *headerView;

@end

@implementation VACategoryRightCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self creatSubViews];
    }
    return self;
}
- (void)creatSubViews {
    CHTCollectionViewWaterfallLayout *flowLayout = [[CHTCollectionViewWaterfallLayout alloc]init];
    flowLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    flowLayout.minimumColumnSpacing = 8;
    flowLayout.minimumInteritemSpacing = 8;
    CGFloat width = KSystemWidth - 100;
    if (IS_IPAD) {
        flowLayout.columnCount = 5;
    }
    else{
        flowLayout.columnCount = 3;
    }
    self.collectionViewCellWidth = (KSystemWidth -flowLayout.sectionInset.left-flowLayout.sectionInset.right-(flowLayout.columnCount-1)*flowLayout.minimumColumnSpacing) / flowLayout.columnCount;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, KSystemHeight - NavigateHeight - TabBarHeight) collectionViewLayout:flowLayout];
    self.collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerClass:NSClassFromString(@"VACategoryRightCell") forCellWithReuseIdentifier:@"VACategoryRightCell"];
    [collectionView registerClass:NSClassFromString(@"VACategoryRightHeaderView")  forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"VACategoryRightHeaderView"];
    [self addSubview:collectionView];
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    VACategoryRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VACategoryRightCell" forIndexPath:indexPath];
    cell.goodNameLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if([kind isEqualToString:CHTCollectionElementKindSectionHeader]){
        VACategoryRightHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"VACategoryRightHeaderView" forIndexPath:indexPath];
        self.headerView = headerView;
         self.headerView.titleLabel.text = self.titleStr;
        return headerView;
    } else {
        return 0;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionViewCellWidth, self.collectionViewCellWidth);
}

- (void)setSectionTitle:(NSString *)sectionTitle {
    self.titleStr = sectionTitle;
    [self.collectionView reloadData];
}

- (void)setCount:(NSInteger)count {
    _count = count;
    [self.collectionView reloadData];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return VACategoryBtnViewHight + VAImageScrollViewHight + 20;
//    }
//    else{
        return 33;
//    }
}

@end
