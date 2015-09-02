//
//  CarDetailViewController.m
//  LovingCar
//
//  Created by Jame on 15/7/29.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "CarDetailViewController.h"

@interface CarDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *detailArray;
@end

@implementation CarDetailViewController
@synthesize detailTableView;
@synthesize titleArray,detailArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    detailTableView.delegate = self;
    detailTableView.dataSource = self;
    
    
    titleArray = @[@"车型",@"上次保养时间",@"上次保养里程数",@"上次保养内容1",@"上次保养内容2"];
    detailArray = @[@"帕萨特",@"2014年5月20号",@"25000公里",@"小保养",@"空调系统"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailTableViewIdentifier"];
    NSString *title = [titleArray objectAtIndex:indexPath.row];
    NSString *detail = [detailArray objectAtIndex:indexPath.row];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:10000];
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:10001];
    
    titleLabel.text = title;
    detailLabel.text = detail;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
