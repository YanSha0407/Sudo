//
//  VASelectRoleController.m
//  SDArtWorldCloud
//
//  Created by metis on 2019/12/30.
//  Copyright © 2019 Sudo. All rights reserved.
//

#import "VASelectRoleController.h"
#import "VALoginController.h"
@interface VASelectRoleController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UIButton *teacherBtn;
@property (weak, nonatomic) IBOutlet UIButton *studentBtn;
@property (weak, nonatomic) IBOutlet UIButton *parentBtn;

@end

@implementation VASelectRoleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubView];
}

-(void)initSubView{
    [super awakeFromNib];
    self.logoImage.backgroundColor = VAGrayUnUseColor;
    KClipsCornerRadius(self.logoImage, self.logoImage.width/2);
    [self initBtn:self.teacherBtn];
    [self initBtn:self.studentBtn];
    [self initBtn:self.parentBtn];
}

-(void)initBtn:(UIButton *)btn{
    [btn setTitleColor:VAMainTitleColor forState:UIControlStateNormal];
    btn.titleLabel.font = VAMainTitleFont;
    [btn setBackgroundColor:VAMainAppColor];
    KClipsCornerRadius(btn, btn.height/2);
    btn.layer.borderColor = VAMainAppColor.CGColor;
    btn.layer.borderWidth = PixelOne;
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    if (btn.tag == 2) {
        [btn setBackgroundColor:VAMainBgColor];
    }
    else if (btn.tag ==3){
        [btn setBackgroundColor:VAMainBgColor];
    }
}

-(void)clickBtn:(UIButton *)btn{
    VALoginController *loginVC = [[VALoginController alloc]init];
    loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:loginVC animated:YES completion:nil];
}
@end
