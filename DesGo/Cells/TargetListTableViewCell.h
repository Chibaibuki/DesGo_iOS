//
//  TargetListTableViewCell.h
//  DesGo
//
//  Created by 高向孚 on 16/1/15.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *targetTitle;
@property (weak, nonatomic) IBOutlet UILabel *targetFinNum;
@property (weak, nonatomic) IBOutlet UILabel *targetNowNum;
@property (weak, nonatomic) IBOutlet UILabel *consecutiveCheckNum;

@end
