//
//  VAMyCenterController.m
//  VagaryArtWorldProject
//
//  Created by metis2017 on 2019/7/11.
//  Copyright © 2019年 metis2017. All rights reserved.
//

#import "VAMyCenterController.h"
#import "VAMyTableHeaderView.h"
#import "VAUserInfoController.h"
#import "VAUserInfoModel.h"
#import "LZCleanCaches.h"
#import "VAFocusController.h"
#import "VAUserFeedBackController.h"
@interface VAMyCenterController ()<UITableViewDelegate,UITableViewDataSource,ClickUserHeaderView>
@property(nonatomic,retain)UITableView *mytableView;
@property(nonatomic,retain)VAMyTableHeaderView *mytableHeaderView;
@property(nonatomic,retain)NSString *cacheCount;
@end

@implementation VAMyCenterController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self.view addSubview:self.mytableView];
}
-(UITableView *)mytableView{
    if (!_mytableView) {
        _mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSystemWidth, KSystemHeight) style:UITableViewStyleGrouped];
        _mytableView.dataSource = self;
        _mytableView.delegate  = self;
        _mytableView.showsVerticalScrollIndicator = NO;
        _mytableView.showsHorizontalScrollIndicator = NO;
        _mytableView.tableHeaderView = self.mytableHeaderView;
        _mytableView.tableFooterView = [[UIView alloc]init];
        _mytableView.separatorColor = VASeparatorColor;
        _mytableView.sectionHeaderHeight = 15;
        _mytableView.sectionFooterHeight = 0;
        _mytableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return _mytableView;
}
-(VAMyTableHeaderView *)mytableHeaderView{
    if (!_mytableHeaderView) {
        _mytableHeaderView = [[VAMyTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, KSystemWidth, 160)];
        _mytableHeaderView.VADelegate = self;
    }
    return _mytableHeaderView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
        cell.backgroundColor = TableViewBackgroundColor;
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel.text = [NSString stringWithFormat:@"%@   我的通知",Kicon_del_heart];
            }
            else if (indexPath.row == 1){
                cell.textLabel.text = [NSString stringWithFormat:@"%@   我的管理",Kicon_edit];
            }
            else if (indexPath.row == 2){
                cell.textLabel.text = [NSString stringWithFormat:@"%@   我的会员",Kicon_edit];
            }
        }
        else if (indexPath.section == 1){
            if (indexPath.row == 0) {
                cell.textLabel.text = [NSString stringWithFormat:@"%@   联系客服",Kicon_del_heart];
            }
            else if (indexPath.row == 1){
                cell.textLabel.text = [NSString stringWithFormat:@"%@   意见反馈",Kicon_edit];
            }
            else if (indexPath.row == 2){
                cell.textLabel.text = [NSString stringWithFormat:@"%@   设置",Kicon_edit];
            }
        }
        cell.textLabel.font = VAMainTitleFont;
        cell.textLabel.textColor = VAMainTitleColor;
        UIFont *iconfont = [UIFont fontWithName:@"iconfont" size: 24];
        NSMutableDictionary * dic=[NSMutableDictionary dictionary];
        dic[NSFontAttributeName]=iconfont;
        dic[NSForegroundColorAttributeName]=VAMainAppColor;
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:cell.textLabel.text];
        [AttributedStr addAttributes:dic
                              range:NSMakeRange(0 , 2)];
        cell.textLabel.attributedText = AttributedStr;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.textLabel.text containsString:@"关注课程"]) {
        VAFocusController *vc = [[VAFocusController alloc]init];
        vc.title = @"关注课程";
        vc.hidesBottomBarWhenPushed = YES;
        KPushViewController(vc)
    }
    else if ([cell.textLabel.text containsString:@"学习记录"]) {
        VAFocusController *vc = [[VAFocusController alloc]init];
        vc.title = @"学习记录";
        vc.hidesBottomBarWhenPushed = YES;
        KPushViewController(vc)
    }
    else if ([cell.textLabel.text containsString:@"意见反馈"]) {
        VAUserFeedBackController *vc = [[VAUserFeedBackController alloc]init];
        vc.title = @"意见反馈";
        KPushViewController(vc)
    }
    else if ([cell.textLabel.text containsString:@"设置"]) {
        [[LZCleanCaches sharedInstance]getCacheSize:^(NSString *size) {
            self.cacheCount = size;
            VAUserInfoController *userInfoVA = [[VAUserInfoController alloc]init];
            NSArray *arr = @[@{@"cellName": @"修改密码",
                               @"cellType": @"text",
                               },
                             @{@"cellName": @"清除缓存",
                               @"cellType": @"text",
                               @"cellSubName": self.cacheCount}];
            userInfoVA.title = @"设置";
            userInfoVA.userInfoArray = [VAUserInfoModel mj_objectArrayWithKeyValuesArray:arr];
            KPushViewController(userInfoVA)
        }];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0.000000001;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 10;
//}
#pragma mark --- 点击头像
-(void)clickUserHeaderView{
    VAUserInfoController *userInfoVA = [[VAUserInfoController alloc]init];
    NSArray *arr = @[@{@"cellName": @"头像",
                       @"cellType": @"image",
                       @"cellSubName": @"https://pics3.baidu.com/feed/11385343fbf2b211ea97e2a09be62d3d0dd78e0a.jpeg?token=cc909389667d61334e6d9df298727a5e&s=CF9018C50CCA3B4770742CA00300D082"},
                     @{@"cellName": @"昵称",
                       @"cellType": @"text",
                       @"cellSubName": @"耿耿于怀"},
                     @{@"cellName": @"性别",
                       @"cellType": @"text",
                       @"cellSubName": @"女"},
                     @{@"cellName": @"身份",
                     @"cellType": @"text",
                     @"cellSubName": @"老师"},
                     @{@"cellName": @"院校",
                     @"cellType": @"text",
                     @"cellSubName": @"中央美院"},
                     @{@"cellName": @"收货地址",
                       @"cellType": @"text",
                       @"cellSubName": @"未选择"}]
    ;
    userInfoVA.title = @"个人资料";
    userInfoVA.userInfoArray = [VAUserInfoModel mj_objectArrayWithKeyValuesArray:arr];
    userInfoVA.hidesBottomBarWhenPushed = YES;
    KPushViewController(userInfoVA)
}
@end
