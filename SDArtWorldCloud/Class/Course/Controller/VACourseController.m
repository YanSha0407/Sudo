//
//  VACourseController.m
//  VagaryArtWorldProject
//
//  Created by metis2017 on 2019/7/11.
//  Copyright © 2019年 metis2017. All rights reserved.
//  课程主页

#import "VACourseController.h"
#import "YSImageScrollView.h"
#import "VALoginController.h"
#import "VACourseContainerController.h"
@interface VACourseController ()<QMUISearchControllerDelegate,JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic,strong) UIView *topBackView;
@property (nonatomic,strong) NSMutableArray *bannerMutableArray;
@property (nonatomic,strong) NSMutableArray *categoryMutableArray;
@property (nonatomic,strong) QMUISearchBar *searchBar;
@property(nonatomic,strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@end

@implementation VACourseController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //处于第一个item的时候，才允许屏幕边缘手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    self.view.backgroundColor = RGBColor(249, 249, 249);
    [self.view addSubview:self.topBackView];
    [self.view addSubview:self.listContainerView];
    [self.view addSubview:self.categoryView];
    
}

    
-(UIView *)topBackView{
    if (!_topBackView) {
        _topBackView = [[UIView alloc]init];
        _topBackView.backgroundColor = VAMainAppColor;
        CGRect rect = CGRectMake(0, 0, KSystemWidth, 250);
        CGFloat radius = 30.0f;
        UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
           //设置大小
        maskLayer.frame = _topBackView.bounds;
           //设置图形样子
        maskLayer.path = maskPath.CGPath;
        _topBackView.layer.mask = maskLayer;
        [_topBackView addSubview:self.searchBar];
    }
    return _topBackView;
}
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
       _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, NavigationContentTopConstant, KSystemWidth, 40)];
       _categoryView.delegate = self;
       _categoryView.titles = @[@"图片", @"视频",@"文字",@"图片", @"视频",@"直播"];
       _categoryView.listContainer = self.listContainerView;
       _categoryView.titleColor = VAMainTitleColor;
       _categoryView.titleSelectedColor = VAMainTitleColor;
       _categoryView.titleFont = VAMainBlodTitleFont;
       _categoryView.titleColorGradientEnabled = YES;
       _categoryView.titleLabelZoomEnabled = YES;
//        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
//        lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
//        _categoryView.indicators = @[lineView];
    }
    return _categoryView;
}
- (JXCategoryListContainerView *)listContainerView {
    if (_listContainerView == nil) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContainerView;
}

#pragma mark - JXCategoryViewDelegate
//点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index{
      self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

#pragma mark - JXCategoryListContainerViewDelegate

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    NSString *str = self.categoryView.titles[index];
    if ([str isEqualToString:@"直播"]) {
        return nil;
    }
    else{
        VACourseContainerController *courseContainer = [[VACourseContainerController alloc]init];
        courseContainer.title = str;
        return courseContainer;
    }
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.categoryView.titles.count;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.topBackView.frame = CGRectMake(0, 0, KSystemWidth, 250);
    self.searchBar.frame = CGRectMake(80, StatusBarHeightConstant, KSystemWidth - 100, 40);
    self.listContainerView.frame = CGRectMake(VAMarginLength,NavigationContentTopConstant + 45, self.view.bounds.size.width - VAMarginLength * 2 , self.view.bounds.size.height);// 35 + NavigateHeight
}

-(void)clickLogin{
    VALoginController *vc = [[VALoginController alloc]init];
    KPushViewController(vc)
}

#pragma mark ----- 搜索框
-(QMUISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[QMUISearchBar alloc]init];
        _searchBar.searchTextField.backgroundColor = VAWhiteColor;
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.backgroundColor = VAMainAppColor;
        _searchBar.placeholder = @"搜索素材";
    }
    return _searchBar;
}
-(NSMutableArray *)bannerMutableArray{
    if (!_bannerMutableArray) {
        _bannerMutableArray = [NSMutableArray array];
    }
    return _bannerMutableArray;
}
-(NSMutableArray *)categoryMutableArray{
    if (!_categoryMutableArray) {
        _categoryMutableArray = [NSMutableArray array];
    }
    return _categoryMutableArray;
}

@end
