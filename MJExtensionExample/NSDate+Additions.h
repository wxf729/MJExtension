//
//  NSDate+Additions.h
//  KHealth
//
//  Created by wang hongxi on 13-10-14.
//  Copyright (c) 2013年 Beijing Dayactive CO. LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)


// NSString --> NSDate  @ "2014-03-11 06:44:11"
+ (NSDate *)wf_dateFromDateStr:(NSString *)dateStr;

+ (NSDate *)wf_dateFromDateStr2:(NSString *)dateStr;

+ (NSDate *)wf_dateFromDateStr3:(NSString *)dateStr;

- (NSString *)wf_nowDateStr;

//  NSDate --> NSString
- (NSString *)wf_dateStr;
- (NSString *)wf_dateStr2;
- (NSString *)wf_dateStr3;
- (NSString *)wf_dateStr4;


//  NSDate --> NSString
+ (NSString *)wf_dateStrFromDate:(NSDate *)date;

+ (NSString *)wf_dateStrFromDate2:(NSDate *)date;

+ (NSString *)wf_dateStrFromDate3:(NSDate *)date;

+ (NSString *)wf_dateStrFromDate4:(NSDate *)date;


#pragma - mark 分离日期的年月日、时分秒
- (NSDateComponents *)wf_dateComponents;

//  获取 时间dateStr与当前日期的时间间隔  @"2012-03-11 06:44:11"
+ (NSDateComponents *)wf_timeDiffComponentsFromDateStr:(NSString *)dateStr;

//  时间偏移，前进或者回退多少单位时间（年月日、时分秒）
+ (NSDate *)wf_dateByAddingCalendarUnits:(NSCalendarUnit)calendarUnit amount:(NSInteger)amount;




-(NSString *)dateString;
-(NSString *)dateString2;
-(NSString *)dateTimeString;
-(NSString *)dateTimeString2;
-(NSString *)shortDateString;
-(NSString *)shortTimeString;
-(NSString *)longTimeString;
-(NSString *)shortDateTimeString;
-(long long)milseconds;
+(NSDate *)dateFromYYYYMMDD:(NSString *)dateString;
+(NSDate *)dateWithYear:(int)year;

+ (NSString *) getTimeDiffString:(NSDate *) temp;

@end
