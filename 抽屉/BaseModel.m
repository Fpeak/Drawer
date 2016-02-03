//
//  BaseModel.m
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(instancetype)initWithdict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.imageName = dict[@"imageName"];
    }
    return self;
}

@end
