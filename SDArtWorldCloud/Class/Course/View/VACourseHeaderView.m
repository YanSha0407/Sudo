//
//  VACourseHeaderView.m
//  SDArtWorldCloud
//
//  Created by metis on 2019/12/12.
//  Copyright © 2019 Sudo. All rights reserved.
//

#import "VACourseHeaderView.h"

@implementation VACourseHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.courseTitle];
        [self addSubview:self.moreButton];
    }
    return self;
}
-(UILabel *)courseTitle{
    if (!_courseTitle) {
        _courseTitle = [[UILabel alloc]init];
        _courseTitle.numberOfLines = 0;
        _courseTitle.text = @"标题";
        _courseTitle.font = VASubBlodTitleFont;
        _courseTitle.textColor = VAMainTitleColor;
    }
    return _courseTitle;
}
-(UIButton *)moreButton{
    if (!_moreButton) {
        _moreButton = [[UIButton alloc]init];
        [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
        [_moreButton setTitleColor:VAMainTitleColor forState:UIControlStateNormal];
//        _courseTitle.numberOfLines = 0;
//        _courseTitle.text = @"标题";
        _moreButton.titleLabel.textAlignment = NSTextAlignmentRight;
        _moreButton.titleLabel.font = VASubBlodTitleFont;
    }
    return _moreButton;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.courseTitle.frame = CGRectMake(8, 0, KSystemWidth/2, 30);
    self.moreButton.frame = CGRectMake(self.width - 70 , 0, 70, 30);
}
@end
