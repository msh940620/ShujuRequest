//
//  DateFormat.m
//  IGeeseApp
//
//  Created by Reminisce on 16/7/14.
//  Copyright (c) 2016 chuzhaozhi. All rights reserved.
//

#import "DateFormat.h"

@implementation DateFormat


+(NSString *)timeIntervalToTime:(double)timeInterval format:(NSString *)format{
    if(timeInterval <= 0){
        return @"";
    }
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timeInterval];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    dateFormatter.dateFormat = format;

    return [dateFormatter stringFromDate:date];

}

+(NSString *)timeIntervalToAutoTime:(double)timeInterval {
    if(timeInterval <= 0){
        return @"";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    NSDate *now = [NSDate date];
    NSString *dateNow = [dateFormatter stringFromDate:now];
    if ([dateSMS isEqualToString:dateNow]) {
        [dateFormatter setDateFormat:@"HH:mm"];
    } else {
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    }
    dateSMS = [dateFormatter stringFromDate:date];

    return dateSMS;
}

+(double)timeToTimeInterval:(NSString *)time format:(NSString *)format{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSDate* date = [dateFormatter dateFromString:time];
    return [date timeIntervalSince1970];

}

+(NSString *)getGMTTime{

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];

    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];

    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"E, dd MMM yyyy HH:mm:ss z"];
    dateFormatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_UK"];
    return  [dateFormatter stringFromDate:[NSDate date]];

}

@end
