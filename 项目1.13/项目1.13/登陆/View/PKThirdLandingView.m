//
//  PKThirdLandingView.m
//  项目1.13
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKThirdLandingView.h"
#import "Masonry.h"
@implementation PKThirdLandingView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titlLabel];
        [self addSubview:self.sinaImage];
        [self addSubview:self.renrenImage];
        [self addSubview:self.doubanImage];
        [self addSubview:self.qqImage];
        [self addSubview:self.leftLine];
        [self addSubview:self.rightLine];
        
    }
    return self;
}

- (void)layoutSubviews
{
    WS(weakSelf);
    [_titlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.equalTo(CGSizeMake(125, 13));
    }];
    CGFloat width = (VIEW_WIDTH-140.0)/5;

    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.centerY.equalTo(weakSelf.titlLabel.mas_centerY);
        make.height.equalTo(@1);
        make.right.equalTo(weakSelf.titlLabel.mas_left);
    }];
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-width);
        make.centerY.equalTo(weakSelf.titlLabel.mas_centerY);
        make.height.equalTo(@1);
        make.left.equalTo(weakSelf.titlLabel.mas_right);
    }];

    
    [_sinaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(35, 35));
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(5);
    }];
    [_renrenImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(35, 35));
        make.left.equalTo(weakSelf.sinaImage.mas_right).offset(width);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(5);
    }];
    [_doubanImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(35, 35));
        make.left.equalTo(weakSelf.renrenImage.mas_right).offset(width);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(5);
    }];
    [_qqImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(35, 35));
        make.left.equalTo(weakSelf.doubanImage.mas_right).offset(width);
//        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(5);
    }];


    
}

- (UILabel *)titlLabel
{
    if (!_titlLabel) {
        _titlLabel = [[UILabel alloc]init];
        _titlLabel.text = @"合作伙伴登录片刻";
        _titlLabel.textAlignment = NSTextAlignmentCenter;
        _titlLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titlLabel;
}

- (UIImageView *)sinaImage
{
    if (!_sinaImage) {
        _sinaImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"新浪"]];
        
    }
    return _sinaImage;
}

- (UIImageView *)renrenImage
{
    if (!_renrenImage) {
        _renrenImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"人人"]];
    }
    return _renrenImage;
    
}
- (UIImageView *)doubanImage
{
    if (!_doubanImage) {
        _doubanImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"豆瓣"]];
    }
    return _doubanImage;
}
- (UIImageView *)qqImage
{
    if (!_qqImage) {
        _qqImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"QQ"]];
    }
    return _qqImage;
}

- (UIView *)leftLine
{
    if (!_leftLine) {
        _leftLine = [[UIView alloc]init];
        _leftLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _leftLine;
}

- (UIView *)rightLine
{
    if (!_rightLine) {
        _rightLine = [[UIView alloc]init];
        _rightLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _rightLine;
}
@end
