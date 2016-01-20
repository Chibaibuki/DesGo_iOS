//
//  dataPersistence.m
//  DesGo
//
//  Created by 高向孚 on 16/1/13.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import "DataPersistence.h"

@implementation DataPersistence

+(instancetype)sharedInit{
    DataPersistence * dataPersistence
    = [[DataPersistence alloc]init];
//    dataPresistence.aCheckLog = [[dataPresistence alloc]init];
    dataPersistence.aCheckLog = [[NSMutableArray alloc]init];
    dataPersistence.allDataDetail = [[NSMutableDictionary alloc]init];
    
    return dataPersistence;
}

+(NSString *)dataFilePath:(NSString *)somedatapath{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = paths[0];
    return [documentsDirectory stringByAppendingPathComponent:somedatapath];
}

-(NSDictionary *)getAllData{
    NSString *path = [DataPersistence dataFilePath:@"Data.plist"];
    NSDictionary *allDataDic = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    return allDataDic;
}

-(NSMutableArray *)getTargetList{
    NSMutableArray * mutableTargetList = [[NSMutableArray alloc]init];
    [mutableTargetList addObjectsFromArray:[self getAllData][@"targets"]];
    
    return mutableTargetList;
}

-(NSMutableArray *)getCheckLogAtIndex:(int)i{
    NSMutableArray *mutableCheckLog = [[NSMutableArray alloc]init];
    mutableCheckLog = [self getTargetList][i][@"checkLog"];
    
    return mutableCheckLog;
}

-(NSMutableArray *)checkAnCheckLogAtIndex:(int)i{
    NSMutableArray *mutableCheckLog = [self getCheckLogAtIndex:i];
    NSDate *nowDate = [NSDate date];
    NSDateFormatter * dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *nowDateString = [dataFormatter stringFromDate:nowDate];
    NSDictionary * aCheckDic = [[NSDictionary alloc]initWithObjectsAndKeys:nowDateString,@"date",@"1",@"checked", nil];
    [mutableCheckLog addObject:aCheckDic];
    
    return mutableCheckLog;
}

+(NSString*)getNowDateOrYesterdayDate:(BOOL)i{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter * dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:@"yyyy-MM-dd"];
    if (i) {
            NSDate *yesterdayDate = [NSDate dateWithTimeIntervalSince1970:nowDate.timeIntervalSince1970-3600*24];
        return [dataFormatter stringFromDate:yesterdayDate];
    }else return [dataFormatter stringFromDate:nowDate];
}

-(void)writeAllDataIntoFiles:(NSString *)somedatapath{
    
}

@end
