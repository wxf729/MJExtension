//
//  NSDate+Additions.m
//  KHealth
//
//  Created by wang hongxi on 13-10-14.
//  Copyright (c) 2013年 Beijing Dayactive CO. LTD. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)


//  得到本地时间，避免时区问题
- (NSDate *)wf_localDate {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:self];
    NSDate *localDate = [self dateByAddingTimeInterval:interval];

    return localDate;
}

// NSString --> NSDate  @ "2014-03-11 06:44:11"
+ (NSDate *)wf_dateFromDateStr:(NSString *)dateStr {
    
    // 1.创建一个时间格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 2.格式化对象的样式/z大小写都行/格式必须严格和字符串时间一样
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 3.利用时间格式化对象让字符串转换成时间 (自动转换0时区/东加西减)
    NSDate *date = [formatter dateFromString:dateStr];
    
    NSLog(@"%@",date);
    
    //  得到本地时间，避免时区问题
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    
    return localDate;
}

+ (NSDate *)wf_dateFromDateStr2:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:dateStr];
    NSLog(@"%@",date);
    
    return [date wf_localDate];
}

+ (NSDate *)wf_dateFromDateStr3:(NSString *)dateStr {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *date = [formatter dateFromString:dateStr];
    NSLog(@"%@",date);
    
    return [date wf_localDate];
}


- (NSString *)wf_nowDateStr {
    
    NSDate * nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *str = [formatter stringFromDate:[nowDate wf_localDate]];
    
    NSLog(@"%@",str);
    
    return str;
}

//  NSDate --> NSString
- (NSString *)wf_dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *str = [formatter stringFromDate:self];
    
    NSLog(@"%@",str);
    
    return str;
}

- (NSString *)wf_dateStr2 {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *str = [formatter stringFromDate:self];
    
    NSLog(@"%@",str);
    
    return str;
}

- (NSString *)wf_dateStr3 {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *str = [formatter stringFromDate:self];
    
    NSLog(@"%@",str);
    
    return str;
}

- (NSString *)wf_dateStr4 {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm";
    NSString *str = [formatter stringFromDate:self];
    
    NSLog(@"%@",str);
    
    return str;
}


//  NSDate --> NSString
+ (NSString *)wf_dateStrFromDate:(NSDate *)date {
    
    // 1.创建一个时间格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 2.设置时间格式化对象的样式
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 3.利用时间格式化对象对时间进行格式化
    NSString *str = [formatter stringFromDate:date];
    
    NSLog(@"%@",str);
    
    return str;
}

+ (NSString *)wf_dateStrFromDate2:(NSDate *)date {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *str = [formatter stringFromDate:date];
    
    NSLog(@"%@",str);
    
    return str;
}

+ (NSString *)wf_dateStrFromDate3:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *str = [formatter stringFromDate:date];
    
    NSLog(@"%@",str);
    
    return str;
}

+ (NSString *)wf_dateStrFromDate4:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd";
    NSString *str = [formatter stringFromDate:date];
    
    NSLog(@"%@",str);
    
    return str;
}

#pragma - mark 分离日期的年月日、时分秒
- (NSDateComponents *)wf_dateComponents {
    
    // 注意获取calendar,应该根据系统版本判断
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit type =
    NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;

    NSDateComponents * cmps = [calendar components:type fromDate:self];
    
    return cmps;
}

//  获取 时间dateStr与当前日期的时间间隔  @"2012-03-11 06:44:11"
+ (NSDateComponents *)wf_timeDiffComponentsFromDateStr:(NSString *)dateStr {
    
    // 时间字符串
    NSDate * fromDate = [NSDate wf_dateFromDateStr:dateStr];

/*
    NSString *str = @"2012-03-11 06:44:11 +0800";
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
 */
    
    NSDate *now = [NSDate date];
    
    // 注意获取calendar,应该根据系统版本判断
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit type = NSCalendarUnitYear |
                          NSCalendarUnitMonth |
                          NSCalendarUnitDay |
                          NSCalendarUnitHour |
                          NSCalendarUnitMinute |
                          NSCalendarUnitSecond;
    
    // 4.获取了时间元素
    NSDateComponents *cmps = [calendar components:type fromDate:fromDate toDate:now options:0];
    
    NSLog(@"时间间隔: %ld年%ld月%ld日%ld小时%ld分钟%ld秒钟", (long)cmps.year, (long)cmps.month, (long)cmps.day, (long)cmps.hour, (long)cmps.minute, (long)cmps.second);
    
    return cmps;
}

//  时间偏移，前进或者回退多少单位时间（年月日、时分秒）
+ (NSDate *)wf_dateByAddingCalendarUnits:(NSCalendarUnit)calendarUnit amount:(NSInteger)amount {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *newDate;
    
    switch (calendarUnit) {
            
        case NSCalendarUnitSecond:
            [components setSecond:amount];
            break;
        case NSCalendarUnitMinute:
            [components setMinute:amount];
            break;
        case NSCalendarUnitHour:
            [components setHour:amount];
            break;
        case NSCalendarUnitDay:
            [components setDay:amount];
            break;
        case NSCalendarUnitWeekOfYear:
            [components setWeekOfYear:amount];
            break;
        case NSCalendarUnitMonth:
            [components setMonth:amount];
            break;
        case NSCalendarUnitYear:
            [components setYear:amount];
            break;
        default:
            NSLog(@"addCalendar does not support that calendarUnit!");
            break;
    }
    
    newDate = [gregorian dateByAddingComponents:components toDate:self options:0];
    
    return newDate;
}


+(NSDateFormatter *)dateFormatter2{
    static NSDateFormatter *dateFormatter2 = nil;
    if (dateFormatter2 == nil) {
        dateFormatter2 = [NSDateFormatter new];
        [dateFormatter2 setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd"]];
        [dateFormatter2 setLocale:[NSLocale currentLocale]];
    }
    return dateFormatter2;
}

-(NSString *)dateString{
    static NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:[NSString stringWithFormat:@"yyyy.MM.dd"]];
        [dateFormatter setLocale:[NSLocale currentLocale]];
    }
	return [dateFormatter stringFromDate:self];
}

-(NSString *)dateString2{
	return [[NSDate dateFormatter2] stringFromDate:self];
}

-(NSString *)dateTimeString{
    static NSDateFormatter *dateTimeFormatter = nil;
    if (dateTimeFormatter == nil) {
        dateTimeFormatter = [NSDateFormatter new];
        [dateTimeFormatter setDateFormat:[NSString stringWithFormat:@"yyyy.MM.dd HH:mm"]];
        [dateTimeFormatter setLocale:[NSLocale currentLocale]];
    }
	return [dateTimeFormatter stringFromDate:self];
    
}

-(NSString *)dateTimeString2{
    static NSDateFormatter *dateTimeFormatter2 = nil;
    if (dateTimeFormatter2 == nil) {
        dateTimeFormatter2 = [NSDateFormatter new];
        [dateTimeFormatter2 setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd HH:mm"]];
        [dateTimeFormatter2 setLocale:[NSLocale currentLocale]];
    }
	return [dateTimeFormatter2 stringFromDate:self];
    
}

-(NSString *)shortDateString{
    static NSDateFormatter *shortDateFormatter = nil;
    if (shortDateFormatter == nil) {
        shortDateFormatter = [NSDateFormatter new];
        [shortDateFormatter setDateFormat:[NSString stringWithFormat:@"MM.dd"]];
        [shortDateFormatter setLocale:[NSLocale currentLocale]];
    }
	return [shortDateFormatter stringFromDate:self];
    
}

-(NSString *)shortDateTimeString{
    static NSDateFormatter *shortDatetimeFormatter = nil;
    if (shortDatetimeFormatter == nil) {
        shortDatetimeFormatter = [NSDateFormatter new];
        [shortDatetimeFormatter setDateFormat:[NSString stringWithFormat:@"M月d日 H:mm"]];
        [shortDatetimeFormatter setLocale:[NSLocale currentLocale]];
    }
	return [shortDatetimeFormatter stringFromDate:self];
    
}

-(NSString *)shortTimeString{
    static NSDateFormatter *shortTimeFormatter = nil;
    if (shortTimeFormatter == nil) {
        shortTimeFormatter = [NSDateFormatter new];
        [shortTimeFormatter setDateFormat:[NSString stringWithFormat:@"HH:mm"]];
        [shortTimeFormatter setLocale:[NSLocale currentLocale]];
    }
	return [shortTimeFormatter stringFromDate:self];
    
}

-(NSString *)longTimeString{
    static NSDateFormatter *longTimeFormatter = nil;
    if (longTimeFormatter == nil) {
        longTimeFormatter = [NSDateFormatter new];
        [longTimeFormatter setDateFormat:[NSString stringWithFormat:@"HH:mm:ss"]];
        [longTimeFormatter setLocale:[NSLocale currentLocale]];
    }
	return [longTimeFormatter stringFromDate:self];
    
}

-(long long)milseconds{
    NSTimeInterval timeInteval = [self timeIntervalSince1970]*1000;
    return [[NSNumber numberWithDouble:timeInteval] longLongValue];
}

+(NSDate *)dateFromYYYYMMDD:(NSString *)dateString{
    return [[self dateFormatter2] dateFromString:dateString];
}

+(NSDate *)dateWithYear:(int)year{
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    [components setYear:year];
    NSDate * date = [calendar dateFromComponents:components];
  
    
//  得到本地时间，避免时区问题
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];

    return localeDate;
}


+ (NSString *)getTimeDiffString:(NSDate *) temp
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *today = [NSDate date];//当前时间
    unsigned int unitFlag = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
    NSDateComponents *gap = [cal components:unitFlag fromDate:today toDate:temp options:0];//计算时间差
    
    if (ABS([gap day]) > 0)
    {
        return [NSString stringWithFormat:@"%@",[temp shortDateTimeString]];
//        return [NSString stringWithFormat:@"%d天前", ABS([gap day])];
    }else if(ABS([gap hour]) > 0)
    {
        return [NSString stringWithFormat:@"%ld小时前", ABS([gap hour])];
    }else{
        if (ABS([gap minute]) == 0) {
            return [NSString stringWithFormat:@"刚刚"];
        }
        return [NSString stringWithFormat:@"%ld分钟前",  ABS([gap minute])];
    }
}


@end
