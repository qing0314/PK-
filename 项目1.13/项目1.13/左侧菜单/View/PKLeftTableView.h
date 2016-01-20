//
//  PKLeftTableView.h
//  项目1.13
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKLeftTableViewSelectRowdelegate <NSObject>

- (void)selectWhichRow:(NSInteger)row;

@end
@interface PKLeftTableView : UITableView

@property (weak, nonatomic) id<PKLeftTableViewSelectRowdelegate>Rowdelegate;
@end
