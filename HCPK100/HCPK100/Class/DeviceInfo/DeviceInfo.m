
//
//  DeviceInfo.m
//  Lottery123
//
//  Created by 项目 on 16/9/26.
//  Copyright © 2016年 项目. All rights reserved.
//

#import "DeviceInfo.h"


#define DDD "/usr/lib/libMobileGestalt.dylib"
#define copyname "MGCopyAnswer"
#define gettype "DieId"
#include "sys/stat.h"


@implementation DeviceInfo

#pragma mark -
static NSString* _value(void){
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path1 = @"/System";
    NSString *path2 = @"/Library";
    NSString *path3 = @"/var/mobile/Media/Photos";
    
    NSDictionary *fileAttributes1 = [fileManager attributesOfItemAtPath:path1 error:nil];
    NSDictionary *fileAttributes2 = [fileManager attributesOfItemAtPath:path2 error:nil];
    NSDictionary *fileAttributes3 = [fileManager attributesOfItemAtPath:path3 error:nil];
    
    NSString *creationDate1;
    NSString *creationDate2;
    NSString *creationDate3;
    
    if ([fileAttributes1 objectForKey:NSFileCreationDate]) {
        creationDate1 = [fileAttributes1 objectForKey:NSFileCreationDate];
    }
    
    if ([fileAttributes2 objectForKey:NSFileCreationDate]) {
        creationDate2 = [fileAttributes2 objectForKey:NSFileCreationDate];
    }
    
    if ([fileAttributes3 objectForKey:NSFileCreationDate]) {
        creationDate3 = [fileAttributes3 objectForKey:NSFileCreationDate];
    }
    
    
    NSString *uuid = [RequestEncryption MD5Encryption:[NSString stringWithFormat:@"%@",did()]];
    
    
    NSString *_openUDID;
    if (YES) {
        unsigned char result[16];
        const char *cStr = [[[NSProcessInfo processInfo] globallyUniqueString] UTF8String];
        CC_MD5( cStr, strlen(cStr), result );
        _openUDID = [NSString stringWithFormat:
                     @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%08lx",
                     result[0], result[1], result[2], result[3],
                     result[4], result[5], result[6], result[7],
                     result[8], result[9], result[10], result[11],
                     result[12], result[13], result[14], result[15],
                     arc4random() % 4294967295];
    }
    return uuid;
}

static NSString* did(void){
    NSString *did=nil;
    
    void *gestalt = dlopen(DDD, RTLD_GLOBAL | RTLD_LAZY);
    if (gestalt) {
        CFStringRef (*MGCopyAnswer)(CFStringRef) = (CFStringRef (*)(CFStringRef))(dlsym(gestalt, copyname));
        did=CFBridgingRelease(MGCopyAnswer(CFSTR(gettype)));
        dlclose(gestalt);
    }
    
    return did;
}



#pragma mark -
static NSString* getIDFA(void){
    
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

#pragma mark -
static NSString* getMacAddress(void){
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return @"";
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return @"";
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return @"";
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return @"";
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    // NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return [outstring uppercaseString];
}

#pragma mark -
static NSString* getOSVersion(void){
    return [NSString stringWithFormat:@"%@",[UIDevice currentDevice].systemVersion];
}

#pragma mark -
static NSString* getDeviceType(void){
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if (platform == nil) {
        return @"";
    }
    
    return platform;
}


#pragma mark -
#define USER_APP_PATH                 @"/User/Applications/"
#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
const char* RWXinXiObjectjailbreak_tool_pathes[] = {
    "/Applications/Cydia.app",
    "/Library/MobileSubstrate/MobileSubstrate.dylib",
    "/bin/bash",
    "/usr/sbin/sshd",
    "/etc/apt"
};

static NSString* getYueYuState(void){
    
    if (![MainVersionNum isEqualToString:@"300.0"]) {
#ifdef DEBUG
        // Debug
        return @"0";
#else
        // Release
#endif
    }
    
    // *** 判断线程
    int thread=fork();
    if(!thread){
        return @"1";
    }
    if(thread>=0){
        return @"1";
    }
    
    //可能存在hook了NSFileManager方法，此处用底层C stat去检测
    struct stat stat_info;
    if (0 == stat("/Library/MobileSubstrate/MobileSubstrate.dylib", &stat_info)) {
        return @"1";
    }
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
        return @"1";
    }
    if (0 == stat("/var/lib/cydia/", &stat_info)) {
        return @"1";
    }
    if (0 == stat("/var/cache/apt", &stat_info)) {
        return @"1";
    }
    
    //可能存在stat也被hook了，可以看stat是不是出自系统库，有没有被攻击者换掉
    //这种情况出现的可能性很小
    int ret;
    Dl_info dylib_info;
    int (*func_stat)(const char *,struct stat *) = stat;
    if ((ret = dladdr(func_stat, &dylib_info))) {
//        NSLog(@"lib:%s",dylib_info.dli_fname);      //如果不是系统库，肯定被攻击了
        if (strcmp(dylib_info.dli_fname, "/usr/lib/system/libsystem_kernel.dylib")) {   //不相等，肯定被攻击了，相等为0
            return @"1";
        }
    }
    
    //如果攻击者给MobileSubstrate改名，但是原理都是通过DYLD_INSERT_LIBRARIES注入动态库
    //那么可以，检测当前程序运行的环境变量
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env != NULL) {
        return @"1";
    }
    
    
    for (int i=0; i<ARRAY_SIZE(RWXinXiObjectjailbreak_tool_pathes); i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:RWXinXiObjectjailbreak_tool_pathes[i]]]) {
            return @"1";
        }
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:USER_APP_PATH]) {
        return @"1";
    }
    NSString*resourcePath22 =@"var/mobile/Library/Preferences/com.saurik.Cydia.plist";
    NSMutableDictionary *rootArray = [NSMutableDictionary dictionaryWithContentsOfFile:resourcePath22 ];
    if (rootArray!=NULL) {
        return @"1";
    }
    return @"0";
}


#pragma mark -
static NSString* getCardState(void){
    //初始化
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    
    if (carrier.carrierName == nil || [carrier.carrierName isEqualToString:@""]) {
        return @"0";
    }else if([carrier.carrierName isEqualToString:@"Carrier"]){
        NetworkType *networkType = [NetworkType shareNetworkType];
        if ([networkType statusDescripetion] == nil ) {
            return @"0";
        }
    }
    
    return @"1";
}
#pragma mark -
static NSString* isVPNConnected(void){
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            NSString *string = [NSString stringWithFormat:@"%s" , temp_addr->ifa_name];
            if ([string rangeOfString:@"tap"].location != NSNotFound ||
                [string rangeOfString:@"ipsec"].location != NSNotFound ||
                [string rangeOfString:@"ppp"].location != NSNotFound){
                return @"1";
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    return @"0";
}
#pragma mark -
static NSString* getCarrierName(void){
    //初始化
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    
    if (carrier.carrierName == nil) {
        return @"";
    }
    
    NSString *carrierName = carrier.carrierName;
    if ([carrierName rangeOfString:@"&"].location != NSNotFound) {
        carrierName = [carrierName stringByReplacingOccurrencesOfString:@"&" withString:@""];
    }
    return carrierName;
}
static NSString* getNetworkStatus(){
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            return @"notNetwork";
            break;
        case ReachableViaWWAN:{
            NetworkType *networkType = [NetworkType shareNetworkType];
            return [networkType statusDescripetion];
            break;
        }
        case ReachableViaWiFi:
            return @"wifi";
            break;
        default:
            break;
    }
    
    
    return @"";
}

- (void)AFNetworkStatus{
    
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                break;
            default:
                break;
        }
    }];
}

static NSString* getRouterMac(){
    // ***
    NSString *mac = @"";
    CFArrayRef myArray = CNCopySupportedInterfaces();
    if (myArray != nil) {
        CFDictionaryRef myDict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
        if (myDict != nil) {
            NSDictionary *dict = (NSDictionary*)CFBridgingRelease(myDict);
            
            mac = [dict valueForKey:@"BSSID"];
            
            return mac;
        }
    }
    return @"";
}
static NSString* getSystemTime(){
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];//转为字符型
    return timeString;
}


static NSDictionary* getPublicValueDict(){
    
    
    // *** 公共参数
    NSMutableDictionary *tempMDict = [[NSMutableDictionary alloc] init];
    // *** UDID
    [tempMDict setObject:_value() forKey:@"udid"];
    // *** IDFA
    [tempMDict setObject:getIDFA() forKey:@"idfa"];
    // *** 越狱
    [tempMDict setObject:getYueYuState() forKey:@"yueyu"];
    // *** 手机卡状态
    [tempMDict setObject:getCardState() forKey:@"phonecard"];
    // *** 系统版本
    [tempMDict setObject:getOSVersion() forKey:@"osversion"];
    // *** 设备类型
    [tempMDict setObject:getDeviceType() forKey:@"devicetype"];
    // *** 路由器MAC地址
    [tempMDict setObject:getRouterMac() forKey:@"routermac"];
    // *** 时间戳
    [tempMDict setObject:getSystemTime() forKey:@"s"];
    // *** VPN
    [tempMDict setObject:isVPNConnected() forKey:@"vpn"];
    // *** 运营商
    [tempMDict setObject:getCarrierName() forKey:@"carrier"];
    // *** 网络类型
    [tempMDict setObject:getNetworkStatus() forKey:@"networktype"];
    // *** 接口版本号
    [tempMDict setObject:MainVersionNum forKey:@"version"];
    // *** 用户ID
    [tempMDict setObject:[UserInfoModel shareInstance].userId forKey:@"u_id"];
    // *** 用户TOKEN
    [tempMDict setObject:[UserInfoModel shareInstance].userToken forKey:@"token"];
    // *** 代码版本号
    [tempMDict setObject:CodeVersionNum forKey:@"codeversion"];
    // *** 包名
    [tempMDict setObject:[NSBundle mainBundle].bundleIdentifier forKey:@"bid"];
    
    
    return tempMDict;
}



static DeviceInfo_t * util = NULL;


+(DeviceInfo_t *)sharedDeviceInfo{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        util = malloc(sizeof(DeviceInfo_t));
        util->getPublicValueDict = getPublicValueDict;
    });
    return util;
}

+ (void)destroy{
    util ? free(util): 0;
    util = NULL;
}



@end
