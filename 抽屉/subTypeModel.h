//
//  subTypeModel.h
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "BaseModel.h"

@interface subTypeModel : BaseModel

@property (nonatomic, strong) NSArray *subShop;
@property (nonatomic, strong) NSMutableString *deatils;
+(id)subtypeModelWithDic:(NSDictionary *)dict;
@end
