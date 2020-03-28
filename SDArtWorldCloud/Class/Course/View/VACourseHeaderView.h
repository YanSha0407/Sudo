//
//  VACourseHeaderView.h
//  SDArtWorldCloud
//
//  Created by metis on 2019/12/12.
//  Copyright © 2019 Sudo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VACourseHeaderView : UICollectionReusableView

@property(nonatomic,strong)UILabel *courseTitle; // 表头

@property(nonatomic,strong)UIButton *moreButton; // 更多

@end

NS_ASSUME_NONNULL_END
