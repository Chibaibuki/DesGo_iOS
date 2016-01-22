//
//  AddTargetViewController.h
//  DesGo
//
//  Created by 高向孚 on 16/1/16.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataPersistence;
@interface AddTargetViewController : UIViewController
- (IBAction)cancelButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *targetTitle;
- (IBAction)rightClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *targetFinNum;
@property (weak, nonatomic) IBOutlet UIImageView *bkImageView;

@property (strong,nonatomic)DataPersistence *dataPersistence;
@end
