//
//  OCRPostTools.m
//  CatInsurance
//
//  Created by Reminisce on 16/8/29.
//  Copyright (c) 2016 杭州新航线软件科技有限公司. All rights reserved.
//

#import "OCRPostTools.h"
#import "AliRequest.h"
#import "UIImage+extend.h"

@implementation OCRPostTools

+(void)loadIDCardInfo:(UIImage *)image withBlock:(OCRPostResult)block{
    
    [AliRequest loadWithMethodName:@"ocr_idcard" andParams:@{} successed:^(id respDic, NSInteger code, NSString *message) {

    } failed:^(id respDic, NSInteger code, NSString *message) {

    }];
    
    
}

+(void)loadDriverLicenseInfo:(UIImage *)image withBlock:(OCRPostResult)block{

    NSString *base64str = [image UIImageToBase64Str:image];
    
    [AliRequest loadWithMethodName:@"ocr_driver_license" andParams:@{@"image": @{@"dataType": @(50), @"dataValue": base64str}} successed:^(id respDic, NSInteger code, NSString *message) {
        
    } failed:^(id respDic, NSInteger code, NSString *message) {

    }];
}

@end
