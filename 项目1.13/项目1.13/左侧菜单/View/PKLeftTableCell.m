//
//  PKLeftTableCell.m
//  项目1.13
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKLeftTableCell.h"
#import "Masonry.h"
#define KMargin 10
@implementation PKLeftTableCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGB(51, 51, 51);
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.titlelabel];
        [self layoutSubviewsCell];
//        [self addItem];
    }
    return self;
}




- (void)layoutSubviewsCell  //在init方法执行以后再执行
{
    WS(weakSelf);
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(35, 35));
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.centerY.equalTo(weakSelf.mas_centerY);

    }];
    
    [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(40);
        make.height.equalTo(35);
    }];
}


- (UIImageView *)iconImage
{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
       
    }
    return _iconImage;
}

- (UILabel *)titlelabel
{
    if (!_titlelabel) {
        _titlelabel = [[UILabel alloc]init];
        _titlelabel.font = [UIFont systemFontOfSize:22];
        _titlelabel.textColor = [UIColor whiteColor];
        _titlelabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titlelabel;
}




- (void)addItem{
    _iconImage = [[UIImageView alloc]init];
    _titlelabel = [[UILabel alloc]init];
    _titlelabel.font = [UIFont systemFontOfSize:22];
    _titlelabel.textColor = [UIColor whiteColor];
    _titlelabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.iconImage];
    [self addSubview:self.titlelabel];
    
    WS(weakSelf);
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(35, 35));
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(40);
        make.height.equalTo(35);
    }];
    
}


@end
