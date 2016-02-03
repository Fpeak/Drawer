//
//  MainViewController.m
//  抽屉
//
//  Created by 高山峰 on 15/10/24.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "MainViewController.h"
#import "MyCell.h"
#import "AnimalView.h"
#import "SubModel.h"
#import "subTypeModel.h"
#import "ShopListViewController.h"
#define KSetViewHeigin 200
static NSString *identifier = @"cell";

@interface MainViewController ()
@property (nonatomic, strong) UIView *subView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation MainViewController

-(void)loadView{
    self.tableView = [[AnimalView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpDataSource];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 200)];
    subView.backgroundColor = [UIColor redColor];
    self.subView = subView;

    [self.tableView registerClass:[MyCell class] forCellReuseIdentifier:identifier];
}

-(void)setUpDataSource{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"shops.plist" ofType:nil];
    NSArray *pathArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *pathM = [NSMutableArray arrayWithCapacity:pathArr.count];
    for (NSDictionary * dict in pathArr) {
        subTypeModel *model = [subTypeModel subtypeModelWithDic:dict];
        [pathM addObject:model];
    }
    self.dataSource = pathM;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    subTypeModel *model = self.dataSource[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:model.imageName];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.deatils;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AnimalView *animal = (AnimalView *)tableView;
    subTypeModel *model = self.dataSource[indexPath.row];
    [animal openAnimalIndexPath:indexPath AndDataSource:model.subShop];
}

@end
