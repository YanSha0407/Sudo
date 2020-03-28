//
//  VACourseContainerController.m
//  SDArtWorldCloud
//
//  Created by metis on 2019/12/10.
//  Copyright © 2019 Sudo. All rights reserved.
//

#import "VACourseContainerController.h"
#import "YSImageScrollView.h"
#import "VACourseCell.h"
#import "VACourseDetailController.h"
#import "UIButton+Extension.h"
#import "VAPictureCell.h"
#import "VACourseHeaderView.h"
#import "VACategoryController.h"
#define  kPICTUREVOLLECTIOCELL @"VAPictureCell"
#define  kCOURSEVOLLECTIOCELL @"VACourseCell"
#define  HEADER_IDENTIFIER @"UICollectionReusableView"
#define  COURSEHEADER_IDENTIFIER @"VACourseHeaderView"
#define VAImageScrollViewHight 120
#define VACategoryBtnViewHight 160
@interface VACourseContainerController ()<UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic,retain) UICollectionView *courseCollectionView;
@property (assign, nonatomic) CGFloat collectionViewCellWidth;
@property (nonatomic,strong) YSImageScrollView *sectionHeadView;
@property (nonatomic,strong) UIView *categoryBtnView;
@end

@implementation VACourseContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, self.view.width - VAMarginLength *2, self.view.height);
    CGFloat radius = 15.0f;
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
       //设置大小
    maskLayer.frame = self.view.bounds;
       //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.view.layer.mask = maskLayer;
    self.view.backgroundColor = RGBColor(249, 249, 249);;
    [self.view addSubview:self.courseCollectionView];
}
-(UICollectionView *)courseCollectionView{
    if (!_courseCollectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
        layout.minimumColumnSpacing = 8;
        layout.minimumInteritemSpacing = 8;
        if (IS_IPAD) {
            if ([self.title isEqualToString:@"视频"]) {
                 layout.columnCount = 3;
            }
            else{
                layout.columnCount = 5;
            }
            
        }
        else{
            if ([self.title isEqualToString:@"视频"]) {
                 layout.columnCount = 2;
            }
            else{
                 layout.columnCount = 3;
            }
           
        }
        self.collectionViewCellWidth = (KSystemWidth -layout.sectionInset.left-layout.sectionInset.right-(layout.columnCount-1)*layout.minimumColumnSpacing) / layout.columnCount;
        self.courseCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        self.courseCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.courseCollectionView.dataSource = self;
        self.courseCollectionView.delegate = self;
        self.courseCollectionView.showsVerticalScrollIndicator = NO;
        self.courseCollectionView.showsHorizontalScrollIndicator = NO;
        [self.courseCollectionView  registerClass:[VAPictureCell class] forCellWithReuseIdentifier:kPICTUREVOLLECTIOCELL];
        [self.courseCollectionView  registerClass:[VACourseCell class] forCellWithReuseIdentifier:kCOURSEVOLLECTIOCELL];
        [self.courseCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:HEADER_IDENTIFIER];
         [self.courseCollectionView registerClass:[VACourseHeaderView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:COURSEHEADER_IDENTIFIER];
        self.courseCollectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self headerRefreshBegin];
        }];
        self.courseCollectionView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self footerRefreshBegin];
        }];
        if ([self.courseCollectionView.mj_header isRefreshing]) {
            [self.courseCollectionView.mj_header endRefreshing];
        }
        self.courseCollectionView.backgroundColor = VAClearColor;
    }
    return _courseCollectionView;
}
-(void)headerRefreshBegin{
    
}
-(void)footerRefreshBegin{
    
}
#pragma mark ----- 顶部banner
-(YSImageScrollView *)sectionHeadView{
    if (!_sectionHeadView) {
        YSImageScrollView *sectionHeadView = [[YSImageScrollView alloc]initWithFocusImgNumber:4];
        sectionHeadView.backgroundColor = VAWhiteColor;
        KClipsCornerRadius(sectionHeadView, 15);
        _sectionHeadView = sectionHeadView;
    }
    return _sectionHeadView;
}
#pragma mark ----- 顶部八个按钮
-(UIView *)categoryBtnView{
    if (!_categoryBtnView) {
        _categoryBtnView = [[UIView alloc]init];
        _categoryBtnView.frame = CGRectMake(0, 0, KSystemWidth -VAMarginLength * 2, VACategoryBtnViewHight);
        _categoryBtnView.backgroundColor = VAWhiteColor;
        KClipsCornerRadius(_categoryBtnView, 15);
        [self addVideoCategory];
    }
    return _categoryBtnView;
}
-(void)addVideoCategory{
    int count = 4;//一行四个icon
    CGFloat iconWidth = self.categoryBtnView.width/count;
    CGFloat iconHeight = (VACategoryBtnViewHight - 10)/2;
    for (int i = 0; i < 8; i++ ) {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = i;
        btn.backgroundColor = VAClearColor;
        [btn setImage:VAImage(@"huahua") forState:UIControlStateNormal];
        [btn setTitle:@"画画" forState:UIControlStateNormal];
        [btn setTitleColor:VAMainTitleColor forState:UIControlStateNormal];
        btn.titleLabel.font = VASubTitleFont;
        [self.categoryBtnView addSubview:btn];
        CGFloat x = 0;
        CGFloat y = (i/count)*iconHeight;
        if (i < 4) {
            x = i*iconWidth;
        }
        else{
            x = (i-4)*iconWidth;
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(x);
            make.top.mas_equalTo(y);
            make.width.mas_equalTo(iconWidth);
            make.height.mas_equalTo(iconHeight);
        }];
        [btn addTarget:self action:@selector(clickCatagoryBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setUpImageAndDownLableWithSpace:10];
        
    }
}
#pragma mark ----- UICollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else{
        return 10;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.title isEqualToString:@"视频"]) {
        VACourseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCOURSEVOLLECTIOCELL forIndexPath:indexPath];
        return cell;
    }
    else{
        VAPictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPICTUREVOLLECTIOCELL forIndexPath:indexPath];
        return cell;
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    VACourseDetailController *vc = [[VACourseDetailController alloc]init];
    KPushViewController(vc)
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionViewCellWidth, self.collectionViewCellWidth);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
     if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
         if (indexPath.section == 0) {
           UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:HEADER_IDENTIFIER forIndexPath:indexPath];
             [reusableView addSubview:self.categoryBtnView];
             [reusableView addSubview:self.sectionHeadView];
             reusableView.backgroundColor = VAClearColor;
             
           return reusableView;
         }
         else{
             VACourseHeaderView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:COURSEHEADER_IDENTIFIER forIndexPath:indexPath];
             return reusableView;
         }
     }
    return nil;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return VACategoryBtnViewHight + VAImageScrollViewHight + 20;
    }
    else{
        return 30;
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    int contentOffsety = scrollView.contentOffset.y;
//    if (contentOffsety<=170) {
//        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
//        self.navigationItem.titleView = self.searchController.searchBar;
//        self.navigationItem.leftBarButtonItem = nil;
//    }else{
//        UILabel *la = [[UILabel alloc]init];
//        la.text = @"课程";
//        la.textColor = VAWhiteColor;
//        la.font = [UIFont systemFontOfSize:18];
//        self.navigationItem.titleView = la;
//        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_search"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLogin)];
//    }
//    self.navigationController.navigationBar.barTintColor = VAMainAppColor;
}

-(void)loadViewIfNeeded{
    [super loadViewIfNeeded];
    self.categoryBtnView.frame = CGRectMake(0, 0, KSystemWidth, VACategoryBtnViewHight);
    self.sectionHeadView.frame = CGRectMake(0, self.categoryBtnView.bottom + 10, KSystemWidth, VAImageScrollViewHight);
}
#pragma mark - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self.view;
}

#pragma mark --- 点击 分类按钮
-(void)clickCatagoryBtn:(UIButton *)btn{
    VACategoryController *categoryController = [[VACategoryController alloc] init];
    KPushViewController(categoryController)
}
@end
