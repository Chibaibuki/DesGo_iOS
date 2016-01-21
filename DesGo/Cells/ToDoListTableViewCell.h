//
//  ToDoListTableViewCell.h
//  DesGo
//
//  Created by 高向孚 on 16/1/19.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *targetTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *checkedImageView;

@end
