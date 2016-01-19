//
//  dataPersistence.h
//  DesGo
//
//  Created by 高向孚 on 16/1/13.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataPersistence : NSObject
@property (nonatomic,strong) NSMutableArray * aCheckLog;
@property (nonatomic,strong) NSMutableArray * targetsList;

+(NSString *)dataFilePath:(NSString *)somedatapath;  //return a path that includes somedatapath file

-(NSDictionary *)getAllData;
-(void)writeAllDataIntoFiles:(NSString *)somedatapath;



@end
