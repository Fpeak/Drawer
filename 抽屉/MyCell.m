//
//  MyCell.m
//  抽屉
//
//  Created by 高山峰 on 15/10/25.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        /** 设置cell的选中样式 */
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tmall_bg_main"]];
        
        /** 设置主标题 */
        self.textLabel.font = [UIFont systemFontOfSize:16];
        self.textLabel.backgroundColor = [UIColor clearColor];
        /** 设置副标题 */
        self.detailTextLabel.font = [UIFont systemFontOfSize:14.0];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end
