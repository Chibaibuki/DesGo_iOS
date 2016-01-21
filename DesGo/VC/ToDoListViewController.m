//
//  ToDoListViewController.m
//  DesGo
//
//  Created by 高向孚 on 16/1/19.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import "ToDoListViewController.h"
#import "ToDoListTableViewCell.h"
#import "DataPersistence.h"

@interface ToDoListViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ToDoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataPersistence = [DataPersistence sharedInit];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSourse

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataPersistence.targetsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
//    static NSString *TargetListTableViewCellIdentifier = @"TargetListTableViewCell";
  static NSString *ToDoListTableViewCellIdentifier = @"ToDoListTableViewCell";
    ToDoListTableViewCell *cell = (ToDoListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ToDoListTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoListTableViewCell" owner:self options:nil] lastObject];
        cell.targetTitleLabel.text =self.dataPersistence.targetsList[indexPath.row][@"detail"][@"targetTitle"];
        if ([[DataPersistence getNowDateOrYesterdayDate:NO] isEqualToString:[self.dataPersistence.targetsList[indexPath.row][@"checkLog"] lastObject][@"date"]]) {
            [cell.checkedImageView setHidden:NO];
            [cell.checkedImageView setImage:[UIImage imageNamed:@"rightButton"]];
            NSLog(@"no");
        }else{
            [cell.checkedImageView setHidden:YES];
            NSLog(@"yes");
        }
    }
    //           // Set up the cell...
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([[DataPersistence getNowDateOrYesterdayDate:NO] isEqualToString:[self.dataPersistence.targetsList[indexPath.row][@"checkLog"] lastObject][@"date"]]) {
          NSLog(@"checked");
        [self.toDoListTableView reloadData];
    }else{
        [self.dataPersistence checkAnCheckLogAtIndex:indexPath.row];
        [self.dataPersistence reloadData];
        [self.toDoListTableView reloadData];
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"donothing");
    }];
}
@end
