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
    dataPersistence.allData = [[NSMutableDictionary alloc]init];
    dataPersistence.targetsList = [[NSMutableArray alloc]init];
    [dataPersistence writeAllDataIntoDic];
    return dataPersistence;
}



+(NSString *)dataFilePath:(NSString *)somedatapath{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = paths[0];
    return [documentsDirectory stringByAppendingPathComponent:somedatapath];
}
-(void)reloadData{
    [self writeAllDataIntoDic];
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

-(NSMutableDictionary *)getDataDetailAtIndex:(int)i{
    NSMutableDictionary *dataDetail = [[NSMutableDictionary alloc]initWithDictionary:[self getTargetList][i][@"detail"]];
    
    return dataDetail;
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

-(void)writeAllDataIntoDic{
//    NSMutableDictionary * allMutableData = [[NSMutableDictionary alloc]init];
    [self.targetsList removeAllObjects];
    NSMutableArray * targetsList = [self getTargetList];
    NSUInteger targetsCount = targetsList.count;
    for (int i=0; i<targetsCount; i++) {
        NSMutableArray * checkLog = [[NSMutableArray alloc]init];
        [checkLog addObjectsFromArray:[self getCheckLogAtIndex:i]];
        NSMutableDictionary * targetsDetail = [[NSMutableDictionary alloc]init];
        targetsDetail = [self getDataDetailAtIndex:i];
        
        NSMutableDictionary * aTargetDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:targetsDetail,@"detail",checkLog,@"checkLog" ,nil];
        
        [self.targetsList addObject:aTargetDic];
    }
}

-(void)checkAnCheckLogAtIndex:(int)i{

    NSString *nowDateString = [DataPersistence getNowDateOrYesterdayDate:NO];
    NSString *yesterdayDateString = [DataPersistence getNowDateOrYesterdayDate:YES];
    NSDictionary * aCheckDic = [[NSDictionary alloc]initWithObjectsAndKeys:nowDateString,@"date",@"1",@"checked", nil];
    if (![yesterdayDateString isEqualToString:[self.targetsList lastObject][@"checkLog"][@"date"]]) {

        self.targetsList[i][@"consecutiveCheckNum"] = @"1";
        
    }else{
        NSInteger nowConsecutiveCheckNum = [self.targetsList[i][@"consecutiveCheckNum"] intValue];
        nowConsecutiveCheckNum++;
        self.targetsList[i][@"consecutiveCheckNum"] = [NSString stringWithFormat:@"%ld",nowConsecutiveCheckNum];
    }
    NSInteger nowCheckNum = [self.targetsList[i][@"nowCheckNum"] intValue];
    nowCheckNum++;
    self.targetsList[i][@"nowCheckNum"] = [NSString stringWithFormat:@"%ld",nowCheckNum];
    
    [self.targetsList[i][@"checkLog"] addObject:aCheckDic];
}

-(void)creatNewTargetsWithTitle:(NSString*)title FinCheckNum:(NSInteger)finchecknum{
    NSMutableArray * checkLog = [[NSMutableArray alloc]init];
    NSMutableDictionary * aNewTargetDetail = [[NSMutableDictionary alloc]initWithObjectsAndKeys:title,@"targetTitle",[NSString stringWithFormat:@"%ld",finchecknum],@"finCheckNum",@"0",@"nowCheckNum",@"0",@"consecutiveCheckNum",nil];
    NSMutableDictionary * aNewTarget = [[NSMutableDictionary alloc]initWithObjectsAndKeys:aNewTargetDetail,@"detail",checkLog,@"checkLog", nil];
    
    [self.targetsList addObject:aNewTarget];
}

-(void)writeAllDataIntoFiles{
        NSString *path = [DataPersistence dataFilePath:@"Data.plist"];
    self.allData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:self.targetsList,@"targets",[DataPersistence getNowDateOrYesterdayDate:NO],@"latestChangeDate", nil];
    
    [self.allData writeToFile:path atomically:YES];
}


@end
