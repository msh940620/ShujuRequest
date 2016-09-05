//
//  HttpConnection.h
//  Ancun
//
//  Created by Start on 13-9-12.
//
//

#import <UIKit/UIKit.h>

typedef void (^RequestSuccessed)(id respDic,NSInteger code,NSString *message);

typedef void (^RequestFailed)(id respDic,NSInteger code,NSString *message);

@interface AliRequest : NSObject<NSURLConnectionDataDelegate>

+ (AliRequest *)loadWithMethodName:(NSString *)methodName andParams:(NSDictionary *)params successed:(RequestSuccessed)requestSuccessed failed:(RequestFailed)requestFailed;
@end