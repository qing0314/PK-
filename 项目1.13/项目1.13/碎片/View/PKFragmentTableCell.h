//
//  PKFragmentTableCell.h
//  项目1.13
//
//  Created by ma c on 16/1/20.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKFragmentModel.h"
@interface PKFragmentTableCell : UITableViewCell
@property (strong, nonatomic) PKFragmentList *counterList;
@property (strong, nonatomic) NSDictionary *heightDic;

@end
