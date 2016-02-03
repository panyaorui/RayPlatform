//
//  FMDatabaseVersion.m
//  FmdbTest
//
//  Created by ray on 15/9/25.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "FMDatabaseVersion.h"

@implementation FMDatabaseVersion

+(NSString *)initDatabase:(NSString*)version :(NSString*)name
{
    NSString * toPath = @"/Documents/";
    toPath = [toPath stringByAppendingString:name];
    return [self initDatabase:version :toPath :name];
    //return [NSHomeDirectory() stringByAppendingString:toPath];
}

+(NSString *)initDatabase:(NSString*)version :(NSString*)path :(NSString*)name
{
    @try
    {
        NSString *datebaseVersion = version;
        NSString *datebaseKey = @"datebase_version";
        NSString *_name = @"";
        NSString *_type = @"";
        NSString *toPath = @"";
        
        
        BOOL result = NO;
        
        //将名称拆分为名称和类型
        NSArray *array = [name componentsSeparatedByString:@"."]; //从字符A中分隔成2个元素的数组
        if(array.count == 2){
            _name = array[0];
            _type = array[1];
        }else{
             NSLog(@"数据库名称不合法");
        }
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *version = [userDefaults valueForKey:datebaseKey];
        toPath = [NSHomeDirectory() stringByAppendingString:path];
        if(![datebaseVersion isEqualToString:version])
        {
            NSString *sourcePath = [[NSBundle mainBundle] pathForResource:_name ofType:_type];
            BOOL b = [[NSFileManager defaultManager] fileExistsAtPath:toPath];
            if(b)
            {
                [[NSFileManager defaultManager] removeItemAtPath:toPath error:nil];
            }
            b = [[NSFileManager defaultManager] fileExistsAtPath:toPath];
            result = [[NSFileManager defaultManager]copyItemAtPath:sourcePath toPath:toPath error:nil];
            if(result)
            {//写入成功，记录文件
                [userDefaults setValue:datebaseVersion forKey:datebaseKey];
            }
            NSLog(@"拷贝数据库成功");
        }
        return toPath;
    } @catch(NSException *exception)
    {
        NSLog(@"拷贝数据库错误");
    }
}

@end
