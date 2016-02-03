//
//  AnimalView.m
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "AnimalView.h"
#import "MyCell.h"
#import "ShopListViewController.h"
#define KSetViewHeigin 200
@interface AnimalView()
@property (nonatomic, strong) NSMutableArray *animalArray;
@property (nonatomic, strong)  ShopListViewController *shopVC;
@end

@implementation AnimalView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        
        [self setRowHeight:100];
        self.backgroundColor = [UIColor lightGrayColor];
        self.shopVC = [[ShopListViewController alloc]init];
    }
    return self;
}
-(void)openAnimalIndexPath:(NSIndexPath *)indexPath AndDataSource:(NSArray *)dataSource{
    /**
     1.选中的表格下方的表格足够大
     */
    
    
    if (self.animalArray != nil) {
        
        [UIView animateWithDuration:1.0 animations:^{
            for (NSIndexPath *path in self.animalArray) {
                MyCell *cell =(MyCell *) [self cellForRowAtIndexPath: path];
                CGRect closeFrame = cell.frame;
                closeFrame.origin.y = cell.originY;
                [cell setFrame:closeFrame];
            }
        } completion:^(BOOL finished) {
            self.animalArray = nil;
            [self.shopVC.tableView removeFromSuperview];
        }];
        return;
    }else{
        
        [self.shopVC setShopList:dataSource];
        [self.shopVC.tableView reloadData];
        /** 新建一个数组,把所有要动画的表格行记录下来 */
        NSMutableArray *array = [NSMutableArray arrayWithArray:[self indexPathsForVisibleRows]];
        self.animalArray = array;
        
        MyCell *cell =(MyCell *) [self cellForRowAtIndexPath:indexPath];
        CGFloat cellY = cell.frame.origin.y;
        CGFloat cellHeigin = cell.frame.size.height;
        /** 选中表格的下边y */
        CGFloat cellBottomY = cellY + cellHeigin;
        /** tableview 的高度 */
        CGFloat tableHeight = self.frame.size.height;
        CGFloat contentoffset = self.contentOffset.y;
        if (tableHeight-cellBottomY+contentoffset> KSetViewHeigin) {
            NSLog(@"展开");
            [UIView animateWithDuration:1.0 animations:^{
                for (NSIndexPath *path in self.animalArray) {
                    MyCell *cell = (MyCell *)[self cellForRowAtIndexPath:path ];
                    cell.originY = cell.frame.origin.y;
                    if (path.row > indexPath.row) {
                        /** 选中要移动的表格行 */
                        CGRect frame = cell.frame;
                        frame.origin.y+= KSetViewHeigin;
                        [cell setFrame:frame];
                    }
                }
            }];
        }else{
            NSLog(@"空间不够");
            CGFloat up = tableHeight + contentoffset -KSetViewHeigin-cellBottomY;
            NSLog(@"%f",up);
            CGFloat down = KSetViewHeigin +up;
            for (NSIndexPath *path in self.animalArray) {
                MyCell *cell =(MyCell *) [self cellForRowAtIndexPath:path];
                cell.originY = cell.frame.origin.y;
                CGRect newFrame = cell.frame;
                if (path.row < indexPath.row) {
                    /** 等于或小于选中行的向上挪 */
                    newFrame.origin.y += up;
                }else{
                    /** 大于的向下挪 */
                    newFrame.origin.y += down;
                }
                [cell setFrame:newFrame];
            }
            
        }
        CGRect subViewFrame = self.shopVC.view.frame;
        subViewFrame.origin.y = cellBottomY;
        self.shopVC.view.frame = subViewFrame;
        [self insertSubview:self.shopVC.view atIndex:0];
    }
    

}

@end
