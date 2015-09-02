//
//  AddCarViewController.m
//  LovingCar
//
//  Created by Jame on 15/7/29.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "AddCarViewController.h"

@interface AddCarViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *detailArray;
@end

@implementation AddCarViewController
@synthesize addCarTableView;
@synthesize titleArray,detailArray;
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [(BaseNavigationController *)self.navigationController setNavigationBarBackgroundAlpha:0.5];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    addCarTableView.delegate = self;
    addCarTableView.dataSource = self;
    addCarTableView.contentSize = CGSizeMake(0, 0);
    titleArray = @[@"品牌",@"车型",@"生产年份",@"排量",@"上路时间",@"行驶里程"];
    detailArray = @[@"大众",@"帕萨特",@"2013年5月",@"2.0TSI",@"2013年11月",@"23500公里"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddCarTableViewIdentifier"];
    NSString *title = [titleArray objectAtIndex:indexPath.row];
    NSString *detail = [detailArray objectAtIndex:indexPath.row];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:10000];
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:10001];
    
    titleLabel.text = title;
    detailLabel.text = detail;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
