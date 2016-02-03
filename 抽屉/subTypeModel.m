
//
//  subTypeModel.m
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "subTypeModel.h"
#import "SubModel.h"
@implementation subTypeModel
+(id)subtypeModelWithDic:(NSDictionary *)dict{
    subTypeModel *subType = [[subTypeModel alloc]initWithdict:dict];
    NSArray *arr = dict[@"subClass"];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
    NSMutableString *StrM = [NSMutableString string];
    NSInteger i = 0;
    for (NSDictionary *dic in arr) {
        SubModel *model = [[SubModel alloc]initWithdict:dic];
        [arrM addObject:model];
        if (i<3) {
            [StrM appendFormat:@"%@/",model.name];
        }else if(i ==3){
            [StrM appendFormat:@"%@",model.name];
        }
    }
    subType.deatils = StrM;
    subType.subShop = arrM;
    return subType;
}

@end
