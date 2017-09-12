//
//  CalendarManager.m
//  CalendarManager
//
//  Created by cy on 2017/9/12.
//  Copyright © 2017年 Aisino. All rights reserved.
//


#import "CalendarManager.h"


#import <React/RCTConvert.h>

@implementation CalendarManager


RCT_EXPORT_MODULE();

// 接收传过来的 NSString
RCT_EXPORT_METHOD(addEventOne:(NSString *)name) {
    RCTLogInfo(@"接收传过来的NSString+NSString: %@", name);
}
// 接收传过来的 NSString + NSDictionary
RCT_EXPORT_METHOD(addEventTwo:(NSString *)name details:(NSDictionary *)details)
{
    RCTLogInfo(@"接收传过来的NSString+NSDictionary: %@ %@", name, details);
}

// 接收传过来的 NSString + date日期
RCT_EXPORT_METHOD(addEventThree:(NSString *)name date:(nonnull NSNumber *)secondsSinceUnixEpoch)
{
    NSDate *date = [RCTConvert NSDate:secondsSinceUnixEpoch];
    
    RCTLogInfo(@"date: %@", secondsSinceUnixEpoch);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    RCTLogInfo(@"NSDate: %@ %@", name, [formatter stringFromDate:date]);
}

// 接收传过来的 NSString + date日期
RCT_EXPORT_METHOD(addEventThree2:(NSString *)name date:(NSString *)ISO8601DateString)
{
    NSDate *date = [RCTConvert NSDate:ISO8601DateString];
    
    RCTLogInfo(@"date2: %@", ISO8601DateString);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    RCTLogInfo(@"NSDate: %@ %@", name, [formatter stringFromDate:date]);
}

// 接收传过来的 NSString + date日期
RCT_EXPORT_METHOD(addEventThree3:(NSString *)name date:(NSDate *)date)
{
    RCTLogInfo(@"date3: %@", date);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    RCTLogInfo(@"NSDate: %@ %@", name, [formatter stringFromDate:date]);
}

//  对外提供调用方法,演示Callback
RCT_EXPORT_METHOD(testCallbackEventOne:(NSString *)name callback:(RCTResponseSenderBlock)callback)
{
    RCTLogInfo(@"%@",name);
    NSArray *events=@[@"1", @"2", @"3",@"4"]; //准备回调回去的数据
    callback(@[[NSNull null],events]);
}

//Promises
//  对外提供调用方法,演示Promise使用
RCT_REMAP_METHOD(testCallbackEventTwo,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSArray *events =@[@"one ",@"two ",@"three"];//准备回调回去的数据
    if (events) {
        resolve(events);
    } else {
        NSError *error=[NSError errorWithDomain:@"我是Promise回调错误信息..." code:101 userInfo:nil];
        reject(@"no_events", @"There were no events", error);
    }
}

- (NSDictionary *)constantsToExport
{
    return @{ @"ValueOne": @"我是从原生定义的~" };
}


// 清理缓存
RCT_EXPORT_METHOD(cleanCache:(RCTResponseSenderBlock)callback)
{
    NSURLCache *httpCache = [NSURLCache sharedURLCache];
    [httpCache removeAllCachedResponses];
    NSUInteger cache = [httpCache currentDiskUsage];
    callback(@[[NSNull null],@(cache)]);
}

// 计算缓存
RCT_EXPORT_METHOD(cacheSize:(RCTResponseSenderBlock)callback)
{
    NSURLCache *httpCache = [NSURLCache sharedURLCache];
    NSUInteger cache = [httpCache currentDiskUsage];
    callback(@[[NSNull null],@(cache)]);
}

@end

