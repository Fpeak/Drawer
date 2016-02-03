//
//  SubModel.m
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "SubModel.h"

@implementation SubModel
+(id)SubModelWithDic:(NSDictionary *)dict{
    
    SubModel *sub = [[SubModel alloc]initWithdict:dict];
    sub.classID = dict[@"classID"];
    return sub;
}

@end
