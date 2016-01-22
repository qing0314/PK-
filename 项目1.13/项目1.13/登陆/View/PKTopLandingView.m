//
//  PKTopLandingView.m
//  项目1.13
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKTopLandingView.h"
#import "Masonry.h"
@implementation PKTopLandingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.pkIamge];
        [self addSubview:self.backBtn];
        [self addSubview:self.registerBtn];
        
        [self addLayoutItems];
    }
    return self;
}

- (void)addLayoutItems
{
    WS(weakSelf);
    [_pkIamge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.equalTo(CGSizeMake(135, 65));
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(30, 27));
        make.top.equalTo(weakSelf.mas_top).offset(30);
        make.left.equalTo(weakSelf.mas_left).offset(20);
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(40, 20));
        make.top.equalTo(weakSelf.mas_top).offset(30);
        make.right.equalTo(weakSelf.mas_right).offset(-20);
    }];
    //总高度420
}
- (UIImageView *)pkIamge
{
    if (!_pkIamge) {
        _pkIamge = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"片刻LOGO"]];
        
    }
    return _pkIamge;
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        
    }
    return _backBtn;
}

- (UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:20.0];
        
    }
    return _registerBtn;
}
@end
