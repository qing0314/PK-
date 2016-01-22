//
//  PKLandingViewController.m
//  项目1.13
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKLandingViewController.h"
#import "PKregisterViewController.h"  //注册界面

#import "PKTopLandingView.h"      //顶部登录view
#import "PKSecondLandView.h"     //Email正常登录view
#import "PKThirdLandingView.h"  //第三方登录View
#import "Masonry.h"
@interface PKLandingViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) PKSecondLandView *secondView;
@property (strong, nonatomic) PKThirdLandingView *thirdView;
@property (strong, nonatomic) PKTopLandingView *topView;
@end

@implementation PKLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.thirdView];
    
    WS(weakSelf);
    
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(@120);
    }];
    [self.view addSubview:self.secondView];

    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.thirdView.mas_top).offset(-75);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(210);
    }];
    
    [self.view addSubview:self.topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(175);
    }];
}
- (PKSecondLandView *)secondView
{
    if (!_secondView) {
        _secondView = [[PKSecondLandView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        _secondView.EmailText.delegate = self;
        _secondView.PassWordText.delegate = self;
    }
    return _secondView;
}
- (PKThirdLandingView *)thirdView
{
    if (!_thirdView) {
        _thirdView = [[PKThirdLandingView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    return _thirdView;
}

- (PKTopLandingView *)topView
{
    if (!_topView) {
        _topView = [[PKTopLandingView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [_topView.backBtn addTarget:self action:@selector(dismissToPKLeftMenuViewCtl) forControlEvents:UIControlEventTouchUpInside];
        [_topView.registerBtn addTarget:self action:@selector(presentToRegisterViewCtl) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topView;
}

- (void)dismissToPKLeftMenuViewCtl
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentToRegisterViewCtl
{
    PKregisterViewController *registerViewController = [[PKregisterViewController alloc]init];
    [self presentViewController:registerViewController animated:YES completion:nil];
}


#pragma mark 键盘弹出弹回
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    WS(weakSelf)
    if (textField == self.secondView.EmailText) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50.0;
            weakSelf.view.bounds = rect;
        }];
    }
    else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 100.0;
            weakSelf.view.bounds = rect;
        }];

    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_secondView.EmailText resignFirstResponder];
    [_secondView.PassWordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    
    return YES;

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_secondView.EmailText resignFirstResponder];
    [_secondView.PassWordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    

}
@end
