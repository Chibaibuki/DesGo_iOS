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
    [self.bkImageView setUserInteractionEnabled:YES];
    self.dataPersistence = [DataPersistence sharedInit];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
     tapGesture.numberOfTapsRequired=1;
    [self.bkImageView addGestureRecognizer:tapGesture];
    
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
    if ([self.targetTitle.text isEqualToString:@""]) {
        NSLog(@"empty");
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题不符合要求" message:@"请至少输入一个字符作为标题" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];

    }else{
        [self.dataPersistence creatNewTargetsWithTitle:self.targetTitle.text FinCheckNum:[self.targetFinNum.text intValue]];
    //            [self.dataPersistence.targetsList removeAllObjects];
    //    [self.dataPersistence writeAllDataIntoFiles];
        [self.dataPersistence reloadData];
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"do nothing");
        }];
    }
}

-(void)handleTapGesture:(UIGestureRecognizer*)sender{
    [self.targetTitle resignFirstResponder];
    [self.targetFinNum resignFirstResponder];
    
    NSLog(@"taped");

}

@end
