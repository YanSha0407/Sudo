//
//  VALoginController.m
//  VagaryArtWorldProject
//
//  Created by metis2017 on 2019/8/13.
//  Copyright © 2019年 metis2017. All rights reserved.
//

#import "VALoginController.h"

@interface VALoginController ()<QMUITextFieldDelegate>
@property (nonatomic,retain)UIView *loginBgView; // 登录背景
@property (nonatomic,retain)UIView *yellowBgView; // 登录背景
@property (nonatomic,retain)QMUITextField *studioTextFiled;// 机构号
@property (nonatomic,retain)QMUITextField *phoneNumTextFiled;// 手机号
@property (nonatomic,retain)QMUITextField *codeTextFiled;// 验证码
@property (nonatomic,retain)UIImageView *studioLogo;// 机构号
@property (nonatomic,retain)UIImageView *phoneLogo;// 手机号
@property (nonatomic,retain)UIImageView *codeLogo;// 验证码
@property (nonatomic,retain)UIButton *getCodeBtn;// 获取验证码
@property (nonatomic,retain)UIButton *loginBtn; //登录btn
@property (nonatomic,retain)UIButton *backBtn; //返回btn
@property (nonatomic,retain)UIButton *changePwdBtn; //切换密码登录
@property (nonatomic,retain)UILabel *line1;
@property (nonatomic,retain)UILabel *line2;
@property (nonatomic,retain)UILabel *line3;
@end

@implementation VALoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.view addSubview:self.yellowBgView];
    [self.view addSubview:self.loginBgView];
    [self.loginBgView addSubview:self.phoneNumTextFiled];
    [self.loginBgView addSubview:self.studioTextFiled];
    [self.loginBgView addSubview:self.studioLogo];
    [self.loginBgView addSubview:self.codeTextFiled];
    [self.loginBgView addSubview:self.phoneLogo];
    [self.loginBgView addSubview:self.codeLogo];
    [self.loginBgView addSubview:self.getCodeBtn];
    [self.loginBgView addSubview:self.loginBtn];
    [self.loginBgView addSubview:self.changePwdBtn];
    [self.loginBgView addSubview:self.line1];
    [self.loginBgView addSubview:self.line2];
    [self.loginBgView addSubview:self.line3];
    [self.yellowBgView addSubview:self.backBtn];
    [self.yellowBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(0);
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.right.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_equalTo(300);
    }];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yellowBgView).mas_offset(50);
        make.left.mas_equalTo(self.yellowBgView).mas_offset(30);
        make.width.height.mas_equalTo(30);
    }];
    [self.loginBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(150);
        make.left.mas_equalTo(self.view).mas_offset(30);
        make.right.mas_equalTo(self.view).mas_offset(-30);
        make.height.mas_equalTo(KSystemHeight/2);
    }];
    [self.studioTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.loginBgView).mas_offset(35);
        make.top.mas_equalTo(self.loginBgView.mas_top).mas_offset(60);
        make.width.mas_equalTo(self.loginBgView).mas_offset(-40);
        make.height.mas_equalTo(45);
    }];
    [self.studioLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.studioTextFiled).mas_offset(10);
        make.left.mas_equalTo(self.loginBgView).mas_offset(12.5);
        make.width.height.mas_equalTo(20);
    }];
    [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.studioLogo);
        make.right.mas_equalTo(self.studioTextFiled);
        make.top.mas_equalTo(self.studioTextFiled.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(1);
    }];
    
    [self.phoneNumTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.studioTextFiled.mas_bottom).inset(20);
        make.width.mas_equalTo(self.studioTextFiled);
        make.left.mas_equalTo(self.studioTextFiled);
        make.height.mas_equalTo(45);
        
    }];
    [self.phoneLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneNumTextFiled).mas_offset(10);
        make.left.mas_equalTo(self.loginBgView).mas_offset(12.5);
        make.width.height.mas_equalTo(20);
    }];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneLogo);
        make.right.mas_equalTo(self.phoneNumTextFiled);
        make.top.mas_equalTo(self.phoneNumTextFiled.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(1);
    }];
    [self.codeTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneNumTextFiled.mas_bottom).inset(20);
        make.width.mas_equalTo((KSystemWidth-50*2)*2/3);
        make.left.height.mas_equalTo(self.phoneNumTextFiled);
    }];
    [self.codeLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTextFiled).mas_offset(12.5);
        make.left.mas_equalTo(self.phoneLogo);
        make.width.height.mas_equalTo(self.phoneLogo);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneLogo);
        make.right.mas_equalTo(self.phoneNumTextFiled);
        make.top.mas_equalTo(self.codeTextFiled.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(1);
    }];
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.mas_equalTo(self.codeTextFiled);
        make.width.mas_equalTo((KSystemWidth-50*2)/3);
        make.left.mas_equalTo(self.codeTextFiled.mas_right);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.codeTextFiled.mas_bottom).mas_offset(100);
         make.left.mas_equalTo(self.phoneLogo);
         make.height.right.mas_equalTo(self.phoneNumTextFiled);
    }];
    [self.changePwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.mas_equalTo(self.getCodeBtn);
         make.top.mas_equalTo(self.getCodeBtn.mas_bottom).mas_offset(15);
         make.width.mas_equalTo(100);
         make.height.mas_equalTo(30);
    }];
    
    
#pragma 修改后约束
    [self.studioTextFiled mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.loginBgView).mas_offset(30);
        make.top.mas_equalTo(self.loginBgView.mas_top).mas_offset(60);
        make.width.mas_equalTo(self.loginBgView).mas_offset(-40);
        make.height.mas_equalTo(0);
    }];
    [self.studioLogo mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.studioTextFiled).mas_offset(10);
        make.left.mas_equalTo(self.loginBgView).mas_offset(12.5);
        make.width.height.mas_equalTo(0);
    }];
    [self.line3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.studioLogo);
        make.right.mas_equalTo(self.studioTextFiled);
        make.top.mas_equalTo(self.studioTextFiled.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(0);
    }];
    
    KClipsCornerRadius(self.loginBgView, 20);
}
-(UIView *)yellowBgView{
    if (!_yellowBgView) {
        _yellowBgView = [[UIView alloc]init];
        _yellowBgView.backgroundColor = VAMainAppColor;
        CGRect rect = CGRectMake(0, 0, KSystemWidth, 300);
        CGFloat radius = 30.0f;
        UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
           //设置大小
        maskLayer.frame = _yellowBgView.bounds;
           //设置图形样子
        maskLayer.path = maskPath.CGPath;
        _yellowBgView.layer.mask = maskLayer;
    }
    return _yellowBgView;
}

-(UIView *)loginBgView{
    if (!_loginBgView) {
        _loginBgView = [[UIView alloc]init];
        _loginBgView.backgroundColor = VAWhiteColor;
    }
    return _loginBgView;
}
-(QMUITextField *)studioTextFiled{
    if (!_studioTextFiled) {
        _studioTextFiled = [[QMUITextField alloc]init];
        _studioTextFiled.backgroundColor = VAWhiteColor;
        _studioTextFiled.keyboardType = UIKeyboardTypePhonePad;
        _studioTextFiled.placeholder = @"请输入机构号";
        _studioTextFiled.font = VAMainTitleFont;
        _studioTextFiled.delegate = self;
        _studioTextFiled.typingAttributes = @{NSForegroundColorAttributeName: UIColorRed};
    }
    return _studioTextFiled;
}
-(QMUITextField *)phoneNumTextFiled{
    if (!_phoneNumTextFiled) {
        _phoneNumTextFiled = [[QMUITextField alloc]init];
        _phoneNumTextFiled.backgroundColor = VAWhiteColor;
        _phoneNumTextFiled.keyboardType = UIKeyboardTypePhonePad;
        _phoneNumTextFiled.placeholder = @"请输入手机号";
        _phoneNumTextFiled.font = VAMainTitleFont;
        _phoneNumTextFiled.delegate = self;
        _phoneNumTextFiled.typingAttributes = @{NSForegroundColorAttributeName: UIColorRed};
    }
    return _phoneNumTextFiled;
}
-(QMUITextField *)codeTextFiled{
    if (!_codeTextFiled) {
        _codeTextFiled = [[QMUITextField alloc]init];
        _codeTextFiled.backgroundColor = VAWhiteColor;
        _codeTextFiled.placeholder = @"请输入验证码";
        _codeTextFiled.keyboardType = UIKeyboardTypePhonePad;
        _codeTextFiled.font = VAMainTitleFont;
        _codeTextFiled.delegate = self;
        _codeTextFiled.typingAttributes = @{NSForegroundColorAttributeName: UIColorRed};
    }
    return _codeTextFiled;
}
-(UIImageView *)studioLogo{
    if (!_studioLogo) {
        _studioLogo = [[UIImageView alloc]init];
        _studioLogo.image = VAImage(@"ic_loukongguanli");
    }
    return _studioLogo;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        [_backBtn setImage:VAImage(@"ic_fanhui") forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
-(UIImageView *)phoneLogo{
    if (!_phoneLogo) {
        _phoneLogo = [[UIImageView alloc]init];
        _phoneLogo.image = VAImage(@"ic_shouji");
    }
    return _phoneLogo;
}

-(UIImageView *)codeLogo{
    if (!_codeLogo) {
        _codeLogo = [[UIImageView alloc]init];
        _codeLogo.image = VAImage(@"ic_duanxin");
    }
    return _codeLogo;
}

-(UIButton *)getCodeBtn{
    if (!_getCodeBtn) {
        _getCodeBtn = [[UIButton alloc]init];
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getCodeBtn setTitleColor:VAWhiteColor forState:UIControlStateNormal];
        [_getCodeBtn setBackgroundColor:VAMainAppColor];
        _getCodeBtn.titleLabel.font = VASubTitleFont;
    }
    return _getCodeBtn;
}
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:VAMainTitleColor forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:VAMainAppColor];
        _loginBtn.titleLabel.font = VAMainTitleFont;
        [_loginBtn addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
        KClipsCornerRadius(_loginBtn, 20);
    }
    return _loginBtn;
}
-(UIButton *)changePwdBtn{
    if (!_changePwdBtn) {
        _changePwdBtn = [[UIButton alloc]init];
        _changePwdBtn.titleLabel.font = VASubTitleFont;
        _changePwdBtn.hidden = YES;
        [_changePwdBtn setTitle:@"机构账号登录" forState:UIControlStateNormal];
        [_changePwdBtn setTitleColor:VASubTitleColor forState:UIControlStateNormal];
        [_changePwdBtn addTarget:self action:@selector(changeLoginType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changePwdBtn;
}
-(UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = VAGrayUnUseColor;
    }
    return _line1;
}
-(UILabel *)line2{
    if (!_line2) {
        _line2 = [[UILabel alloc]init];
        _line2.backgroundColor = VAGrayUnUseColor;
    }
    return _line2;
}
-(UILabel *)line3{
    if (!_line3) {
        _line3 = [[UILabel alloc]init];
        _line3.backgroundColor = VAGrayUnUseColor;
    }
    return _line3;
}

#pragma mark - <QMUITextFieldDelegate>

- (void)textField:(QMUITextField *)textField didPreventTextChangeInRange:(NSRange)range replacementString:(NSString *)replacementString {
    [QMUITips showWithText:[NSString stringWithFormat:@"文字不能超过 %@ 个字符", @(textField.maximumTextLength)] inView:self.view hideAfterDelay:2.0];
}

-(void)clickBackBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark -- 切换登录方式
-(void)changeLoginType:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.changePwdBtn setTitle:@"手机号登录" forState:UIControlStateNormal];
        [self.studioTextFiled mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.loginBgView).mas_offset(30);
            make.top.mas_equalTo(self.loginBgView.mas_top).mas_offset(60);
            make.width.mas_equalTo(self.loginBgView).mas_offset(-40);
            make.height.mas_equalTo(0);
        }];
        [self.studioLogo mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.studioTextFiled).mas_offset(10);
            make.left.mas_equalTo(self.loginBgView).mas_offset(12.5);
            make.width.height.mas_equalTo(0);
        }];
        [self.line3 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.studioLogo);
            make.right.mas_equalTo(self.studioTextFiled);
            make.top.mas_equalTo(self.studioTextFiled.mas_bottom).mas_offset(5);
            make.height.mas_equalTo(0);
        }];
    }
    else{
        [self.changePwdBtn setTitle:@"机构账号登录" forState:UIControlStateNormal];
        [self.studioTextFiled mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.loginBgView).mas_offset(30);
            make.top.mas_equalTo(self.loginBgView.mas_top).mas_offset(60);
            make.width.mas_equalTo(self.loginBgView).mas_offset(-40);
            make.height.mas_equalTo(45);
        }];
        [self.studioLogo mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.studioTextFiled).mas_offset(10);
            make.left.mas_equalTo(self.loginBgView).mas_offset(12.5);
            make.width.height.mas_equalTo(20);
        }];
        [self.line3 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.studioLogo);
            make.right.mas_equalTo(self.studioTextFiled);
            make.top.mas_equalTo(self.studioTextFiled.mas_bottom).mas_offset(5);
            make.height.mas_equalTo(1);
        }];
    }
}

#pragma mark ---  点击登录
-(void)clickLogin{
    if (kIsNetwork) {
        NSDictionary *dic = @{};
//        PPNetworkHelper
        [PPNetworkHelper POST:KUserLogin parameters:dic success:^(id responseObject) {
            
        } failure:^(NSError *error) {
            
        }];
    }
    else{
        KNetworkError;
    }
}

#pragma mark --- 点击发送验证码
-(void)sendSMS{
    if (kIsNetwork) {
        NSDictionary *dic = @{};
        
        [PPNetworkHelper POST:KSendSMS parameters:dic success:^(id responseObject) {
            
        } failure:^(NSError *error) {
            
        }];
    }
    else{
        KNetworkError;
    }
}
@end
