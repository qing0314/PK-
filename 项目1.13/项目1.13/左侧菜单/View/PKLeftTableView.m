//
//  PKLeftTableView.m
//  项目1.13
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKLeftTableView.h"
#import "PKLeftTableCell.h"
@interface PKLeftTableView()<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) NSArray *titleArray;
@end
@implementation PKLeftTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.tableView.backgroundColor = RGB(51, 51, 51);
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.imageArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
        self.titleArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    PKLeftTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PKLeftTableCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.iconImage.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.titlelabel.text = self.titleArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;

    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.frame.size.height/6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
