//
//  PKLeftMusicView.m
//  项目1.13
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKLeftMusicView.h"
#import "Masonry.h"
@implementation PKLeftMusicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.musicImage];
        [self addSubview:self.musicName];
        [self addSubview:self.musicFrom];
        [self addSubview:self.stratBtn];
        [self layoutItem];
    }
    return self;
}

- (void)layoutItem
{
    WS(weakSelf)
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.right.equalTo(weakSelf.mas_right);
    }];
    [_musicImage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.size.equalTo(CGSizeMake(60, 60));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_stratBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-20);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];

    [_musicName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.musicImage.mas_right).offset(20);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(-20);
        make.height.equalTo(@20);
        make.right.equalTo(weakSelf.stratBtn.mas_left).offset(20);
        
    }];
    
    [_musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.musicImage.mas_right).offset(20);
//        CGRect rect = [_musicFrom.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]} context:nil];
//        make.size.equalTo(CGSizeMake(rect.size.width,rect.size.height ));
        make.centerY.equalTo(weakSelf.mas_centerY).offset(20);
        make.height.equalTo(@20);
        make.right.equalTo(weakSelf.stratBtn.mas_left).offset(20);

    }];
    


}

- (UIImageView *)musicImage
{
    if (!_musicImage) {
        _musicImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"音乐"]];
        
    }
    return _musicImage;
}

- (UILabel *)musicName
{
    if (!_musicName) {
        _musicName = [[UILabel alloc]init];
        _musicName.font = [UIFont systemFontOfSize:15.0];
        _musicName.textColor = [UIColor whiteColor];
        _musicName.textAlignment = NSTextAlignmentLeft;
        
        _musicName.text = @"每天爱你多一点";
    }
    return _musicName;
}

- (UILabel *)musicFrom
{
    if (!_musicFrom) {
        _musicFrom = [[UILabel alloc]init];
        _musicFrom.font = [UIFont systemFontOfSize:13.0];
        _musicFrom.textColor = [UIColor whiteColor];
        _musicFrom.textAlignment = NSTextAlignmentLeft;
        
        _musicFrom.text = @"天天动听";
        
    }
    return _musicFrom;
    
}
                      
- (UIButton *)stratBtn
{
    if (!_stratBtn) {
        _stratBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _stratBtn.selected = NO;
        [_stratBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:UIControlStateNormal];
        [_stratBtn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateSelected];
        
    }
    return _stratBtn;
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = RGB(28, 28, 28);
    }
    return _backBtn;
}
@end
