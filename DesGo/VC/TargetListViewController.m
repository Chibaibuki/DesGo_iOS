//
//  TargetListViewController.m
//  DesGo
//
//  Created by 高向孚 on 16/1/15.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import "TargetListViewController.h"
#import "TargetListTableViewCell.h"
#import "AddTargetViewController.h"
#import "DataPersistence.h"
#import "ToDoListViewController.h"
@interface TargetListViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TargetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

                                         
    UIApplication * app = [UIApplication sharedApplication];
    
//    NSDate *yesterdayDate =[nowDate earlierDate:nowDate-1];
//        NSLog(@"date is %@",[dataFormatter stringFromDate:yesterdayDate]);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    self.dataPersistence = [DataPersistence sharedInit];
    NSLog(@"%@",[DataPersistence getNowDateOrYesterdayDate:YES]);
    NSLog(@"%@",[DataPersistence getNowDateOrYesterdayDate:NO] );
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.dataPersistence reloadData];
    [self.targetListTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ViewController DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",self.dataPersistence.targetsList.count);
    NSLog(@"haha");
    return self.dataPersistence.targetsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    static NSString *TargetListTableViewCellIdentifier = @"TargetListTableViewCell";
    TargetListTableViewCell *cell = (TargetListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:TargetListTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TargetListTableViewCell" owner:self options:nil] lastObject];
        cell.targetTitle.text = self.dataPersistence.targetsList[indexPath.row][@"detail"][@"targetTitle"];
        cell.targetNowNum.text = self.dataPersistence.targetsList[indexPath.row][@"detail"][@"nowCheckNum"];
        cell.targetFinNum.text = self.dataPersistence.targetsList[indexPath.row][@"detail"][@"finCheckNum"];
        cell.consecutiveCheckNum.text = self.dataPersistence.targetsList[indexPath.row][@"detail"][@"consecutiveCheckNum"];
    }
    //           // Set up the cell...
    return cell;

}

#pragma mark - For testing the data persistence


-(void)applicationWillResignActive:(NSNotification*)notifacation{
    NSString *filePath = [DataPersistence dataFilePath:@"testData.plist"];
    [self.testList removeAllObjects];
    NSDictionary * dic1  = [NSDictionary dictionaryWithObjectsAndKeys:@"每天编码6小时",@"title",@"33",@"nowTime",@"/99",@"targetTime",@"33",@"contiTime",nil];
        NSDictionary * dic2  = [NSDictionary dictionaryWithObjectsAndKeys:@"每天编看xx书",@"title",@"34",@"nowTime",@"/98",@"targetTime",@"34",@"contiTime",nil];
            NSDictionary * dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"每天编看xx电影",@"title",@"35",@"nowTime",@"/97",@"targetTime",@"35",@"contiTime",nil];
    
    [self.testList addObject:dic1];
    [self.testList addObject:dic2];
    [self.testList addObject:dic3];
    
    [self.testList writeToFile:filePath atomically:YES];
    NSLog(@"fin");
}

- (IBAction)addTargetClicked:(UIButton *)sender {
    AddTargetViewController * modalView = [[AddTargetViewController alloc]initWithNibName:@"AddTargetViewController" bundle:nil];
    modalView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    // [self presentModalViewController:modalView animated:YES];  ios 6 弃用了该方法
    [self presentViewController:modalView animated:YES completion:nil];
    ///
    

}

- (IBAction)todoListClicked:(UIButton *)sender {
    NSLog(@"Clicked");
    ToDoListViewController * todoListVc =  [[ToDoListViewController alloc]initWithNibName:@"ToDoListViewController" bundle:nil];
    todoListVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:todoListVc animated:YES completion:nil];

}
@end
