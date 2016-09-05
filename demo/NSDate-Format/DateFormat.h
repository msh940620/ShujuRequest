//
//  DateFormat.h
//  IGeeseApp
//
//  Created by Reminisce on 16/7/14.
//  Copyright (c) 2016 chuzhaozhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateFormat : NSObject

+(NSString *)timeIntervalToTime:(double)timeInterval format:(NSString *)format;
+(NSString *)timeIntervalToAutoTime:(double)timeInterval;
+(double)timeToTimeInterval:(NSString *)time format:(NSString *)format;
+(NSString *)getGMTTime;
@end
