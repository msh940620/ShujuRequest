//
//  OCRPostTools.h
//  CatInsurance
//
//  Created by Reminisce on 16/8/29.
//  Copyright (c) 2016 杭州新航线软件科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCRPostTools : NSObject

typedef void (^OCRPostResult)(NSDictionary *respDic,BOOL state);

+(void)loadIDCardInfo:(UIImage *)image withBlock:(OCRPostResult)block;

+(void)loadDriverLicenseInfo:(UIImage *)image withBlock:(OCRPostResult)block;

@end
