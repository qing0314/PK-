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
#import "ZJPNavigationController.h"//导航
#import "PKSettingViewController.h" //设置
#import "PKGoodProductsViewController.h" //良品
#import "PKCommunityViewController.h" //社区
#import "PKReadViewController.h" //阅读
#import "PKRadioViewController.h" //电台
#import "PKFragmentViewController.h"//碎片
#import "PKHomeViewController.h" //首页

@interface PKleftMenuViewController ()<PKLeftTableViewSelectRowdelegate>

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
    if (!_leftTable)
    {
        _leftTable = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _leftTable.Rowdelegate = self;
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
#pragma mark Rowdelegate
- (void)selectWhichRow:(NSInteger)row{
    switch (row) {
        case 0:
        {
            PKHomeViewController *homeController = [[PKHomeViewController alloc]init];
            homeController.title = @"首页";
            ZJPNavigationController *homeNav = [[ZJPNavigationController alloc]initWithRootViewController:homeController];
            [self.sideMenuViewController setContentViewController:homeNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 1:
        {
            PKRadioViewController *radioController = [[PKRadioViewController alloc]init];
            radioController.title = @"电台";
            ZJPNavigationController *radioNav = [[ZJPNavigationController alloc]initWithRootViewController:radioController];
            [self.sideMenuViewController setContentViewController:radioNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 2:
        {
            PKReadViewController *readController = [[PKReadViewController alloc]init];
            readController.title = @"阅读";
            ZJPNavigationController *readNav = [[ZJPNavigationController alloc]initWithRootViewController:readController];
            [self.sideMenuViewController setContentViewController:readNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 3:
        {
            PKCommunityViewController *CommunityController = [[PKCommunityViewController alloc]init];
            CommunityController.title = @"社区";
            ZJPNavigationController *CommunityNav = [[ZJPNavigationController alloc]initWithRootViewController:CommunityController];
            [self.sideMenuViewController setContentViewController:CommunityNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 4:
        {
            PKFragmentViewController *FragmentController = [[PKFragmentViewController alloc]init];
            FragmentController.title = @"碎片";
            ZJPNavigationController *FragmentNav = [[ZJPNavigationController alloc]initWithRootViewController:FragmentController];
            [self.sideMenuViewController setContentViewController:FragmentNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 5:
        {
            PKGoodProductsViewController *GoodProductsController = [[PKGoodProductsViewController alloc]init];
            GoodProductsController.title = @"良品";
            ZJPNavigationController *GoodProductsNav = [[ZJPNavigationController alloc]initWithRootViewController:GoodProductsController];
            [self.sideMenuViewController setContentViewController:GoodProductsNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 6:
        {
            PKSettingViewController *SettingeController = [[PKSettingViewController alloc]init];
            SettingeController.title = @"设置";
            ZJPNavigationController *SettingNav = [[ZJPNavigationController alloc]initWithRootViewController:SettingeController];
            [self.sideMenuViewController setContentViewController:SettingNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
            
        default:
            break;
    }
}
@end
