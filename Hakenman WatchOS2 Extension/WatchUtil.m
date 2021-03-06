//
//  WatchUtil.m
//  Hakenman
//
//  Created by lee jaeeun on 2015/10/02.
//  Copyright (c) 2015年 kjcode. All rights reserved.
//

#import "WatchUtil.h"
#import <WatchKit/WatchKit.h>
#import "NSDate+Helper.h"
#import "HKMConnectivityManager.h"

@implementation WatchUtil

+ (int)wathcOSVersion {
    return [[WKInterfaceDevice currentDevice].systemVersion floatValue] * 1000;
}

+ (NSString *)weekdayString:(int)weekday {
    //1 = Sunday, 2 = Monday, etc.
    
    NSString *weekString = nil;
    
    switch (weekday) {
        case weekSunday:
            weekString = LOCALIZE(@"Common_weekday_sunday");
            break;
        case weekMonday:
            weekString = LOCALIZE(@"Common_weekday_monday");
            break;
        case weekTueDay:
            weekString = LOCALIZE(@"Common_weekday_tueday");
            break;
        case weekWedDay:
            weekString = LOCALIZE(@"Common_weekday_wedday");
            break;
        case weekThuDay:
            weekString = LOCALIZE(@"Common_weekday_thuday");
            break;
        case weekFriDay:
            weekString = LOCALIZE(@"Common_weekday_friday");
            break;
        case weekSatDay:
            weekString = LOCALIZE(@"Common_weekday_satday");
            break;
        default:
            break;
    }
    
    return weekString;
}

+ (NSString *)monthString:(int)month {
    
    NSString *str = nil;
    
    switch (month) {
        case 1:
            str = LOCALIZE(@"Common_month_1");
            break;
        case 2:
            str = LOCALIZE(@"Common_month_2");
            break;
        case 3:
            str = LOCALIZE(@"Common_month_3");
            break;
        case 4:
            str = LOCALIZE(@"Common_month_4");
            break;
        case 5:
            str = LOCALIZE(@"Common_month_5");
            break;
        case 6:
            str = LOCALIZE(@"Common_month_6");
            break;
        case 7:
            str = LOCALIZE(@"Common_month_7");
            break;
        case 8:
            str = LOCALIZE(@"Common_month_8");
            break;
        case 9:
            str = LOCALIZE(@"Common_month_9");
            break;
        case 10:
            str = LOCALIZE(@"Common_month_10");
            break;
        case 11:
            str = LOCALIZE(@"Common_month_11");
            break;
        case 12:
            str = LOCALIZE(@"Common_month_12");
            break;
    }
    
    return str;
}

+ (NSString *)timeString:(NSString *)str {
    
    //yyyymmddHHmmss
    
    if (str == nil || str.length != 14) {
        return @"--:--";
    }
    
    NSString *hour = [str substringWithRange:NSMakeRange(8, 2)];
    NSString *min = [str substringWithRange:NSMakeRange(10, 2)];
    
    return [NSString stringWithFormat:@"%@:%@", hour, min];
}

+ (float)getWorkTime:(NSDate *)startTime endTime:(NSDate *)endTime {
    
    //start_time & end_time 語尾の桁数を００に変換
    
    //合計時間の計算のため秒単位の語尾を「00」に固定
    NSString *startStr = [startTime yyyyMMddHHmmssString];
    startStr = [startStr stringByReplacingCharactersInRange:(NSMakeRange(12, 2)) withString:@"00"];
    NSDate *convertStart = [NSDate convDate2String:startStr];
    
    NSString *endStr = [endTime yyyyMMddHHmmssString];
    endStr = [endStr stringByReplacingCharactersInRange:(NSMakeRange(12, 2)) withString:@"00"];
    NSDate *convertEnd = [NSDate convDate2String:endStr];
    
    NSTimeInterval since = [convertEnd timeIntervalSinceDate:convertStart];
    
    float resultSince1 = since/(60.f*60.f);
    float resultSince2 = resultSince1 * 100.f;
    float resultSince3 = ceilf(resultSince2);
    float resultSince4 = resultSince3/100.f;
    return resultSince4;
    
}

@end
