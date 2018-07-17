//
//  RequestEncryption.m
//  Lottery123
//
//  Created by 项目 on 16/9/27.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "RequestEncryption.h"

@implementation RequestEncryption


//拼接参数
static NSString* canShuWithDict(NSDictionary*infoDict){
    
    NSArray *allKey = [infoDict allKeys];
    
    NSMutableString *tempMString = [[NSMutableString alloc] init];
    
    for (NSString *key in allKey) {
        [tempMString appendString:key];
        [tempMString appendString:@"="];
        [tempMString appendString:[NSString stringWithFormat:@"%@",[infoDict objectForKey:key]]];
        if (![[allKey lastObject] isEqualToString:key]) {
            [tempMString appendString:@"&"];
        }
    }
    
    return tempMString;
}
//加密
static NSString* jiaMiWithDict(NSDictionary*infoDict){
    
    NSArray *allKey = [infoDict allKeys];
    
    // *** 对KEY进行降序排序
    allKey = [allKey sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
        return (NSComparisonResult)[obj2 compare:obj1 options:NSNumericSearch];
    }];
//    allKey = [allKey sortedArrayUsingSelector:@selector(compare:)];//这个是一直默认升序
    
    
    NSMutableString *tempMString = [[NSMutableString alloc] init];
    // *** 拼接
    for (NSString *key in allKey) {
        [tempMString appendString:[NSString stringWithFormat:@"%@",[infoDict objectForKey:key]]];
        if ([[allKey lastObject] isEqualToString:key]) {
            [tempMString appendString:MainEncryptionKey];
        }
    }
    
    
    // *** MD5
    const char *cStr = [tempMString UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


#pragma mark - md5加密
+ (NSString *)MD5Encryption:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


static RequestEncryption_t * util = NULL;


+(RequestEncryption_t *)sharedRequestEncryption{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        util = malloc(sizeof(RequestEncryption_t));
        util->canShuWithDict = canShuWithDict;
        util->jiaMiWithDict = jiaMiWithDict;
    });
    return util;
}

+ (void)destroy{
    util ? free(util): 0;
    util = NULL;
}


@end
