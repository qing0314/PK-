//
//  PKSecondLandView.h
//  项目1.13
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKSecondLandView : UIView<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *EmailText;
@property (strong, nonatomic) UITextField *PassWordText;
@property (strong, nonatomic) UIButton *landingBtn;

@property (strong, nonatomic) UILabel *lineLabel1;
@property (strong, nonatomic) UILabel *lineLabel2;

@property (strong, nonatomic) UILabel *tostLabel1;
@property (strong, nonatomic) UILabel *tostLabel2;

@end
