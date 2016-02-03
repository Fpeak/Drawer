//
//  AnimalView.h
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimalView : UITableView

-(void)openAnimalIndexPath:(NSIndexPath *)indexPath AndDataSource:(NSArray *)dataSource;
@end
