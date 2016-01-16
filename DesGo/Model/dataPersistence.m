//
//  dataPersistence.m
//  DesGo
//
//  Created by 高向孚 on 16/1/13.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import "dataPersistence.h"

@implementation dataPersistence

+(NSString *)dataFilePath:(NSString *)somedatapath{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = paths[0];
    return [documentsDirectory stringByAppendingPathComponent:somedatapath];
}

@end
