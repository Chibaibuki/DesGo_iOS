//
//  AddTargetViewController.m
//  DesGo
//
//  Created by 高向孚 on 16/1/16.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import "AddTargetViewController.h"
#import "DataPersistence.h"
@interface AddTargetViewController ()

@end

@implementation AddTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataPersistence = [DataPersistence sharedInit];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Do nothing");
    }];
}
- (IBAction)rightClicked:(UIButton *)sender {
    [self.dataPersistence creatNewTargetsWithTitle:self.targetTitle.text FinCheckNum:[self.targetFinNum.text intValue]];
//            [self.dataPersistence.targetsList removeAllObjects];
//    [self.dataPersistence writeAllDataIntoFiles];
    [self.dataPersistence reloadData];
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"do nothing");
    }];
    
}
@end
