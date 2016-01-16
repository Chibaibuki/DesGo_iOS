//
//  TargetListViewController.h
//  DesGo
//
//  Created by 高向孚 on 16/1/15.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataPersistence.h"
@interface TargetListViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITableView *targetListTableView;
@property (strong,nonatomic)NSDictionary * testDetail;
@property (strong,nonatomic)NSMutableArray * testList;

@end
