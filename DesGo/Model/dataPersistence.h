//
//  dataPersistence.h
//  DesGo
//
//  Created by 高向孚 on 16/1/13.
//  Copyright © 2016年 ByStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataPersistence : NSObject

+(NSString *)dataFilePath:(NSString *)somedatapath;  //return a path that includes somedatapath file
@end
