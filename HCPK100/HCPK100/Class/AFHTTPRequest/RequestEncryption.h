//
//  RequestEncryption.h
//  Lottery123
//
//  Created by 项目 on 16/9/27.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RequestEncryption_Shared ([RequestEncryption sharedRequestEncryption])

typedef struct _RequestEncryption {
    NSString* (*canShuWithDict)(NSDictionary*);
    NSString* (*jiaMiWithDict)(NSDictionary*);
}RequestEncryption_t;


@interface RequestEncryption : NSObject

+(RequestEncryption_t*) sharedRequestEncryption;

+ (NSString *)MD5Encryption:(NSString *)str;
    
@end
