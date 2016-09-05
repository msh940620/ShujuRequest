
#import "AliRequest.h"
#import "GHNSString+HMAC.h"
#import "DateFormat.h"
#import "GHNSData+Base64.h"
#import "Tools.h"

#define AccessKeyId @""
#define AccessKeySecret @""
#define AliHost @"https://shujuapi.aliyun.com"
#define AliUrl @"/dataplus/ocr/"
@implementation AliRequest{
    NSInteger _type;
}

+ (AliRequest *)loadWithMethodName:(NSString *)methodName andParams:(NSDictionary *)params successed:(RequestSuccessed)requestSuccessed failed:(RequestFailed)requestFailed{

    AliRequest *proxy = [[AliRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"%@%@%@",AliHost,AliUrl,methodName];
    NSString *date = [DateFormat getGMTTime];
    NSString *method = @"POST";
    NSString *accept = @"json";
    NSString *contentType = @"application/json";
    NSDictionary *request;
    if(!params){
        request = @{@"inputs":@[]};
    }else{
        request = @{@"inputs":@[params]};
    }

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:request
                                                       options:0 error:nil];
    NSString *requestBodyContent;
    if(jsonData){
        requestBodyContent =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        requestBodyContent = @"";
    }
    
    NSString *base64Md5 = [Tools md5Base64:requestBodyContent];

    NSString *strToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@",method,accept,base64Md5,contentType,date,[NSString stringWithFormat:@"%@%@",AliUrl,methodName]];
    
    NSString *signature = [strToSign gh_HMACSHA1:AccessKeySecret];
    
    NSString *authHeaders = [NSString stringWithFormat:@"Dataplus %@:%@",AccessKeyId,signature];

    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    urlRequest.timeoutInterval = 30;
    [urlRequest setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [urlRequest setValue:accept forHTTPHeaderField:@"accept"];
    [urlRequest setValue:date forHTTPHeaderField:@"date"];
    [urlRequest setValue:authHeaders forHTTPHeaderField:@"Authorization"];
    urlRequest.HTTPBody = jsonData;
    urlRequest.HTTPMethod = method;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
           if(error){
               if(requestFailed){
                   requestFailed(nil,0,@"网络链接错误");
               }
           } else if(data){
               //格式转换 成dic
               NSDictionary *respDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
               NSString *str =  [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
               
               if([respDict[@"outputs"] count] > 0){

                   if(requestSuccessed){
                       requestSuccessed(respDict[@"outputs"][0][@"outputValue"][@"dataValue"],200,@"获取成功");
                   }
               }else{
                   if(requestFailed){
                       requestFailed(nil,404,@"无返回数据");
                   }
               }
           }
        });
    }];

    [task resume];
    
    return proxy;
}


@end