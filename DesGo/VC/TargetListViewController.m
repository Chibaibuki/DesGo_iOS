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
#import "dataPersistence.h"
@interface TargetListViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TargetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testDetail = [[NSDictionary alloc]init];
    NSString* filePath = [dataPersistence dataFilePath:@"testData.plist"];
    self.testList = [[NSMutableArray alloc]init];
    NSArray * tmpArray = [[NSArray alloc]initWithContentsOfFile:filePath];
    [self.testList addObjectsFromArray:tmpArray];
    UIApplication * app = [UIApplication sharedApplication];
    NSDate *nowDate = [NSDate date];
    NSLog(@"date is %@",nowDate);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    
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
    return self.testList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    static NSString *TargetListTableViewCellIdentifier = @"TargetListTableViewCell";
    TargetListTableViewCell *cell = (TargetListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:TargetListTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TargetListTableViewCell" owner:self options:nil] lastObject];
        cell.targetTitle.text = self.testList[indexPath.row][@"title"];
        cell.targetNowNum.text = self.testList[indexPath.row][@"nowTime"];
        cell.targetFinNum.text = self.testList[indexPath.row][@"targetTime"];
        cell.consecutiveCheckNum.text = self.testList[indexPath.row][@"contiTime"];
    }
    //           // Set up the cell...
    return cell;

}

#pragma mark - For testing the data persistence


-(void)applicationWillResignActive:(NSNotification*)notifacation{
    NSString *filePath = [dataPersistence dataFilePath:@"testData.plist"];
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
}
@end
