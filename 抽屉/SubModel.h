//
//  SubModel.h
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "BaseModel.h"

@interface SubModel : BaseModel

@property (nonatomic, copy) NSString *classID;

+(id)SubModelWithDic:(NSDictionary *)dict;
@end
