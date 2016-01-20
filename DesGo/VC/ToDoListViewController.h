//
//  ToDoListViewController.h
//  DesGo
//
//  Created by 高向孚 on 16/1/19.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataPersistence;

@interface ToDoListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *toDoListTableView;
- (IBAction)cancelButtonClicked:(UIButton *)sender;
@property(strong,nonatomic)DataPersistence *dataPersistence;
@end
