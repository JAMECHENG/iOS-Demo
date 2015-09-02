//
//  GarageViewController.m
//  LovingCar
//
//  Created by Jame on 15/7/29.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "GarageViewController.h"

@interface GarageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *array;
@end

@implementation GarageViewController
@synthesize CarsTableView;
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [CarsTableView displayCellFromDirection:AnimationDirectionFromLeft AnimationDuration:0.2];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [CarsTableView disappearCellToDirection:AnimationDirectionFromTop AnimationDuration:0.2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CarsTableView.delegate = self;
    CarsTableView.dataSource = self;
    self.array = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    
    [GCDHelper runSelectorWithDelay:3 InMainQueue:^{
        [CarsTableView rollToBottomAnimationForScrollView];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarTableViewIdentifier"];
    return cell;
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *fromCell = [tableView cellForRowAtIndexPath:indexPath];
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    CGRect rect = [tableView convertRect:fromCell.frame toView:CarsTableView];
    DLOG_CGRECT(rect);
    [tableView moveRowAtIndexPath:toIndexPath toIndexPath:indexPath];
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (IBAction)addButtonClicked:(id)sender {
//    [CarsTableView disappearCellToDirection:AnimationDirectionFromTop AnimationDuration:0.2];
    [CarsTableView rollToTopAnimationForScrollView];
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
