//
//  PKGoodProductsViewController.m
//  项目1.13
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKGoodProductsViewController.h"
#import "PKGoodProductsCell.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
@interface PKGoodProductsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *GoodProductTable;
@property (strong, nonatomic) NSArray *goodProductArray;
@end

@implementation PKGoodProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.GoodProductTable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.GoodProductTable.delegate = self;
    self.GoodProductTable.dataSource = self;
    self.GoodProductTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.GoodProductTable];
    [self addRefreshControl];
    [self reloadGoodProductsData:0];
    
}

#pragma mark 数据源代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _goodProductArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ID";
    PKGoodProductsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PKGoodProductsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dataDic = _goodProductArray[indexPath.row];
    [cell.contentImage downloadImage:dataDic[@"coverimg"]];
    cell.contentLabel.text = dataDic[@"title"];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)addRefreshControl
{
    //设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    //隐藏状态
    header.stateLabel.hidden = YES;
    //马上进入刷新状态
    self.GoodProductTable.mj_header = header;
    //设置上拉加载的动画
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //隐藏状态
    footer.stateLabel.hidden = YES;
    self.GoodProductTable.mj_footer.automaticallyChangeAlpha = YES;
    self.GoodProductTable.mj_footer = footer;
}
- (void)reloadGoodProductsData:(NSInteger )start
{
    //制作请求参数
    NSDictionary *requestDic = @{
                  @"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                @"client":@"1",
              @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                 @"limit":@"10",
                 @"start":[NSString stringWithFormat:@"%li",start],
               @"version":@"3.0.6"
                  };
    WS(weakSelf)
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/shop" dic:requestDic successBalck:^(id JSON) {
        NSDictionary *returnDic = JSON;
        if ([returnDic[@"result"]integerValue] == 1) {
            weakSelf.goodProductArray = [returnDic[@"data"] valueForKey:@"list"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.GoodProductTable reloadData];
            });
        }
    } errorBlock:^(NSError *error) {
        
    }];
}

//获得更多数据
- (void)loadMoreData
{
    [self reloadGoodProductsData:10];
}
//重新加载数据
- (void)loadNewData
{
    [self reloadGoodProductsData:0];
}
@end
