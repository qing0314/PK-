//
//  PKSecondLandView.m
//  项目1.13
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKSecondLandView.h"
#import "Masonry.h"
@implementation PKSecondLandView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.tostLabel1];
        [self addSubview:self.tostLabel2];
        [self addSubview:self.EmailText];
        [self addSubview:self.PassWordText];
        [self addSubview:self.landingBtn];
        [self addlayoutItem];
    }
    return self;
}

- (void)addlayoutItem
{
    WS(weakSelf);
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(@1);
        make.top.equalTo(weakSelf.mas_top).offset(70);
    }];
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(@1);
        make.top.equalTo(weakSelf.lineLabel1.mas_bottom).offset(70);
    }];

    [_tostLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel1.mas_left);
        make.size.equalTo(CGSizeMake(75, 18));
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top).offset(-15);
    }];
    [_tostLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel2.mas_left);
        make.size.equalTo(CGSizeMake(75, 18));
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top).offset(-15);
    }];

    [_EmailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.tostLabel1.mas_right).offset(5);
        make.right.equalTo(weakSelf.lineLabel1.mas_right);
        make.height.equalTo(50);
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top);
    }];

    [_PassWordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.tostLabel2.mas_right).offset(5);
        make.right.equalTo(weakSelf.lineLabel2.mas_right);
        make.height.equalTo(50);
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top);
    }];
    [_landingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel1.mas_left);
        make.right.equalTo(weakSelf.lineLabel1.mas_right);
        make.height.equalTo(@40);
        make.top.equalTo(weakSelf.lineLabel2.mas_bottom).offset(33);
    }];

    //总高度220

    
    
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

- (UILabel *)tostLabel1
{
    if (!_tostLabel1) {
        _tostLabel1 = [[UILabel alloc]init];
        _tostLabel1.text = @"邮箱：";
        _tostLabel1.textColor = [UIColor blackColor];
        _tostLabel1.font = [UIFont systemFontOfSize:16.0];
        _tostLabel1.textAlignment = NSTextAlignmentLeft;
        
        _tostLabel1.font = [UIFont boldSystemFontOfSize:16.0];
    }
    return _tostLabel1;
}

- (UILabel *)tostLabel2
{
    if (!_tostLabel2) {
        _tostLabel2 = [[UILabel alloc]init];
        _tostLabel2.text = @"密码：";
        _tostLabel2.textColor = [UIColor blackColor];
        _tostLabel2.font = [UIFont systemFontOfSize:16.0];
        _tostLabel2.textAlignment = NSTextAlignmentLeft;
        _tostLabel2.font = [UIFont boldSystemFontOfSize:16.0];
    }
    return _tostLabel2;
}

- (UITextField *)EmailText
{
    if (!_EmailText) {
        _EmailText = [[UITextField alloc]init];
        _EmailText.textColor = [UIColor blackColor];
        _EmailText.delegate = self;
        _EmailText.borderStyle = UITextBorderStyleNone;
        
    }
    return _EmailText;
}
- (UITextField *)PassWordText
{
    if (!_PassWordText) {
        _PassWordText = [[UITextField alloc]init];
        _PassWordText.textColor = [UIColor blackColor];
        _PassWordText.delegate = self;
        _PassWordText.borderStyle = UITextBorderStyleNone;
        _PassWordText.secureTextEntry = YES;//密码显示
        
    }
    return _PassWordText;
}

- (UIButton *)landingBtn
{
    if (!_landingBtn) {
        _landingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _landingBtn.backgroundColor = RGB(119, 182, 69);
        [_landingBtn setTitle:@"登录" forState:UIControlStateNormal];
        _landingBtn.titleLabel.textColor = [UIColor whiteColor];
    }
    return _landingBtn;
}


@end
