//
//  PKleftMenuViewController.m
//  项目1.13
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKleftMenuViewController.h"
#import "PKLeftHeadView.h"
#import "PKLeftTableView.h"
#import "PKLeftMusicView.h"
#import "PKLandingViewController.h"

@interface PKleftMenuViewController ()

@property (strong, nonatomic) PKLeftHeadView *leftheadView;

@property (strong, nonatomic) PKLeftTableView *leftTable;

@property (strong, nonatomic) PKLeftMusicView *leftMusicView;
@end

@implementation PKleftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(51, 51, 51);
    [self.view addSubview:self.leftheadView];
    
    [self.view addSubview:self.leftTable];
    [self.view addSubview:self.leftMusicView];
    WS(weakSelf);
    [_leftheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(210);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
    [_leftTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftheadView.mas_bottom);
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-80);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
    
    [_leftMusicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftTable.mas_bottom);
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
}

- (PKLeftHeadView *)leftheadView
{
    if (!_leftheadView) {
        _leftheadView = [[PKLeftHeadView alloc]init];
        [_leftheadView.iconImageBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:UIControlEventTouchUpInside];
        [_leftheadView.userNameBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:UIControlEventTouchUpInside];
        

    }
    return _leftheadView;
}

- (PKLeftTableView *)leftTable
{
    if (!_leftTable) {
        
        _leftTable = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];

        _leftTable.backgroundColor = RGB(51, 51, 51);

            }
    return _leftTable;

}

- (PKLeftMusicView *)leftMusicView
{
    if (!_leftMusicView) {
        _leftMusicView = [[PKLeftMusicView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    return _leftMusicView;
}



- (void)pushToLandingViewController
{
    PKLandingViewController *landing = [[PKLandingViewController alloc]init];
    [self presentViewController:landing animated:YES completion:nil];
}
@end
