//
//  TargetListViewController.m
//  DesGo
//
//  Created by 高向孚 on 16/1/15.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import "TargetListViewController.h"
#import "TargetListTableViewCell.h"

@interface TargetListViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TargetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ViewController DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    static NSString *TargetListTableViewCellIdentifier = @"TargetListTableViewCell";
    TargetListTableViewCell *cell = (TargetListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:TargetListTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TargetListTableViewCell" owner:self options:nil] lastObject];
    }
    //           // Set up the cell...
    return cell;

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
