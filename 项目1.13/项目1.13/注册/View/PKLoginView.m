//
//  PKLoginView.m
//  项目1.13
//
//  Created by ma c on 16/1/18.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKLoginView.h"
#import "Masonry.h"
@interface PKLoginView()<UITextFieldDelegate>

@property (strong, nonatomic) UILabel *lineLabel1;
@property (strong, nonatomic) UILabel *lineLabel2;
@property (strong, nonatomic) UILabel *lineLabel3;
@property (strong, nonatomic) UILabel *delegateLabel;

@property (strong, nonatomic) UILabel *usernameLabel;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UILabel *passwordLabel;

@end
@implementation PKLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.manBtn];
        [self addSubview:self.womanBtn];
        [self addSubview:self.usernameLabel];
        [self addSubview:self.userNameText];
        [self addSubview:self.emailLabel];
        [self addSubview:self.emailText];
        [self addSubview:self.passwordLabel];
        [self addSubview:self.passwordText];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.lineLabel3];
        [self addSubview:self.delegateLabel];
        [self addSubview:self.delegateBtn];
        [self addSubview:self.finishBtn];
        
        [self addLayoutItem];
        
    }
    return self;
}
- (void)addLayoutItem
{
    WS(weakSelf)
    [_manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(70, 30));
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(100);
    }];
    [_womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(70, 30));
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-100);
    }];
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.manBtn.mas_bottom).offset(75);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.7);
    }];
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel1.mas_bottom).offset(70);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.7);
    }];
    [_lineLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel2.mas_bottom).offset(70);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.7);
    }];
    [_usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel1.mas_left);
        make.size.equalTo(CGSizeMake(65, 18));
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top).offset(-15);
    }];
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel2.mas_left);
        make.size.equalTo(CGSizeMake(65, 18));
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top).offset(-15);
    }];

    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel3.mas_left);
        make.size.equalTo(CGSizeMake(65, 18));
        make.bottom.equalTo(weakSelf.lineLabel3.mas_top).offset(-15);
    }];

    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.usernameLabel.mas_right).offset(1);
        make.right.equalTo(weakSelf.lineLabel1.mas_right);
        make.height.equalTo(55);
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top).offset(-2);
    }];
    

    [_emailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.emailLabel.mas_right).offset(1);
        make.right.equalTo(weakSelf.lineLabel2.mas_right);
        make.height.equalTo(55);
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top).offset(-2);
    }];
    
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.passwordLabel.mas_right).offset(1);
        make.right.equalTo(weakSelf.lineLabel3.mas_right);
        make.height.equalTo(55);
        make.bottom.equalTo(weakSelf.lineLabel3.mas_top).offset(-2);
    }];
    
    [_finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel1.mas_left);
        make.right.equalTo(weakSelf.lineLabel1.mas_right);
        make.height.equalTo(@60);
        make.top.equalTo(weakSelf.lineLabel3.mas_bottom).offset(40);
    }];
    
    [_delegateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-50);
        make.height.equalTo(13);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-50);
        make.left.equalTo(weakSelf.mas_left).offset(45);
    }];
    [_delegateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.delegateLabel.mas_centerY);
        make.size.equalTo(CGSizeMake(70, 14));
        make.right.equalTo(weakSelf.mas_right).offset(-50);
    }];
}

- (UIButton *)manBtn
{
    if (!_manBtn) {
        _manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _manBtn.tag = 100;
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"男"] forState:UIControlStateNormal];
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"男_sel"] forState:(UIControlStateSelected)];
        [_manBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _manBtn.selected = NO;
        
    }
    return _manBtn;
}

- (UIButton *)womanBtn
{
    if (!_womanBtn) {
        _womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _womanBtn.tag = 101;
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"女"] forState:UIControlStateNormal];
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"女_sel"] forState:(UIControlStateSelected)];
        [_womanBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _womanBtn.selected = NO;
    }
    return _womanBtn;
}
- (void)changeSexBtnMethod:(UIButton *)sender{
    if (self.manBtn.selected == NO && self.womanBtn.selected == NO) {
        sender.selected = YES;
    }else if (sender.tag == 100){
        sender.selected = YES;
        _womanBtn.selected = NO;
    }else if (sender.tag == 101){
        sender.selected = YES;
        _manBtn.selected = NO;
    }
}


- (UIButton *)delegateBtn
{
    if (!_delegateBtn) {
        _delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delegateBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_delegateBtn setTitle:@"片刻协议" forState:UIControlStateNormal];
        _delegateBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];

    }
    return _delegateBtn;
}
- (UILabel *)delegateLabel
{
    if (!_delegateLabel ){
        _delegateLabel = [[UILabel alloc]init];
        _delegateLabel.text = @"点击“完成”按钮，代表你已阅读并同意";
        _delegateLabel.textColor = [UIColor blackColor];
        _delegateLabel.font = [UIFont systemFontOfSize:13.0];
        _delegateLabel.textAlignment = NSTextAlignmentCenter;
        
//        _delegateLabel.font = [UIFont boldSystemFontOfSize:16.0];
    }
    return _delegateLabel;
}

- (UIButton *)finishBtn
{
    if (!_finishBtn) {
        _finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_finishBtn setBackgroundColor:RGB(119, 182, 69) forState:UIControlStateNormal];
        [_finishBtn setBackgroundColor:RGB(119, 182, 69)];
        [_finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:18.0];
        _finishBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];

    }
    return _finishBtn;

}

- (UILabel *)lineLabel1
{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel1.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel1;
}
- (UILabel *)lineLabel2
{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc]init];
        _lineLabel2.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel2;
}
- (UILabel *)lineLabel3
{
    if (!_lineLabel3) {
        _lineLabel3 = [[UILabel alloc]init];
        _lineLabel3.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel3;
}


- (UILabel *)usernameLabel
{
    if (!_usernameLabel ){
        _usernameLabel = [[UILabel alloc]init];
        _usernameLabel.text = @"昵称：";
        _usernameLabel.textColor = [UIColor blackColor];
        _usernameLabel.font = [UIFont systemFontOfSize:16.0];
        _usernameLabel.textAlignment = NSTextAlignmentLeft;
        
        _usernameLabel.font = [UIFont boldSystemFontOfSize:16.0];
    }
    return _usernameLabel;
}
- (UILabel *)emailLabel
{
    if (!_emailLabel ){
        _emailLabel = [[UILabel alloc]init];
        _emailLabel.text = @"邮箱：";
        _emailLabel.textColor = [UIColor blackColor];
        _emailLabel.font = [UIFont systemFontOfSize:16.0];
        _emailLabel.textAlignment = NSTextAlignmentLeft;
        
        _emailLabel.font = [UIFont boldSystemFontOfSize:16.0];
    }
    return _emailLabel;
}

- (UILabel *)passwordLabel
{
    if (!_passwordLabel ){
        _passwordLabel = [[UILabel alloc]init];
        _passwordLabel.text = @"密码：";
        _passwordLabel.textColor = [UIColor blackColor];
        _passwordLabel.font = [UIFont systemFontOfSize:16.0];
        _passwordLabel.textAlignment = NSTextAlignmentLeft;
        
        _passwordLabel.font = [UIFont boldSystemFontOfSize:16.0];
    }
    return _passwordLabel;
}
- (UITextField *)userNameText
{
    if (!_userNameText) {
        _userNameText = [[UITextField alloc]init];
        _userNameText.textColor = [UIColor blackColor];
//        _userNameText.backgroundColor = [UIColor grayColor];
        _userNameText.borderStyle = UITextBorderStyleNone;
        
    }
    return _userNameText;

}

- (UITextField *)emailText
{
    if (!_emailText) {
        _emailText = [[UITextField alloc]init];
        _emailText.textColor = [UIColor blackColor];
//        _emailText.backgroundColor = [UIColor grayColor];
        _emailText.borderStyle = UITextBorderStyleNone;
        
    }
    return _emailText;
}
- (UITextField *)passwordText
{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc]init];
        _passwordText.textColor = [UIColor blackColor];
//        _passwordText.backgroundColor = [UIColor grayColor];
        _passwordText.borderStyle = UITextBorderStyleNone;
        _passwordText.secureTextEntry = YES;//密码显示
        
    }
    return _passwordText;
}

@end
