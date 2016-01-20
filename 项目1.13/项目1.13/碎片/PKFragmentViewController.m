//
//  PKFragmentViewController.m
//  项目1.13
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKFragmentViewController.h"

@interface PKFragmentViewController ()

@property (strong, nonatomic) UITableView *fragmentTable;

@end

@implementation PKFragmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.fragmentTable];
    // Do any additional setup after loading the view.
}


- (UITableView *)fragmentTable
{
    if (!_fragmentTable) {
        _fragmentTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStylePlain];
        }
    return _fragmentTable;
}
@end
