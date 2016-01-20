//
//  dataPersistence.h
//  DesGo
//
//  Created by 高向孚 on 16/1/13.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataPersistence : NSObject
@property (nonatomic,strong) NSMutableArray * aCheckLog;
@property (nonatomic,strong) NSMutableArray * targetsList;
@property (nonatomic,strong) NSMutableArray * aCheckLogList;
@property (nonatomic,strong) NSMutableDictionary * allData;

+(NSString *)dataFilePath:(NSString *)somedatapath;  //return a path that includes somedatapath file

-(NSDictionary *)getAllData;
-(void)writeAllDataIntoFiles;
-(void)reloadData;
+(NSString*)getNowDateOrYesterdayDate:(BOOL)i;
+(instancetype)sharedInit;
-(void)creatNewTargetsWithTitle:(NSString*)title FinCheckNum:(NSInteger)finchecknum;

@end
