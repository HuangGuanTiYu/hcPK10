
#import "AFHTTPRequest2.h"

#import "DeviceInfo.h"

@implementation AFHTTPRequest2


+ (NSString*)urlEncodedString:(NSString *)string{
    NSString * encodedString = (__bridge_transfer  NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
    
    return encodedString;
}


+(BOOL) judgeRequestStatus:(NSDictionary*)backDict{
    NSString *status = [NSString stringWithFormat:@"%@",[[backDict objectForKey:@"result"] objectForKey:@"code"]];
    if ([status isEqualToString:@"10000"]) {
        return YES;
    }
    return NO;
}

+ (NSArray*)includeChineseWithStr:(NSString*)str{
    NSMutableArray *tempMArr = [[NSMutableArray alloc] init];
    
    NSMutableString *tempMStr = [[NSMutableString alloc] init];
    
    static int tempCount = 0;
    for(int i = 0; i < [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            tempCount += 5;
        }else{
            tempCount ++;
        }
        [tempMStr appendFormat:@"%@",[str substringWithRange:NSMakeRange(i, 1)]];
        
        if (tempCount > 100 || i == str.length - 1) {
            [tempMArr addObject:tempMStr];
            tempMStr = [[NSMutableString alloc] init];
            tempCount = 0;
        }
    }
    return tempMArr;
}

+ (void)requestWithRequesturl:(NSString * _Nullable)urlString
                   headerSign:(NSString * _Nullable)headerSign
                   httpMethod:(httpMethod)httpMethod
                    paramters:(_Nullable id)paramters
              blockCompletion: (nullable void(^)(id  _Nullable responseObject))finishBlock
                    withError:(nullable void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))errorBlock{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if ([[NSUserDefaults standardUserDefaults] stringForKey:@"RequestHost2"] == nil) {
            
            // *** 记录本地域名
            [[NSUserDefaults standardUserDefaults] setObject:MainDefaultHostArr2 forKey:@"RequestHostArr2"];
            
            [[NSUserDefaults standardUserDefaults] setObject:MainDefaultHostArr2[0] forKey:@"RequestHost2"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }
        
    });
    
    if (urlString == nil) {
        urlString = @"";
    }else{
                
        // *** 获取公共参数
        NSMutableDictionary *publicMDict = [[NSMutableDictionary alloc] initWithDictionary:[DeviceInfo sharedDeviceInfo]->getPublicValueDict()];
        
        if (httpMethod == GET) {
            
            // *** 加入私有参数
            [publicMDict addEntriesFromDictionary:paramters];
            
        }
        
        // *** 加密
        headerSign = RequestEncryption_Shared->jiaMiWithDict(publicMDict);
        
        
        // *** 拼接
        NSString *valueBaseData = RequestEncryption_Shared->canShuWithDict(publicMDict);
        
        
//        // *** 解密后BASE64编码
//        NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
//        NSString *valueBaseData = [data base64EncodedStringWithOptions:0];
        
        
        // *** 所有的value进行RSA加密
        NSMutableString *encryptorMStr = [[NSMutableString alloc] init];
        NSArray *tempArr = [self includeChineseWithStr:valueBaseData];
        
        for (int i = 0; i < tempArr.count; i++) {
            
            NSString *tempStr = tempArr[i];
            
            // *** RSA加密
            NSString *encryptStr = [RSAEncryptor encryptString:tempStr publicKeyWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil]];
            
            
            
            // *** 拼接
            if (i == 0) {
                [encryptorMStr appendFormat:@"%@",encryptStr];
            }else{
                [encryptorMStr appendFormat:@"|||%@",encryptStr];
            }
        }
        
        
        // *** 拼接请求的域名
        NSString *tempHostStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"RequestHost2"];
        
        urlString = [NSString stringWithFormat:@"%@%@?data=%@",tempHostStr,urlString,encryptorMStr];
        
        
    }
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    
    
    session.responseSerializer.acceptableContentTypes = [session.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    if (httpMethod == GET) {
        
        [session.requestSerializer setValue:headerSign forHTTPHeaderField:@"sign"];
        
        
//        // *** 设置返回数据为DATA
//        session.responseSerializer = [AFHTTPResponseSerializer serializer];
        
//        // *** 默认转换成JSON
//        session.responseSerializer = [AFJSONResponseSerializer serializer];
        
        
        // *** 设置超时时间
        [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        session.requestSerializer.timeoutInterval = RequestTimeout;
        [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        
        [session GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // *** 获取总密文
            NSString *encryptorStr = [responseObject objectForKey:@"data1"];
            
            if (encryptorStr != nil) {
                
                // *** 获取密文数组
                NSArray *backDataArr = [encryptorStr componentsSeparatedByString:@"|||"];
                
                // *** 解密后拼接
                NSMutableString *openEncryptorMStr = [[NSMutableString alloc] init];
                for (NSString *tempEncryptor in backDataArr) {
                    
                    // *** 解密
                    [openEncryptorMStr appendFormat:@"%@",[RSAEncryptor decryptString:tempEncryptor privateKeyWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil] password:RSAEncryptionKey]];
                    
                }
                
                // *** 解密后BASE64解码
                NSData *data = [[NSData alloc]initWithBase64EncodedString:openEncryptorMStr options:0];
                
                if (data.length != 0) {
                    
                    // *** 解析JSON
                    id tempData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                    
                    
                    // *** 替换掉之前的data
                    responseObject = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
                    [responseObject setObject:tempData forKey:@"data"];
                    
                }
                
            }
            
            if (finishBlock) {
                finishBlock(responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            
            // *** 取出缓存中的域名数组
            NSArray *requestHostArr = [[NSUserDefaults standardUserDefaults] objectForKey:@"RequestHostArr2"];
            
            if ([requestHostArr isKindOfClass:[NSArray class]] && requestHostArr.count != 0) {
                
                // *** 当前请求的域名
                NSString *nowUrlHostStr = task.currentRequest.URL.host;
                
                // *** 缓存的域名
                NSString *oldUrlHostStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"RequestHost2"];
                
                // *** 判断是否同一个域名
                if ([oldUrlHostStr rangeOfString:nowUrlHostStr].location !=NSNotFound) {
                    
                    NSInteger hostIndex = 0;
                    
                    // *** 判断记录的域名是否在数组中
                    if ([requestHostArr containsObject:oldUrlHostStr]) {
                        
                        // *** 获取当前域名的下标
                        hostIndex = [requestHostArr indexOfObject:oldUrlHostStr];
                        
                        // *** 判断下标
                        if (hostIndex == requestHostArr.count - 1) {
                            hostIndex = 0;
                        }else{
                            hostIndex ++;
                        }
                    }
                    
                    
                    // *** 保存新域名
                    [[NSUserDefaults standardUserDefaults] setObject:[requestHostArr objectAtIndex:hostIndex] forKey:@"RequestHost2"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                }
                
            }
            
            
            if (errorBlock) {
                errorBlock(task,error);
            }
            
        }];
        
    }else if (httpMethod == POST) {
        
        AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [serializer setValue:headerSign forHTTPHeaderField:@"sign"];
        
        [serializer willChangeValueForKey:@"timeoutInterval"];
        serializer.timeoutInterval = RequestTimeout;
        [serializer didChangeValueForKey:@"timeoutInterval"];
        
        session.requestSerializer = serializer;
        
        
        [session POST:urlString parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (finishBlock) {
                finishBlock(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            // *** 取出缓存中的域名数组
            NSArray *requestHostArr = [[NSUserDefaults standardUserDefaults] objectForKey:@"RequestHostArr2"];
            
            if ([requestHostArr isKindOfClass:[NSArray class]] && requestHostArr.count != 0) {
                
                // *** 当前请求的域名
                NSString *nowUrlHostStr = task.currentRequest.URL.host;
                
                // *** 缓存的域名
                NSString *oldUrlHostStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"RequestHost2"];
                
                // *** 判断是否同一个域名
                if ([oldUrlHostStr rangeOfString:nowUrlHostStr].location !=NSNotFound) {
                    
                    NSInteger hostIndex = 0;
                    
                    // *** 判断记录的域名是否在数组中
                    if ([requestHostArr containsObject:oldUrlHostStr]) {
                        
                        // *** 获取当前域名的下标
                        hostIndex = [requestHostArr indexOfObject:oldUrlHostStr];
                        
                        // *** 判断下标
                        if (hostIndex == requestHostArr.count - 1) {
                            hostIndex = 0;
                        }else{
                            hostIndex ++;
                        }
                    }
                    
                    
                    // *** 保存新域名
                    [[NSUserDefaults standardUserDefaults] setObject:[requestHostArr objectAtIndex:hostIndex] forKey:@"RequestHost2"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                }
                
            }
            
            
            if (errorBlock) {
                errorBlock(task,error);
            }
            
        }];
    }
}

+ (void)requestWithRequesturl:(NSString * _Nullable)URLString
                   headerSign:(NSString * _Nullable)headerSign
                fristImageURL:(NSString * _Nullable)fristImageURL
               secondImageURL:(NSString * _Nullable)secondImageURL
                thirdImageURL:(NSString * _Nullable)thirdImageURL
                      success:(nullable void (^)(id _Nonnull responseObject))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    
    if (URLString == nil) {
        URLString = @"";
    }
    URLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer.acceptableContentTypes = [session.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [session.requestSerializer setValue:headerSign forHTTPHeaderField:@"sign"];
    
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = RequestTimeout;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [session POST:URLString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,                                                                          NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        
        if (fristImageURL != nil && ![fristImageURL isEqualToString:@""]) {
            [formData appendPartWithFileData:[NSData dataWithContentsOfFile:[documentsDirectory stringByAppendingPathComponent:fristImageURL]] name:@"img1" fileName:fristImageURL mimeType:@"image/png"];
        }
        if (secondImageURL != nil && ![secondImageURL isEqualToString:@""]) {
            [formData appendPartWithFileData:[NSData dataWithContentsOfFile:[documentsDirectory stringByAppendingPathComponent:secondImageURL]] name:@"img2" fileName:secondImageURL mimeType:@"image/png"];
        }
        if (thirdImageURL != nil && ![thirdImageURL isEqualToString:@""]) {
            [formData appendPartWithFileData:[NSData dataWithContentsOfFile:[documentsDirectory stringByAppendingPathComponent:thirdImageURL]] name:@"img3" fileName:thirdImageURL mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task,error);
        }
    }];
}




@end
