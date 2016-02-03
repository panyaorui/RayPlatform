//
//  FMDatabaseVersion.h
//  FmdbTest
//
//  Created by ray on 15/9/25.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDatabaseVersion : NSObject
/**
 * 初始化数据库
 **/
+(NSString *)initDatabase:(NSString*)version :(NSString*)toPath :(NSString*)name;
/**
 * 初始化数据库
 **/
+(NSString *)initDatabase:(NSString*)version :(NSString*)name;
@end
