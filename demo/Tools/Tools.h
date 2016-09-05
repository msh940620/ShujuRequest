//
//  Tools.h
//  ZMMFramework
//
//  Created by Remionisce on 16/7/12.
//  Copyright © 2016年 杭州新航线软件科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor;

@interface Tools : NSObject
+(BOOL)dicContain:(NSDictionary *)dic withKey:(NSString *)key;
// check Empty
+ (BOOL)isEmpty:(NSString *)string;
+(NSString*)md5Base64:(NSString*)originalStr;
// MD5
+ (NSString *)md5:(NSString *)originalStr;
// calculate CharacterLength
+ (NSUInteger)calculateCharacterLength:(NSString *)str;

+ (BOOL)checkPhone:(NSString *)phone;

+ (BOOL)checkPassword:(NSString *)password;

+ (BOOL)checkEmail:(NSString *)email;

+(BOOL)checkIdentityCardNo:(NSString*)cardNo;

+ (BOOL)stringContainsEmoji:(NSString *)string;

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

+ (NSString *)checkImgTypeWithata: (NSData *)data;

+ (NSString *) urlEncoding:(NSString *)URL;

+ (NSString *) urlDecoding:(NSString *)URL;


+(NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr;

@end
