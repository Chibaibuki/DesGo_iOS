//
//  TargetListViewController.h
//  DesGo
//
//  Created by 高向孚 on 16/1/15.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataPersistence;
@interface TargetListViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITableView *targetListTableView;
@property (strong,nonatomic)NSDictionary * testDetail;
@property (strong,nonatomic)NSMutableArray * testList;
@property (strong,nonatomic)DataPersistence *dataPersistence;
- (IBAction)addTargetClicked:(UIButton *)sender;
- (IBAction)todoListClicked:(UIButton *)sender;
- (IBAction)cancelButtonClicked:(UIButton *)sender;

@end
