//
//  BaseModel.h
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BaseModel : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageName;

-(instancetype)initWithdict:(NSDictionary *)dict;
@end
