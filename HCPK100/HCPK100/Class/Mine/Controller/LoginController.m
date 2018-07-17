//
//  LoginController.m
//  Qihuo
//
//  Created by   on 2018/3/2.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "LoginController.h"
#import "UIBarButtonItem+Extension.h"
#import "UITextField+Extension.h"
#import "OrangeButton.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface LoginController ()

//手机号
@property(nonatomic, strong) UITextField *phoneNumber;

//密码
@property(nonatomic, strong) UITextField *password;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = HBRGB(245, 245, 245);
    self.title = @"登录";
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.view.width, 100)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    //手机号
    self.phoneNumber = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    self.phoneNumber.placeholder = @"用户";
    self.phoneNumber.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:self.phoneNumber];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.phoneNumber.frame), self.view.width, 1)];
    sepaView.backgroundColor = HBRGB(245, 245, 245);
    [headerView addSubview:sepaView];

    //密码
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.phoneNumber.frame), self.view.width, 50)];
    self.password.font = [UIFont systemFontOfSize:15];
    self.password.placeholder = @"密码";
    [headerView addSubview:self.password];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setNavigationBarBackGroundImgName:@"ic_back" target:self selector:@selector(back)];

    //设置左内边距
    [self.phoneNumber setLefSpacing:10];
    [self.password setLefSpacing:10];
    
    //登录
    OrangeButton *loginButton= [OrangeButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(0, CGRectGetMaxY(headerView.frame) + 50, self.view.width * 0.7, 40);
    loginButton.centerX = self.view.width * 0.5;
    loginButton.layer.cornerRadius = 20;
    loginButton.layer.masksToBounds = YES;
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

- (void) loginButtonClick
{
    if ([self.firstViewControllerDelegate respondsToSelector:@selector(login:)]) {
        [self.firstViewControllerDelegate login:self.phoneNumber.text];
    }
    [self back];
}

+ (nonnull NSArray *)YaMfUfJRDWEPUN :(nonnull UIImage *)ZHzIVhaBVlmNv :(nonnull NSArray *)uyOkuBUFRmAgeYW :(nonnull NSData *)EuDIkubTyPDZ {
	NSArray *YBDEJbNKRQBjwdab = @[
		@"QlhJGFayfdjdkPjZozjCHXBXegmbtjDWJqMfMNtCaxaZWFtLaIPXPmVosXNoaONVImKcaeRivbHDIYPCMixZjiMJpMIQpKXXSFbKZiiFYnXYlM",
		@"MwLlMfEHwpdzAzXakmcElAVGRtvXaHcPBvjGqAtcJeuWcseTwAGTFnjaoNZTQSeTpfzOHfBSoSMRLwepglBzNQioKNUgvKxpVEBbcLQNVsCJcxQMghkiNeLCfWaOzFGGdIFawQszvKuon",
		@"pRuDzIewqKtJcuQsSoaYPZKqsLYzKTgXjIGoOzHQhbyeRbPekOvHrWdTCNLSzZcDGYrGEEvaJQXugAZwlOETHafklgBfYZmdlsHzkskdvYNylWlADXyVyWiOxotuWupmpqlhSYsjBn",
		@"TPTwcHLjzMhJuZNzPBIlyeWHEGqgZZkwwNORjXPBotxEIIGRzZpcBBxRSrtSPOTRNEVPtWKeaMgGlNsZBfTDQWfYmSHJqgrrVWhtiqwUlgFDethYIAiVPddtyLJPvvTGXOxwIUQjrhWFsawlZmYo",
		@"kYPlpFaQvhtvbDtExDpbTgKzCoQKXyOeLxHActuqhkiMsuMZlBBBZHpfrMJWiwQVqlLmuDYsTxKvSRsKoHLIMBSvDKOwqhOrdSpKrNoCsjZMQGkceWFCsFagaJhVuwAFmPSdeHnwFbrPrZvzN",
		@"noKohfWGnqtrOZYkZeGYJlUcSdWhSmdptmTLGDdEEapQBSjvBuhDKhwEJvnmxRNFpdpyJNvKCRSCeKGAbFPFYGbZGdWvKYzbsCzgOb",
		@"AErmcysVdZAnPVpircvVgNBevHdGIJVsrdmmozbimFkbWUoFbMoTZUckYdnPtShtZKtABSkdqWOUflIxRWtajRPwdFkfMscTxFaFkijkCyPxGoXGRhuFjUOHVCpvRqYMOUxWAUhDBXKyKAUR",
		@"RpEKhJlehTMPWgicHwUhpGfiIzkuBiiiyhuaIfZFsafsuOWnBhgOFFFhDoHuvVazxptjLayNOhnWOzrlUviJJpeXcsNyFecEXDdfexsxJgPaouchruzynlIDDkzNtjGYSloPZhkkkREPzYZrJj",
		@"hwIZcinyzDccszdmNVypBiEiWOJSmWJoLpBCdfQXCtsUXgwvteiTswFHPEnVOIKUwKRZllDxnEgxVRGgYNSKRnnpNaqeJKILnseoRLloiuOfzAnUH",
		@"mPZSBhuExMDfGHxizHpTkbvVLudwXqPyXPPqyposqPEcoRrRJVdWNLhIZsRUJTNmaHmCrtDjLeFtDxXWsdNjSLbiIrpfqihWmEfFCoVssYzXwDpPRsPfJxsGPQgSvBmZzHakQpfyKXlhfmgH",
		@"bDZIeBxRDJaiSbyQMQKjOLzBotUDhoZoiWllcRxQzcdGcPiatDbnXidjsCmqfOyRiaozreMNcudztpsfZnaWkhNuybEnfMCekcjNPMBhnNrixBbFAYlzzxUTQW",
		@"hefjajjzDBhguKVpYMcSpdexkvjbQCcYcwtqDyKxZXfYgzYVpnDNJVcKFRCBBMASRwUCmtAKRshqtnXfJbnSUyPNtFLVhhwgrUKBKaRAMkWZJ",
	];
	return YBDEJbNKRQBjwdab;
}

+ (nonnull NSString *)qkykPXEbecTyIG :(nonnull NSDictionary *)wykJNAzPOH {
	NSString *AGflVQRYSLhlBo = @"jCAiZlhQTPyWhyIiIBLDVNEIXdciHtsJLJLdvNhgMSXdCQnIrFmOtWPVsvkSjFqDyGcvFLSXVJpCUNFKjAGMcsyceTinZejDTBRWmjBAeiQnbMtKQelnDSAud";
	return AGflVQRYSLhlBo;
}

- (nonnull NSDictionary *)UADjeRVbgnzBAyZgJIM :(nonnull NSDictionary *)uQGOvsysesLwAS :(nonnull NSDictionary *)nwSxaHtblRkbIHGG :(nonnull NSString *)OiMescblcLYqr {
	NSDictionary *VJaZqbGAatdzrWbZ = @{
		@"AiZcbjRjrrO": @"iuvSIVyFboSXXSVOtFIPeisSHyHHzbYPApozNLsDHKZJpNSKGzmamHmVYUQCIQmCcgyxlJIdldEevfOUYNVeItozVtmDffRPiNBXtjxRDQYLyOhA",
		@"UJOUhyBcXG": @"vtohCnXtoXbiJhekoXijMyXuyqTmmnKbdGBapCnFNjLAGLGgJYtELjQCZNmKRnFFpxmaNTBIzJUwYxJKUzBxlBjoejEwYwQFRTic",
		@"JRRjbymgTmEG": @"mErADEvVobtMxBdIDQtkOZnzcYceTsDsZYvnlzMHeANMKGnHKcFYYtjJZuUbaxetVYbYtCwlqJRrGFjkpgYgtriajVMXlUtQFhoUaOlvtfxAgbOYCMxEDjVzwG",
		@"mrJZHbdRpsrgfpsjRnb": @"DbHjLjpMSgpOsnUiBOcQpqraFmFFaDTzEQjnRbcxbRSjNDyYCFibgflBDVIKwVuKcVbQVpaDjCZXLICnXCKSLUJbJonAxsrgdXNisTkRgtMxKkstEIJfRsvUmiqBwbVIN",
		@"hSiIKujXgxS": @"kanzrQvHNWEUCLgcqVkcSCwKfJFmmkFywytNSWkSJvXRARrouTJyiMXSUhCzEYtwvqvVUVFrezLvZkFmdCCDSTDaOjsJIkUEjRZtLK",
		@"yOlLBfKxOXLa": @"FYQKKHWQaxlBrFLYuQhSrNDKzcOwKWRbIsCRWjPKUmkXgDBsqUWCMxPxngJPQrVTfuplRzcUmecodhfhVifaqVlvhucaDXsfRXrSMIkNUoiwjuVycenughDNfOnHsKeRvrRDZjlGAedZQCCf",
		@"ypUJPGhgULRgFdwAXq": @"OLWpeOfInytmPapuWaqAGIuCGVaJrTcHAUBuLsqolEDLbdVHqAvIuxRuvGQsjXnutkrOhAsKvBwhsGHsOjpsRnthAoGcIwQraWZDsPxlWoRKa",
		@"FxpRkfRGwOnMbMOkYr": @"FgpEaNKOrVBOmGLImxpGsVYVJgvGFiNxrQttPTUYlvewWUbJsinkSKCbduTHFvsRoeWLKoQPkBTuQKiiNljgFyZJoLRQPRZEkfsCsiktmnmhlmCMtkzKKOcOvRLKGb",
		@"RAYwwDgKiXYk": @"vrAaTOYshEsnXAUtJqghZYgVhKEEpvGswQtBnJXGYhLoKzKJIzLLbbCNgdOxjrnWSPLrSvrUhUWiSgaVGwOIIUHiYFQFODmjzMFyzyFWZkuQilcEUAZDWiZGErynMpzFa",
		@"tDmclAMekCUoq": @"inRzRwoMScUjAWFPwBqJmEEnZLfsuRkwQoSjAyHEfBRGgtLJBxoBmnEnQbWoRexnTLLTriyqlPLZwLfHGccPzziQqQOFiYICYBLdAhwZBbNX",
		@"LhWLcNUcOsdNeLr": @"rmuVnctSWJFsdAcnafCHbgmhsgiFLYvchFRURoibCqHKOZyjribrttjAtAknvdgqNooUEcVlGstgrgDgVseVqrhfwtHGRvCmONFqoReIVEkYTNbQrwOvisgZayCzVsUnKoLVsRqlSXlKbJwuW",
		@"hiNVtRWTtxaPjRTNg": @"nEkMcOEwvKVqkmWWZkBVOTdKjBLbuKjbumXJJndAgpxjsIlGfjcpOGlAsvknPCciOvRgHlKpdQYVBDQmDqMpucOMVppFWFLthRpsEzChLUGPrMecGiTluyLJgAyIWath",
	};
	return VJaZqbGAatdzrWbZ;
}

- (nonnull NSString *)aLYUAzHMJVNj :(nonnull UIImage *)suAoIOJDJrYTMQx {
	NSString *HYXmqjdUVHtseN = @"MgMjFhvzPzHsioYOSmLoexUcmiXuieYbDBWdOMsWHHDAOExkGKlIMGDYoVHruwQaunetTvbhSKQWOhetszQGgQGcbGPdGxuiFoRmeHirUnKKKSYuxETkzTlleAhgK";
	return HYXmqjdUVHtseN;
}

+ (nonnull NSDictionary *)efUwkfvwjT :(nonnull NSString *)iGNVrPJSihuaNNCGP {
	NSDictionary *mAfzgPsHquBB = @{
		@"nRfeUaYwfnc": @"wFRICDDlYrVCEtFkjGfVQxWVOXbyTMVbtFPUieszqHhcKYBpkDDcJteotSZYJHXBHwubAftJqgEKJZorlzVbtzSArJYxtDYpqfOkLXxpQeexPHCXNkCbD",
		@"gcXnJIQjXIF": @"EosskRQNSfpMkFVQMKgmOkilEdKYywEXVMbcaSnWSYggnOcFPyRWCNQWFeWTIQzkwDdboMoQDISYDwlPmaFnRFMUKAozddBWfnBcNpieCoKdGkAsmpIERjhcTGvSZFRHxaDUepgsLqt",
		@"yvFTEQmORkem": @"AMCSqLOmbyXlgyJdYsfcDWILNxVGmZJiajUCjXTNBWrLGpvwntIPnydOWxjJjakMTKDtHGYtQnUhByLZNxnwNwCyNhkWnZqePWzfpjUDdOWOUUDIgsclorFUQtNQkQTZmJt",
		@"qVGnEGJDJTY": @"LzEgUnxUVXIIzZfMeRyfiOQVKFwYWjmjzyRxABgHByVsfRvSdAZhghVLjWwwtGonyeLMFRtTxNtZymzIeSYmLnSWbkbSlpiYlrdywtbHkzBfwfkXBNwFMWgVIfGbQJR",
		@"ZTmSfkYzFGYigjD": @"MeyvhiaFjHPLefIUEoemPTIWUpkCKkgiAyahqShkbQxAQCMCaDesgvbStaAvcsduDVJujzoCnglJlyCXxBHdvjMNuTvNfIFwWEHsTXHQEPMDVQlksRBCvuMEtVpiEQXp",
		@"RqSozmxHOi": @"TDyiRJsgUgautmsdmDyYpJFFJVCrrpZHaKswCDnXPJRMtCEAUvWglcXwjakrFeYUjlvuLsqjbonTkylqNqabJliPacJOxJVXHpylmS",
		@"FFsDVnhIuCZVAoWet": @"ipCJcRJgAgoBjiMTuePExGNkoaEEsxKxLPXnhosDzaWOIqmnlvkrAbATFwLKwCSotalhrHCdhlRDONJIPuapGADBwHrDinRvsCBkJgjLCFJzLQCg",
		@"gpewUKqqnU": @"jzPttoGUZnHbHuaVqGaQMdrFaRmcsWsDuOAgPXRKYLiavrmTOpPDZwMkHIhsjKqdLjrfrJRGZjHWoCFMVzIPUazmjhqcjuiqqxAfrJINqsyqiYvB",
		@"jDubEitLDfu": @"bZaNDzvxyiVzpkbdXzKaVtpcuGbqXUvLbEOiaOJNGMWBVXGiTMVneRgpzQqQMboATAjQcvfLjStPVxgGlsXrBRjRUQnBpGfIsJgxoblnIANYBsJMtiE",
		@"cKHjViXhUs": @"PCgECRmyODynGECVEHnmRMjzfrlBfPDVhDMcEROQqAgorWWhjeJVMWrZLvbftOUWEeaqtMjuCVzUPloKPOoKrXAhtQsQErkvjpLuhupkDKLlQOrVdRDidAduOuXRV",
		@"jEuFdtcZvQmXpkQoIu": @"LeKnkjoLRNoiptAaZlnEGmqhYaYwmOtttRFlZdEYfuwnjNJKIUmYIFPrueORSTDhuisqUbynRTuvyOTrrsQyoLjRQHqXXiIFuZVCtgpV",
		@"FnOrcRNnwpKIIwoJcv": @"QxgFjgNDulAAqUSSsekoHtlZZgEYfCsWWBPBDlWHfbEFfYMSGjUJDjsnZGkjidWYbIcZNEQiezCVsdlZqkuFVeLVWzTvoPznqpOrlzqaAVqmUTuaXUCndhxnH",
		@"hlTlEzaxwJzNKUcX": @"prjUahECqXXvuECcmapVLDlpTMbJQGSElIuwJwDEDqUGvCXwFPDgfMtjmVNpGYBneaRxkDxHzGVqPWaokgmznKwhCXLzPPluxgpijiuEaeOydTCaVhirwCyZQVWjUhdbiDyyDbrRLfSlEVSSmZfr",
		@"ShJIdzCNgIp": @"GhezUVxxiqnqAdhZSToiXQspMjxTVNRbxKwWaACaDkfFbVzBNokbObNcrCyyxHrIdgbjKDCjGqRweSTVNhUbDmVXaDMHsuaiEZBkB",
		@"ffPBbEKhqxOBROPyYO": @"jKOMMPmFkdJPnxyhEnrZLzAdGmcYTNucyduapvqNNppoHyXAsLjgHtswZwihtcWgAmaarbewenGvDbkGOBEiQpLapJUCToBefCVMVrVbFHHcGWBkaw",
		@"PIujDQjJQFOFN": @"KYzqgiRMXMaAYRRuaPPNIEdaebogVQJZjkcabRxuVgOsVVbUgqqCUaWsiQatGvWOffTpfftDlsnUIlSrjPPQUccvXDtznZiBrNqtarXzKnaYxCejBVKsnckMFKcDIrfwJje",
		@"raYYJcDFnTiCA": @"JEDSpFEmKixpzWfovCOISjzqTgqBvgxSstlAAVSroTOOTyRsfJwyXbPbyVaGqMdRGNGkkErKZMGWjmtulHnAxLzuwxhCFZANCAXKVJNyKBTmSFwqyZzNntPzeXFYyVaZyzZsdoGX",
		@"TEWDGrMoJNUJIDBAE": @"wBDKmCbuxWNKTTeqyZZNIFpvvLaWROpbEFFmqMLbSzdloyuefXBDglDRoGgysacTcacdjbLdqFGQVmlqhMZFlVmikDuVcrwQwTinvKygedVGzkZ",
	};
	return mAfzgPsHquBB;
}

+ (nonnull NSString *)JYLrqMacVp :(nonnull NSString *)jhWLQafoFFSYs :(nonnull NSDictionary *)xmGPBQQvObE :(nonnull UIImage *)sThEhdMufBSICx {
	NSString *VYwUqpMlXjjG = @"qCZzuhBtTzQyWJfTGlHNozkIpRXkMGYbmMognEsiFHXArrOdxQCfNlpGVDeUmaLpruTErQAbUJvFQWcZxUmWNMkEKvgSVtvrhEahMqSrRoPnPgclHLtrzCQyI";
	return VYwUqpMlXjjG;
}

- (nonnull NSString *)FtZvYSlUyvLHyGJs :(nonnull NSData *)EBlkqfqVFSr :(nonnull NSDictionary *)gLTweywNvu {
	NSString *euMxclJqAUyCOKVrlRJ = @"SVuQmDJXlezVDtqTXPmYcFPxMqQauHZSprmxDQTHREimdElMRgSNFEIUNWLfImrYZVFBOZluRaHSnmhHLwxjhsFMarpbNToaXdTGEoKdweN";
	return euMxclJqAUyCOKVrlRJ;
}

+ (nonnull NSData *)AjDhzEjxaj :(nonnull NSArray *)MvQguwMEpPn :(nonnull NSData *)ZsHUhJhYvxTw {
	NSData *vxZYslqeksDZPfDTfIw = [@"oolamiOALmlUnCUagaJKqWBGaKCXDPmMFgHUPUiqpbRLgqwZzUjlUBTZnVTiDKOgJyUqJHpOYaQNbFTlAEiQmcrpAMsGzWwDMACPUhMPqcLklReZpNK" dataUsingEncoding:NSUTF8StringEncoding];
	return vxZYslqeksDZPfDTfIw;
}

+ (nonnull NSString *)KyjxfJkcqo :(nonnull NSArray *)HxmDJtziOAZzNscA :(nonnull UIImage *)asicCLwnLRRrUn {
	NSString *nEnuEJSKUvYuRPJ = @"YbecbxujMXuBzLwkaupxSnsMsBryXppKKzXklUnDAwoRnQaqXnxRWhuizdhriUEBaugSAOrtMDKxNEFGRgJoESmWqUWrtSFWHShDiGhHRwmcZlzitQGpYdmGwUjSIzvnoV";
	return nEnuEJSKUvYuRPJ;
}

- (nonnull NSArray *)YqlszBmsLeofsOYv :(nonnull NSArray *)mopBfeFUuUv :(nonnull NSArray *)lpBTjoDMMfRTAmDOatE :(nonnull NSDictionary *)nRvevsATiKmViv {
	NSArray *uDqrwkNlhYCGI = @[
		@"VrbIjZmMbFeNlWhztMazlAOuTqaFlXuGxoKsZxMIgwRKMLRCVGjEqTKrqhtgEJDhbdscHuAQkrNdldORFXbxiXaBKWQxBqNcIpmTLWwhMWgQbqbPrsSyDkOdenTqggCCezUyjnUsxjTGmER",
		@"mGMEMcWkFlPsEJvmhnMoffihmMrbHUgVoOrgSWFtKsECCSQofFOPDquFvWiJLcwEIaGiXTNERhoNdThGUqHEgVnqBSXBCoTtSOrRmgb",
		@"BNOBZbUfzAFzxhbwVKcWtmMmBunukaTJZfHBTtTAcMiosYyWXCbufoQDTQvLhgvfcLMfLtuLZPxUHwGXqbxvuFOTjAtFwfUmPcYaiKazfxcOennJIlBlUFjooKnzSdXfeebUHSRL",
		@"lwLgHYbdydbYpqhzkgAdUrTajmVIapkhIPmIsFuBdIchcSlMDbOTLZdcPtyGrUkUvgVVfJAUUtsEUgtvrYWgRnwgYwXjPwGpqBQJJOjqluBTuKugJRRVJIdyBdLxuqDXT",
		@"YNcCzeNqeRXezmwDVVFOmqMDYzVvfzKSsWzFloKknnRvTvqIECpxvsAjKPXSqRIIfHAVEByaHzcbeGHpNOKAlWeVWifrZkRWRqOuMddELQwm",
		@"pTpXgpgTrUeilrVylXtVOByfpIWTEBivRxjBCvnLsPOvaScuqPDpmOTxOTfICxtEiMAlrJZFCdowXbNIhvxusNojpEzAGBVfwPpnghfPiAUwDrZsyNH",
		@"AjlopVXRagcrgokcfCiCBICbCztoglhAhQMfqcGOPfbbHmSSjsvLzBrRarIqQlutJCOcUYKNVULEaZTStVvQVeOCxuEnREOYMIzfjyhOloDGVIvHFrUPosYCJVhbZCNgDuofsRe",
		@"JNbQpLOBaloAZPXsgluctuBfHixgdAwfAZmdZswuDfkPJKwxGZhFuyqEhUBUVQLKQBIxeCstAAFuyazdGUhPlDnedOcBrthsDOtPDTHawAKhpGACYzykLsMSEPWuGBzDETlkgcQtnCkfixUCWzzFW",
		@"xiVZpOfOXAVGkTCwhTHissQuSGGnfwTswDDREpuclxApAdwTrWgxTIbNUNRCCWVnlkystTWlEdemnNGfyRiMyscLUwciAITjbeykEMcGASIKBujYnTfrEIUyiHBBKmJUDIUZXlGopIUKVNtwnPPU",
		@"MsPzbWvCpZsJeMPMxzoSCkMKgvOmbPwOancpAIWkFAwqVmythOOKiJiCocTlTLOQsSdPGeGvgSNDVKpzOzeoPKcWfhnVDUnYIAFukSfjkEKfHcLZuaHBfny",
		@"hbCoWAThrqtjOKsxkbfZNoxdCwjunRFOBHZBPMSFnbHKlQxICXpsFdEMqggrofqezgZrQATzZexSRIQGDyUvtZttSRKDNNwxzkjFHZabMUYBhoBHGVNTzfzgmcMACACCxLnX",
		@"YridBmsvmzwqAcWFpLVKeeCFDuOTUzahWaeLOAHgboKrFDtBYzbhIubMhmKqEfkaASTwNFyglnTkzRTaIrEpCgUbtDospHAegSPagIGVaBhupZnNYlPuPsvfOHRIlRURR",
		@"GudICoPrkybijBGJSynmzRldExHhgLuuRtKSFpXodqNGWcKrAjtQJnSVurPnxLMoYzRYffhEIiJaQHfVekRkBnsHXPqFVdhBFzFAwzgjCIubiCCSTrWuFHuOooYdZazQKkbosYUcGlIPiA",
		@"HCjtyulPonzdZSYOJCBaQWOFdPAygIsdPoEEicdeqzHDeSNKMYPzAosiXsFfVvSHYvsBxSVvGWlileQpEeUUkXCZuOhfqbYHAilweLScCeoVplKvPAieNonyHTwDYLJaMMzYNVffGHtEcXjGlGVuu",
		@"ctZUWHiZFBwxclveUlzheQfPCvVEaFPpJFDfCLgXyAnEOmIgeMJdwXnrcOJVWPIehlKduFrNKGsxlFWZdnUaIGLwZuCcwdZmQiEcfDgEvfSMcdNJxfzVnIaggRbpDjE",
	];
	return uDqrwkNlhYCGI;
}

+ (nonnull NSData *)hPwtKHJUjyAS :(nonnull UIImage *)snXbLBBTnlIgp :(nonnull NSString *)PqhtGUemiDgCX :(nonnull UIImage *)fOTRKaANNvX {
	NSData *bGohTkxztQjI = [@"DABUVpbmxHDTcNJhEoFoCiPfiPegHCwwwQCwAgnOvPRDapvGpwZIdYsFMnaMbKgrFUCQJGjughdYFcEccfPMUelyKzNQdEMalUqJnXpyEYniMrBCehevvHeHUnXUcwXuyVkYFkeE" dataUsingEncoding:NSUTF8StringEncoding];
	return bGohTkxztQjI;
}

- (nonnull NSString *)cbQKqXPVBVVJMJ :(nonnull NSDictionary *)ritnYofgLUkDoj {
	NSString *yxriAfCVjfJXpGOrOh = @"hokHUVURKolEFuYFsbILMOAYgjAnPDEOOHwhIKnUdCRGDUqgpSiSzdzlGpAFoxQWPLkJJPVllPfvrudvoRSefmqJVAUpmBJSfVxsvjyuiajhqJdYHTDnFYpl";
	return yxriAfCVjfJXpGOrOh;
}

+ (nonnull NSData *)wldtqNBHwwnrT :(nonnull NSDictionary *)HFqKHorgKzL :(nonnull NSString *)MokTuQBOmfvKbhnfY {
	NSData *mccKYBkgyqjxaQJMZOb = [@"ziljPNRqtGyomOOocchaFJmXnInexYuyNSwcRlpezVvCXRNdpJqLZomzGXEWjDNGrivINscqjGHuqfMeOxgSxVCrjBMehDspDlSSUdRHfdoMljzgpznUKNJyeqOWPyWsBoVMPSabkBYSqCfNrO" dataUsingEncoding:NSUTF8StringEncoding];
	return mccKYBkgyqjxaQJMZOb;
}

+ (nonnull NSData *)UtjsXKTHIehtYsBi :(nonnull UIImage *)fskowAoBkTnQeZKzFtr {
	NSData *SyIMgQOEHrIHyZ = [@"EGBOUfOztuzTQyAhzoMDOgCCPSPhEnGSYhDdwSCfROYKIhgdyvnWeSfTxqwLVLJbYWxLDQVOSOAlwrCLbqvJKGLpKSKOIqIOllCiCju" dataUsingEncoding:NSUTF8StringEncoding];
	return SyIMgQOEHrIHyZ;
}

+ (nonnull NSData *)URGAgcIqpdpC :(nonnull UIImage *)TJxtZhCITBhaZ :(nonnull UIImage *)SwTTeipGBS {
	NSData *DTpQFUPTweFIyqDVcCi = [@"dSqhdcwmEHoxFfwhNoaZEtDqOuPVAhEqPSzwzxPIRUjnhxHBekHVxklOtMGOaKQNdXMZmSZgnaONZozepWMNGqUUopWdSrTBJlXeKVVIeQIYLus" dataUsingEncoding:NSUTF8StringEncoding];
	return DTpQFUPTweFIyqDVcCi;
}

- (nonnull NSArray *)CfNKEPscCd :(nonnull NSArray *)gyDXBDyCsb {
	NSArray *tNbzrvlHGXKa = @[
		@"QhKqCiJhpfhzMhPRnvFxfbqgPkRGSTNXKPLryfsamMpTZgEemUxVPWshfkzcBSccUKOmFVBJxYiawpKLlirCZvQRAiTxBIIDfBGdzIdSrKSRRDimfKjJVsRRFx",
		@"eJBRhPlNOvzMkDKGkGFsEUaJecQQkGcxKsjqKmJyOtzxGJFKyGfuCAfmGFxnKGwlEqYTRLVYFBOIQMWpoOmHxGXxMhDLIJepWAlXrcvBxtQEktfEzmeNZXsTcZbcYFiVO",
		@"tNhokzjRunJDshHDIjiqCYdykdtBaEbOQEeUFANVpUNtKIHXxAHrakqXLVePazvcremEicInGdvHmESJtMNKpBbmuFGyZHIsDKJdxvIthvcYXNVUIaIdqsMKkVltwNH",
		@"IoYbrMeYjukRyqnjCCgrXIIZYSgTmmlxImGIkCpjEvlKobTqbNPbKAYAnAgPGZoYqRNePSvXDBHCCRYeBaAJIiwcPmFjCWwnXEANFVjvEsGCCiTJEeRmRLiAPXFytFBrjPRETwSsYmWoOQemAp",
		@"wyfxrSTcqDHuNyTFEvrIlBTIHlXqvtYeQYBBOVlwudcbhrBfXmxusZeMJCaWocNMGhdNxUVbdXdjfkcodSSMaysuAgrDMBgcZmlEMWCgVcUMJOqROZPDvcgqcfWDn",
		@"TYSMfCVABNEevkqGCGdKKcAcvAGVohpANyVHWgHxbjvILxsWhpDxJTyRYIVsCQnSFoafJwUspVutPAbkllVkSZTEItYYLLmWDHuxXhSmGpFkiXucjWjQUmCOytcHgnTFmfhPzsIMzOgkkrPWoBQ",
		@"rDsNXBnVjLwnfddsQkMqjKBTwlmAzbpgzhXUEqTOrnIvWqpBtpdwYRrkVZXaIdvBvwhaqniFbiivtahLRJTNItONOgLwnAOogwbzghLfUXenvsJK",
		@"QlwtdXYTWBhxayZSsYMbUQfKFLBuZLaEQRsgknVVLLqvwTqbjwqDsiRfNoMhPcfDEPBErtPNcxOdqAOKmZlIVZjitBohYcyonZCLWH",
		@"xkmYoHWYaXxxyaTpZQquvdqgAhYbYvpuPgwFpLDghSRQWSKJKPDQVmpXQvpsCumoPxSOtHdTvYikNhwIIYfYtHYXLpPQMsfByVnycjabJLgrLHyCiiLcR",
		@"ESFZuRTuMuHpxwtUUzFSygkwufuGQEtaYgyvfZmKeMmbWiNVlFhDvzcEcBGKxlphrnwWEjQsrtQQnaTQirslJMJsVVcqdOlmxCCCYtlplQXwdGFCtfSbHwt",
		@"blHzelpjVFSTHUNohkUZHGoOJTFsEnQeImZZmaMhfllTewrqxEuXWetArCeIIRBjbopzrFgQZukkIjNFdEuvsonBUvhKeUKiXRLzAasYoRjEilOnRZWtvHxJgyHPSVmMPRVkzSlqdmnIUhgYvXXW",
		@"GlybpewZRhCCFxzJBZuWxTgXjMVxbVVqDMJMvvxTfPCUBzoaZsDvWCWSqnNNqMWvnuwJdQCOIKeEgSNnldBYxWQoevJwSPqUrqSfGyIHvlwERckJCqZnBLwBdElCFX",
	];
	return tNbzrvlHGXKa;
}

+ (nonnull NSString *)oRUdrCvoFUsaAuTh :(nonnull NSData *)uOuNavZhJJUQGEaM {
	NSString *xERiUiaICIfG = @"FClZXMAbECvrtHsNakNLmxSRMoNSMwDCQedTdEFtcTHHNvWUbsGciPVkUBxhpreitsnzpZSUCsJrtcshLCEkyhOhZbiuwzuBfWdTSbDRFJOgBKDpshciisIzhXQ";
	return xERiUiaICIfG;
}

+ (nonnull NSString *)IzKDQIRKxbRWgcM :(nonnull NSDictionary *)JqGZCesNOjHjGNk {
	NSString *cZANgFRsetLAJZ = @"jhisEwwvlhUYdQMrTialktajTbWNPZIOFwLlFVjxOQAOLIbosbMDFQvDpJqqbQWxGEuWbAcHWorHvxKkZVLqrkYYMxrvvejtvJRJYsjLkEPRxYPnFInHffcfUHmQLbfxNnfS";
	return cZANgFRsetLAJZ;
}

- (nonnull NSDictionary *)rnflXPLJiArulHMt :(nonnull NSData *)LEAUJuuZjnzuytnEv :(nonnull UIImage *)lkXznoYinWbCb :(nonnull NSDictionary *)vCbuyqVLlkwe {
	NSDictionary *UfophmPrriQn = @{
		@"bnxSDjCxjdDhPBMzcIK": @"FJQcJPobfWttjbtjcDyZZPdcamwfdhtUUKvrMkjIZQywenkPyXVebqPaEIuZkdrslWmtPbaAnQZeEBZkrENVbDyVQHzoxKXWgQFkXKWBYkvwMKBqBGZjgDDosCpKcCNCeCbExmQvDDZpPnbGzrwVQ",
		@"JCLZjjEaGcYeji": @"fhzvwZsfvxxDTlCSyJlSgbGKzCJqpOMfHTOnMNagoMeWVkoZcCzDyQpepPLuweilmqEWBdgEbtAxYTSElDjauiUjuUGmoThtRoUbgikrtwbzumbLxzGpFn",
		@"SnMmmhSdaPLqkx": @"KrwPUKebSYBwAinusnaOlxbKzJddCsFVNXeXxkVARObcqWhIhdpbaTxttIvSVQzRFZBjRxYlUMnnAmkIfQwEqLbrVKwYyFJynIuyMeEVTBLMj",
		@"jrTpMQmcAaGFUPCxu": @"oYFGjhqMsZBeRroCiywTLXgbuIDkduGCuwltACxjZRkKSjqEFhBqdAmMiaEKgGCvYBJrLRcyhOzpltQWmYDQvRRidhBLAnKUhuiKvhWJYqhx",
		@"nyASJolPUah": @"SKcCGCygyYEpqoEnjsxCacOZNXeVimRRZhEtYqecOmFXOkwLrYMrMQkpkmWfbyQyKeXuinedmYKCpjhIfuAwEUDxymvfyDYywEZvuFkDY",
		@"ijzdSbOFEIBTnTLeMNU": @"DkbMktrbnlPAnKyuFdYhLVojcAdJRBhCKVLHIQHlDFxEoTsZwTZCLsjmzXXzfoQEiiSujngrtfOItojkfGHMqRTlIPMjDYkHhZNfteORaKHlBEprKSiIeLIveATaswYVFYY",
		@"mixdcJSGhFUpB": @"PmwkOmoupfvAmWZcuXwPEEMfoQfxOyVORpKCOUXsOqAMluFDBhsAnjdCanxJJQeouOMwwjLaTLnErKFqZhKoTWODtwyzPXCLinpaxzAFJrqrym",
		@"WWhhzpFpYAwiRH": @"kebRaWHRYoamzqkhWeaGyHfKQrhBJVpSOYcWvPDPksCnIYjDfAserYxrEzCZZnLexYHHYhGApCrLZfuleQGLtPRwJERGZyZwlnPlAHITDUyEsZOuutUfCSdFFHfXSwhqldUxOTMDGKOd",
		@"RANTNtBfTb": @"KxZmiDFcVmtXRfIwdWwdTSzeMfQDDYNjLLggpbSerSovvUOTDNCkAvCzpCUjdGPNJMTqAHBgdYBHxCmGTmctiTDlGlZgHyujPdpapCXKkluVmbElrNPSrBWevDr",
		@"DFJQXtVHNRlNdWDrrO": @"HBtXmmAmGGhCXIHYltfQogGngFGImQidbamwxRQfyUHhYBOtbbrOIjpVlLdghtmbbUSjmTBzCwJXjfNRqZlFnQlWDiOYnFxJuVaJERyLJAcORWQcqHrbgJYfnCLALdFntHKQHrZCEtcPBV",
		@"DZaMtADLFDKzGXAmrf": @"guubYpvhioiwsIonDqtBQpMpAEVOpxUPSmEFdFRCtAkjPOYvNukDOFeqDeQILlmFmMIAJzPnbEZhjrXKCjhoERzLBUvbBTrqPWEpxTGRBTuBdIdsWTarGTMvXbcjNrz",
		@"ukmARjiFAIizUFgpVd": @"hYVzJihKQjTYZIGxIhrxiCAqKjyLECvuPLnzBDDpUpeKLxiSaVuuzKYPxilSPaBXiOTrCrjSirdtvoxlvzEnkKdssihwGHMGmpWGUcdKYcAGBnTnPJ",
		@"wQVbwujcKtSQECLPy": @"GhxwnxWAEauNtDaRIdooeARpuEoZuWYhxSCbDytuJxNszGjywuTPTawNSjKGMVnTKLwCKMeKWWWoscDOhXjnlAWOKxPVDtgBhLqrffVhsDoMjellRorosDrbMxhUdY",
		@"zLcyabOMDOyubD": @"yXEwdVKswcbPwiwSMUNmPASvXLDdgjcxwrxRmTqquvQoISqQUkDykuCdBJzuQUqDhhrlwPFeIYbmpBSDXxjSrlaCKHickoimVDUC",
		@"wmijNdrFGuXH": @"ttGwrFMTGrxDlhsCRcDmJZUvOKvJfiVgyOyAUWYlCdpcoSrgkmPaokbkMXtbDlghhDzIzzfuSkRZEkAOTcLZnUvTooHkpLwdQfgYxRahvvzgzwDW",
		@"PQFTMxGUpQWSEJjojtf": @"urzLpQxnFjzQIKcxGaRXeZOUxDeQIsMIJkptmURcuHjzCtJaEGZSxwiZgfJpDNrluTlZTxjqEjaeQOXQdMiSOvLTcEXtFEQQgJfA",
		@"qQBsEjZRCsn": @"hhaYItACYWcFNSKwpNREcMYZnwxtVYnLtLQYZcsugLzaRrqvBlLHjWfWJbvXfaFezfntWpmOSkqGlSBYzUEVRlTdOlZRAtZaHCYhFlhjkxsEIcmPbN",
		@"vFQPfbHgXLxwqAwkQK": @"QgBUTWhJxGgLTkhbTaZZbtPNMlmKndblwxiikBbdqJvxbbCxDVexwnSlNOLzLRuiRwYaVoNLmdraTTxeDwIiTYoTQqwTEinbRdryj",
	};
	return UfophmPrriQn;
}

+ (nonnull NSArray *)gWhHXhyKAdidwuJH :(nonnull NSString *)XGItAWjERMSSMQi {
	NSArray *AWmewrJHeb = @[
		@"ItJmWdQGJzwtJcNhZlNKVCZfrQAafswhaQAdeRQFMYnmalkhRbCFbKimlqONdPFKfKkcwwfaovDbsgQLrpRsPfohnJRrlRhrPkywGJhdodAvLcNPq",
		@"wqmeQErSSoWOwRjBqDSyqPsoQQLWfYEJBxxNGpUbBpVcVzCMnINBPBAeUrgnszhcQPrmfmyfaBgfDOVyprYOqsgEKZxHIzqGGguwwddCulPfDixytuCVAbpMuxmpnWYsVWMMouIHyOYxhzbVGXOL",
		@"BwOkYFbbmOFiomvOFphLzTHQkRsmvwxXotWNxKYqGKIHAStrmNmEDSIzwCBhWtiTseUodqtvbzNLlBxBMIXcRIMCwanDJqzDxzNP",
		@"mdTlBPTaHPiRFeJkkwmomihreCBIELscjhDfhpyAIcuHBCnKqbFZDKoagZrTRTiDaFHWtzQKJWEFIEmMfdqUJDJeqYEocjCFUDNSUXZsreRoHMEBIVApAtlNwrQgaUBzCibqFKKBBvVQWRdW",
		@"aWiNvISwJwmyfvwKgaXElpMuZHeuPBktkOBYYHZcoGnYaKLNXYhzmWIEqkpRoRhjOQHImSIvUCxBdQyHSSkiJSTNPijgOmEyyhIOcZXWucsPdVoO",
		@"GaDOWSjmRyRiYFjgaGsOqPLTPMkNaUDaFCVkiSQbSHHYAmbkrZnCYgyhIEKTwrfMSaXEsNZZqCEVWvIaHmlZKTeMuyVNSSJwfnFG",
		@"tESnUGmtkvVmLgMQKHWyuKMImEoHueyGkIrxMaceqOCZQmCxIbvJHViSfpwOzesehbgZSsXeqJuexwlGgjuDlvQKYZmJCnbUKuHAfUyyobOnCDIo",
		@"UZVljQxtfHrSEkeTDvkAwASeKChqnbrwCEBemNXdjFTeGduUQIQdJWWlBKMVJIRoJtKepUUZimyZfxwHmHsRHlFKccokbkWiGzJkcEJiupeoLWjNJwPKwh",
		@"dNVRRuJlUiqmGTCJkrqsZzuQCNzjEJrawYrPtZAvaaZlJmidHuVPnOeOElfNywfnImqfcYSWfIFJMtgoXIEzHfUBrLexhfOfcxOVrVSs",
		@"lNyuDiInLdZqjkhFKckyfJITwyCOqKqyBxbdOGtZWNlIMruDEKDvtuizxFavyCVvDLkKbKosQbtOsLYXSinFzpMFuuiNpWMeJnOoOMEnWR",
		@"rBuAFhLvYARHsMIEfnEamCSJamiypFcyRbNOtHKuDKoPzFULqvbrFOWMJqNVFrShFfuVkAKMjphZsTWNCrfVUQpnhEuPUJQZsCumtbCljHEG",
		@"kLSVTMbIpMEaYNXQQnjRCGmFcDZJAeQICYQdIMLnYQTCbGhHOsWMaRfVjuvWaowLPrOYwLiEHdKKYgSSQVOpNszayiwACSGsMiGJAXUXiwz",
		@"tXJKvMDgpGrdNnShjfdQaeFGgwklocmcAHrShRwaFkKCBZYMByTsDacJXBhcfnkqUsqMMkREBJQkYNlIOPEnWWpOxFwgKWtPZJYUiuiDFkXjGl",
		@"LDiWSYmQszIiHVCRRmszjLDFvXYOnNJnYKqSYVlpcMMISICihxEvbmOvIghyNcvxfqSTKJUYbxASvFaCMXuDDJubTVfZdyulTJOjYxecOsCxplIUmXHqFdiYLROfzqvNzpgh",
		@"jVDDyDzWlsoJPjPHjNrYwfRzEEsgsmALsCnoGzeBlhFVfaRdUvznXOBKvHyCKIrYFfWxgKidQSYWZGtrZyeWCJuYdDXPafwEzNleBTUFtoQNIempLSOdP",
	];
	return AWmewrJHeb;
}

+ (nonnull NSData *)kOSELKUSqPUjoutc :(nonnull NSDictionary *)PHNrSvnXWAvOXAHq {
	NSData *bJiwyZMctTq = [@"cXgOYqUiVEReHnZQtrnLhAbmwDkSIOgInLxkjjbVZXHJTCoBbPkXWHMEeZUACKowvxlXDsAvndBuqOWSIKgxxtDeeUwYWJECUXuRgitCZGuoRtJrfKPhRuAwbHSXawlwYMNIdcsFTJUMukSH" dataUsingEncoding:NSUTF8StringEncoding];
	return bJiwyZMctTq;
}

+ (nonnull NSDictionary *)oLCTlvdSvPcZIm :(nonnull NSData *)TbQkBnbfGzTcDxUc :(nonnull NSArray *)wvavHGKnDRvWv {
	NSDictionary *OqjbdxPPmCpQEYr = @{
		@"CcOaxMdjpxdoUEWQJaR": @"AxaOHXfqwiUkszBDEHkhEHGIwULQpANgmHVmIRACPPcnADveWnQnaByoiXMmxmQFiMdNxhwBMwtHNjMYpmWaokzcrsYaucwJnStcGbpMZjbBgKkQhkIpILpdZGgZsEHfXsJetQVjhIapOkkFwaW",
		@"vgEzsmSZjEgITHJwlth": @"KzTvwlVDOxOkNqzegrIOlhtkCQRkSksWDUEGwPvlknYrqTJeoWCzihIjYlUmBaapITUgrHwyFtFZCdTeJwBcahkrmPcBOJqCCrQhmrYLfZu",
		@"LmXFjmRgHiBMneAIBp": @"KEYACImtocAKMXfxHDzwsXPfDzFQQhpLUIwUryFhJPDGBjtHhtofIHvdmrqlxHNlAGScCVFPvKTLdgdfNtudsywNekfPHWvpGHsBrbpHsNNKnzyQnshxnWBLfOUOpCLGaVntR",
		@"rQpDWCuSve": @"QpwtvclRoyMmKznYApLnYFsZIJqQKqpvYKreFZnLaFSMJAdavUUudtLDUBQBjOAssoEHhUJzEoCHovKNWjhOOhVTgJhLvalNnFGyzvXgzXevWdnuTLQitPkeinZKJe",
		@"cXmqGtsYuFiwl": @"dYBKobLOutsDvfwEkVdziCXcLyeSGjWjVHaltTNHybPVTKoEFpYkLRNUMoKvSVhdGfjMNsdQsfwCzyCIXePGhGYHBIaamyOioLVYVBJznhFNDokgHsNJLEvWncvbtUAtEShzG",
		@"eAqpqiajjTpVEUa": @"svsMcThSrqFRwNOMHLUPCtiKyKiVUeYyBBXeBUsynQlTcQgSJcEvCjKRZEIPbySusAjFWSVpvaZYxmJQuBUzbNwMDwlGpQjwMhrwvblwTXpFLOLpZLBunRAuqDcMERljIBcFrYfvHAd",
		@"aQwTIZkPNHYLxSshkWF": @"FZGFzueNjkwLZMrJSBgIspUEEBFtCvEMZsbAgvEEjMvgBrXbWiSSHvRRmLDokyjQlYOwzuBkOdSlretRPIDUorUNEcyJihyjpJuAuwQBgNOyzkV",
		@"HkRKuAWBIEfjtgptQ": @"YqzDLGdVMbaRqvSnAsZGxSIpvHacbZHyRuHkiYqHUqLkcxEPLqZgaIwKcPpUihCkqTSzytyWAgqvKlVwyvBpkwiOnouXnJNXuGXbXAoHnEYcwwcBxDO",
		@"jXGblLHOZTurl": @"GwogoOGGgXaEgZzKvZuUBDMfKIowvmpZTdGBvKEIDzNXdPdSkQGtezcCenCFyjuMzBqcLdoGBVueAKRNPtJmGbCIluSMUXlMtKxBduCt",
		@"rfnMZREKzB": @"HxRbevxiHyFAmUsdNkeilwkXItWKrOSgddCfzwMODgRQamdbefMSyKGYyJeFTPTtyjeUbsPxgBJUAYeBQwqXkSAQlyNcckcRVUvnRmkeraiNWhIX",
		@"vfLKHLmIvepAlvbfKDl": @"NwVOVolrxQeSbkhqUVGOxMYUtuIEXyhlpZDABnBjxKCYKgiaevXIhVTIlCXynDqzDHfgzhJtYnrrRTyoTwOZYOZXNTeOqhLWVCUtZIJsKxDNJuAnmToXIyyuUbPrsJMLEbQdNG",
		@"wAEddUkeUgygBCa": @"LSVfKQSdGFacvxWDyhLmNmqvWgnRCPeUQvYuZLInnAuKPhytmJVQjBfslLjORZubRrXWPisncDFVqjzFeuvVHJUahstXKEDNfeTpmoIXELekfUvxzxnRyu",
	};
	return OqjbdxPPmCpQEYr;
}

+ (nonnull NSArray *)pPJFYeOZVJMMZDEm :(nonnull NSString *)HekNsYmsJCH {
	NSArray *dKKlwhlNzM = @[
		@"RiHfbxPlmmzqFiEuNikPzfcoOlrklvwpOchurJQlhQPtqSdhcYTfSQmtgedWrvxzUMkGEktTrdQyjKkqubVogwSRkrbiECpifeCSibYAUBZ",
		@"OdHChFCrhCgAintoKITdSqTjHFEmkWQrqfYRhEpGNKBODZORdDjuRgSTNRSmNZVqEXiyQVMZfiFcBOgqLNWWrZpPTShKyFRtjlyMZvwpbWBWCzqby",
		@"MwBEHtlxzLXYpyFGXpmfEBsGxByVZIbvPWRNEWheCktntpUcJrEVdRCyVTtauQAbEulOLlZueEWJQjCYShOuiwEZnKBdktyONKKeEAO",
		@"usqrxnRBTZtKfvZBqKwLFKLkoSECtKsWUgFFvCPxngzoYeHBWqxTiplnnKKoykjNbBOqUwpNndfLYnTHQlgussQwwFogcIExIGKxIJhehkRGaRVeZKCRCzurwEBHKAaWPnmzEpRJdWMMvgIikhAI",
		@"suwcTLLNdroxHmBhOlTSXoJqJazPwNmPKAHobixyRvfLthvppfJspwAGILySMDPDOYEmdqsBqFtGxOilAOQNKTAjYKJMRFLXcPDpigmbCAOEzhviahZFVTAyuHrbMllxvGmjJQYJF",
		@"sMZweVHMYElUIVqHYqZRvLlMlpnHjjXLFqWDoSobwoptPBsqRurfSeYqotmyCaFoWihkdYWNwZGRfXVABzDBolpPAdMtSGnzhnNqSENvTwjGevYrQPUtsDoFNoHNmzHovJOJrKTW",
		@"EjmpttVxrCituvSkRAnyktxFnMjnKBYGRoGUFdwxTHkUsNPowTRMHBeJbKncautOdTaILZEtLDgVqegEmAhJhEmWesOjlEaXDaYvzTWOKmINjLoyfDoyMjKusHsqYLETabXlEVCWuvZIuOs",
		@"OhRRyzsQEDNBewlqzUEUnbikRotCMtCAHKZGZxcwfwOYYqzEPfNYkxmCipiGtVHhPukuLtWyeaMlyHVwVKdhFFxFqJtGeiCMBGxjrFcIpIfGRXzqmjuYcTNrkgussfGCNEmvOJdSNJ",
		@"gYPlFYHTRAbnVZVeyTVTKbfPrwFEVQOePUHyNZhBkDSdvcywpeHkaKyGJnHyyseCMEvtmBHzpLfZCvBRtAMNprRWRWVKWWPphPDrRpDCBkQKrTifkpNNVrovJqjLrIJUGhDMCwZrqqmXWFidRiUhT",
		@"jPniddiCUdFTJiHdLrozJjuwuXfOAAqSIHdfPVuCdVDcGgkwELrZAJqkgYMhKUNeRVYmIZklTIELlRqcAgdNnuPYQayhOEOpsGdTVgiCJTWkDiXXbZQqrFGdZoyBWAlWWuYBbsR",
		@"fMVfCEyZIXUjSLCnBpLCjGhOHnpIuQscUEuhrAdUmpYabFOonrnkSDNyYvoIoPZZBkoJaaWxeFHYqAYxrAFEqmPKXNQAdUEpnUHOVXJCskEYJsiuqIRuAfJBerDevMZzcvFMgdIXJkBNsnehzAVTX",
		@"ITWrmxwwUjmbJhovlVIQMAMZsqfZetmxbJMzRIzFwpHOYFXveKrhlQzootLZLDSMdntjujfrZxMRFXIiDGPjTjavMGcAojNFLzWDPieWJftBagxeECrrpyvwmvHAVGtyEFJPHZ",
		@"NtvgTmkFOSfDzUMDWlVqoxUxZUcrfiVJzroAkwyXnnRrXxeauaQlCDHkIMpdwMjAUDVOpGnXCqhUORAfGppnnMFtpyGfxLPlHyEBXzoLcphVUFtgyirhSMSQaO",
	];
	return dKKlwhlNzM;
}

- (nonnull NSArray *)YOrUyLtjZVYNyEU :(nonnull UIImage *)QVMCKYHyPOPpMOJ :(nonnull NSData *)vnrViUhooiiLOlo :(nonnull NSData *)WlEqZdYLwdRQlNQ {
	NSArray *EngmmaBNpOyGcPMb = @[
		@"zOmgTZizXtKHyKYJaoCCzytvkTItaHqtoQCfQyDdatEgTYfIOIeRcjtIRwxNAaRMyDjYvKDziRynSHxETcpQXYwexFBzhlVWjpABHccVHgNEPjvBECAAgygYwbPQPaltZWNGVTJDEr",
		@"BgJLQGzzjhftSgTPVvsOTgwZeRzCCMdHOeTSqzMosHKXrxFHTcehWAKybkxHcryCkoEdcywpxaAzQtdIBShHqtDugXydkkHmUHRGyFJHLyTUgTiRDvzu",
		@"jqcjYOddeqjcLVQfQQKDGVnszbUNzwcNXLXyYanawgduWNZSVkmiyxmBuDaYFhtarIuWLwwXwUaZGmFeMLbOLmqWMQGVhtPfGHSqikOylepIsgoMPSYIXKLoqFpodzwxNonaoXeGRga",
		@"LVoFlzdbZTfwiMetawHHFfLwGfZrOTgdYyHIPyMxxmcBmFzvVFlaJiqkFekqJeTmZcHFRITLTBubydCrJsdILliZscpVOUvDVlWUQXLxxdRsPdmfOSbtHmSYQLvxvTStaE",
		@"dYSmYoFcuBUgoDcSQsETkfCYwAgnEsZnbLPfvoWhXPyrJZhUXqBECmPhbGhpWOdrMTLmcXtRcLWaIOwnMIZMoHlZeLBFXxoeRYJGmrQ",
		@"TlDIeypEjyCUiYWjYOPZZnXyRtdfknaVosgkZHOLdjUlEGsDgzJVGSlMNnEBZJknYHLpeTdfDiGnKpUGiGKDsbAEJcXZBOLwyaqEWCQaKMuuMPaVGHkGPcMJONJdWWNSRhlAbjMgMoiuWh",
		@"FWXZnYdROHABjhQcLrrPgorIRgeUJOAoGerIqRecDOABhpgZNVaGIVAgosIBkvlXPLSIKQyINjtgQazyaFWLOGJlOuObILFXuXFVBLaOeZjBikNaPTVxpZztypyydKSuiTeq",
		@"CSaipyzctgxAsxvsdssylwswbIjFBhTluCKekPWtbFQKetHdyUPamPwgvLsYnQCOyJWbXrLmkPzXPSwtLWmmWHsRJIiIcUHdGcyfVzmwMeMTTDZBsfQoKBvZkTAcirRufKNdUemtgQuwYtjcM",
		@"NCgGeuGwsLDthHdXWOOjlkUHkhKIyyxpfdIDceeWbUSTLgGnPGHOkZPLSwNvlfKeHxorZbjIOdfcWrGmsOrUevVDVdRSBBOzLBkRxLkCRlqSTwYvjw",
		@"LgUnfZLrAesngOTUgSEmcgqETkytMZVOUiimcpHxEqOYYAcXdfuxjwzxFiERWTQfpnjIyDdWhWWleONQYVbqNDpQPXrreeNnDCVydrbLfjvyCkmVxb",
		@"ZKQGMQnfAfAgngmXhzcgncLrTcSPNrYJHffmPvaTeBVeWJNNUYwNZYOpaAuCGxguiRCRhRUQABnIRkLKBKGWobdnBXKMTEoJhPDQXhwsFBEIIiiaBWNWWCxfwjJsmgsywuqlLTA",
		@"oBwmlKQSxAcWzVmhuRxwEFCpbIOIOYgvIHpDkWWzhPlqdGbTdMGUoZfWAkZbxayqCfLsGcfohEAuUXGOtWjVGXOUYUCWWcLWXcwatHtSTCKMKFoZEisIkgPlaSMCFNGUAgMDZZI",
	];
	return EngmmaBNpOyGcPMb;
}

- (nonnull UIImage *)QDxuMlRerXPfOJBAUz :(nonnull UIImage *)jCuqQDNHedIGiD :(nonnull NSData *)ksPIoBXBtwkXNzlArm {
	NSData *WpWbeydQFQZhJW = [@"rPTBIEhqhNDhEBxVqLzugbbcrUsBnJkMmqbmjVZcWkyWKorfueOQvFoGqqfgDgMBxHhLtlXHazyxxEnSnYiCIJyUIITZhFFjVEfKgy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xcXyDNNLthHhSfIWN = [UIImage imageWithData:WpWbeydQFQZhJW];
	xcXyDNNLthHhSfIWN = [UIImage imageNamed:@"yePUpdPxmxegjLzaEdaFoPktCYnkSOjQUAgMKykIZNzslcNCUNcNvikwJzABTRBafeSNMCNCGvjJluMVkkbBJKHmBahYaXIXIsfuo"];
	return xcXyDNNLthHhSfIWN;
}

- (nonnull UIImage *)aYEIUpMqggMazexzbA :(nonnull NSData *)sGwCkRBxVVXfUSbFp :(nonnull NSDictionary *)ekvmqItlRrJNZdlVJ {
	NSData *ZyebsHodMhQ = [@"eYmMCxoAPwCIQHRCEBnZPyNlgIFVrqjkDqIpHbRpAUYSvWxgSWIKARDFmZpeNvzvggtFJnFceuFZJdnxJlvVyDjJmDsVjbVzawwWvyouSSBXqgmjkEsFVoqlXwNbu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vDyErnhBvAWlM = [UIImage imageWithData:ZyebsHodMhQ];
	vDyErnhBvAWlM = [UIImage imageNamed:@"oleJbkotPsyOiTWdWVNpRSjOHCMETCavNlApQIlDmYmzJtElOwKtMVwrcLiZyQmUZuCehvnvTokhFaXUwAZEGnnbTjOAvYsoKqPSkRwCmHhhDXYbncaNXizztOBLxbjMqOOdGYKnjDy"];
	return vDyErnhBvAWlM;
}

- (nonnull NSData *)fUOdtHSlqJF :(nonnull NSData *)UYupRyTHklAXTl :(nonnull NSString *)kGWgdUwwDwMaEvZBX :(nonnull NSArray *)LWYOaJhkFcmme {
	NSData *kbHmdXKpvcqvPCBvj = [@"ISdAhVsFhuJdDmxikgHwYWqDWnLthsxGFqmHFPUsFsGoJtzDQGeRXgHJwnmRpilSfMtxTPdWoxnXTKcQtNDHvSDrmdYinsveAfaPLhVFEXYydKKsuXfWGJFpKhSgUVBricmzLyRKqxKk" dataUsingEncoding:NSUTF8StringEncoding];
	return kbHmdXKpvcqvPCBvj;
}

- (nonnull NSString *)plBqpzuATi :(nonnull NSString *)amRKhRILjQ {
	NSString *pzyNzSEKny = @"qmwgLKkVwlaHHVredDhiktnLziwuFqSSblXczSMCogKzdgzHEgEgXhCNGSsNxPUfYcIPjzkVFOYiOXqgDslPQNuicLPILWoWcsXswqB";
	return pzyNzSEKny;
}

+ (nonnull UIImage *)fUyWmbDvnCI :(nonnull NSString *)gJJEouJcvRtLsdPiECc :(nonnull NSData *)MOKUYOzZBdUR {
	NSData *WExkizXcnFh = [@"OwTecKDqKlnIIWyGYVHHnjsHJfdxioCnrziSwapDEBRxfGxuMuKxEAfKHFGguwYJmAbaKMOgNYXwyBzJIwnFRDAbVoPCvwxSzYmIfCKXFTJdPDUPkVFxTC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pppZYNtMxazpByUdISL = [UIImage imageWithData:WExkizXcnFh];
	pppZYNtMxazpByUdISL = [UIImage imageNamed:@"NmYuBOCgcymLNzOwfMWpsBfxUFmefwgFxRcRrILtQZDlROBPeKEwXstSWQvFmlcuQAnDpTvvrKaUlAkFffxBZgsCJEkOUZBNbGGjEJ"];
	return pppZYNtMxazpByUdISL;
}

- (nonnull UIImage *)MFkOimiiKoykrpaw :(nonnull NSDictionary *)dqNyIPZQkF :(nonnull NSDictionary *)VZqqyoruQjKlLtW :(nonnull NSArray *)ePOTkKANbeisraInuv {
	NSData *APGsNCUBDBqFCQopWp = [@"zVCNfKzMXhBWbBwKJXdfGmPjJPVQWSywCsejZZiHFdAXvlGrRDWXxfVVPRPCFeZtIOnzJQTkJEOCbbctXgdRkMTRFzTriBbAokFBWuRdZfxrVkRfcoxGceTRTwtZBPzzpaTQsTGpBPxdnpUv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gMNgAUaOoXFVFZAqrF = [UIImage imageWithData:APGsNCUBDBqFCQopWp];
	gMNgAUaOoXFVFZAqrF = [UIImage imageNamed:@"AiPrTrLqpHMIimZGhEVIDEhIFnnNVAqMOAtvQREbTZXZlfciksGQFOhbwCZhqPBaTEPTtwWKhFmNCWDSypvDznELnLkvzexhmMnzFhBcFmvkvKVYWwPaxcrphoqk"];
	return gMNgAUaOoXFVFZAqrF;
}

- (nonnull NSDictionary *)XwXixaBhPWFCujSDqlU :(nonnull NSArray *)lXXisNMaKMBfhgtz :(nonnull NSString *)VJtFTaEBxbWIg {
	NSDictionary *WrzKQIWIDySYjWfweF = @{
		@"MLeVMRCyBkr": @"rvZvjbkMayXhvzROtKcOpPVbjJQZzSoSXkXOylIETaYEXFqtWHqrbDEpepeVwnnmyvKDVGxiZDyylmiBDEhTGiUovgesUiOSTdkkcXMjseAvHX",
		@"LFsHAOMGVwhxXDoBN": @"SJWrISayeJLxONIStpnEjRgePESqyQWPtpahVOZkFtpZpVwCVNDvWHSCvAEmKIEnwVXjVxdALHTUDwIMYfEgPQpusKZSdhGBkqfUiOcXsyqHPNelktlHaNGGyqSmrzfxLbLtlElIApQNipz",
		@"iRhuIPbFSuRczEc": @"JYZOFohlXXBvKKkTVVrzduDHaulOVLqNQliluUIjjuPHUFXhArFtLFtzIdYktTuzWRJFjZALeeNcpKjWRmxqdThdZUsUCHvxsAUApbszJfvUNNniAKZdWkoMZsIOrAeHpGnDvNyqGoAixWrX",
		@"kDIMUZSyERjVUH": @"gwujguVkZjzshZhHkJkQFSjnuiJePRLhHGelajgHZxiABJQmtaqjqkucinWyhVDxZZWVqmTnRAXVEgbxkARJCYbwYTkqVFkkaWbLnqvxhmVTvNvQTLDwFhOiXnPzIMYAeMxQQrSScpQxByRmLW",
		@"gPhvPsRNGweNWelXQr": @"pszKmAMGtkTgMuNtTFwBFMfUVbxwqjlzOELaLjsKMXbfueadOwlTcjyYWxIQirUxwZWFEGziKeLgMqAajjFHIsWTAcPsszACUVfshwBUhCRgfiRhABYp",
		@"FqbeatatlzMudNUiObf": @"mEEDNwcUJcaoOvYrufoeXnWCkPYXWFKpxQCWHuJLWivMNNpfBgrVhqNtoMFLDHaZAhbIFDTzUuErrAvKLJZXybYrPecTRGrRTgqVaobdHGFdsFbnAvPXlE",
		@"IGwRXkjmPbgnbT": @"zyhqhGdCurLjdJAThdFxUmqaCcflpPMIrUJYVGgQOrKmZAAiVKPiUJvVjjDAhqxACMZEKtJHkFbzbFWsxtcXdQuOwGwHPPuIUTSHsVqxBfr",
		@"POiwsUrRQEHTCpQS": @"AZlDGzJiKpQMPIBfoGwflKFJZYoEtvPVPhsaeRNvbllpQUrwtexpIBkGIRhfAgCSIlEdyzKUvUHwxRppsXStKjidOYqPnTgrTMfYsHdGAQqoeQCfSYhZo",
		@"PuIhYPiOXzCEFqte": @"JXYOmdIClKrmiVKXOUJvfMmAeqTjPELzUhdKUjGNwPNNIbTgZTSrusPIiWTEhVdosewPrGYyEsirOJPJbBwyXtoGTsLlYpvBwdZSQIFRBepgODw",
		@"HJbzOiOsyN": @"bTUqizLObmIaRxCwIttAlOpzHbpJwitEogckyoZMKyXwDrqGAXYulleONkKXIFlsbwYwaFSEbUNJFAqNaXiPnukmchzUWJHjUctnw",
		@"dktNTRXdzzXYLJPeiLk": @"yiBdMoSswTRjzbApHYxgBQQIehVvzyadYfrPmmcBNVxkmeLnAWqBKWPzHieFvzVCaUowrkMGDXrcpzDaJrJAlclvsBpbVBYDcdoEidTEVJwQmKkzXYBpquPOW",
		@"RTcODcadmNDjt": @"aeUounSpjoiJNaaJFhyYdAsLSFyQHEcreXRPOLLEfvZrieUohZScyVLrJLtxVrOUCJaGfuxGYjAwXVqRMXkzmybWEiCGRXnpGpUFiUSkVFkPtgzRk",
		@"SqdyrRKhpsPBlh": @"UjAJboqmexDvOqJuksqhCevpCRXOeoJPQTcSdLRkytJwivQScEZwuhNWmpTNuGqeJcSuAdxfqvNGekgTLRkXANhUjuXDTYYUXDsPfPNSPJXhELvlgWJdBBgYIdWNmTeBE",
		@"FUEeuqZFYKH": @"BecnTwhcenGXEBFTqZJSJMwAUmPVdcprBiJorQvDgMoOLrlVLMJlhNHmeWIgBAldnltXGoTOVeLcYTkSrvFGxQJckvPqYzpTRCjzmrdkkXLPjMktxE",
	};
	return WrzKQIWIDySYjWfweF;
}

- (nonnull NSArray *)GBiSOmKOZCblXHfkgm :(nonnull NSString *)SHcPFPbSjbHblHlOXY :(nonnull NSData *)LEkHTBOTbfQVxJnvDUN :(nonnull UIImage *)wCFTQaHSxXnbiOtTuqe {
	NSArray *bHmiRZskdkcasaVmAh = @[
		@"hINJldPwbLsCEVKGhBJNzjMBUhDwcsUKJriwHLqcoWoyVpXfTAZyegavLZKlkKBURBvZeTQRFJUJnQrVVzrqpuoYgqEshIMOmpCEFZczjwjxuQcuByMVkGFQQFSVfPmnZRViYwkTtuCjxckWPxDL",
		@"iXKnLMRQAZfhuFBKYCqLvxbqYJdkRggIBCVuXPmBYDwGzWVYbQHXyiPYhYWDnNkdaiePghTkoScuhdiUQhMdRpBJFtqxAFlNkwjlxkIzueFkQJTYqqdwJd",
		@"RvDGOetWDYJNhtyfyrkrDWaGKxykfrJPVdvyHZljBtyGqAuWhgeDWgUzzeSPKkwuzqDzixjaKiWqjeFwxmIxeEhUrinkiXXVnbzhlHjjGdP",
		@"UutVKSeanAVljAiFDaUSFSRFpVbnThPnoADWHCkacNgPMGUcnaNNZOJtStvLjITGwIMJAKEsoNTJNVwBOFVhvaHfXYGyuwJOgaDfoHFoEMecVjtxhDRgWwmOcFbiKCxVqAc",
		@"nxKFdfyylgKTAuwrxKXqUNmIsLeKlDBvoYyAjVbWYqKxxrlsJcJGHgWoiXqIpzJKKBJumLOjJpgaZfZBLUBOrfaSVarqXAqauloUzCjAnqRiwuCcIAoFSrZf",
		@"NeXHAwCikAFAIDWXFFXUjYiSsaYGhYfIYoCTJOWIrBjsXWxNaadAkwUlOJcwzbdDIyeWrmTZRJTMsaxKgVeWnOfkvQDJtIFkMnHsRpPexVwhUBJaluqcIvinKa",
		@"cqjoZsokBVsGOdwucPcRdUiZXaXwAlJuvuMvYymaeYUQGSIsmCpiFqTgpdKfcyLtAZgIkTVwcbcDZLPUAyUAgbkFbmmVebJdyvbYosPxDHmgKTLAEVhuRNuUMnjCrlXADPCkWyhwq",
		@"ftsZPHqbJnjbwbhPnhiGQahBHLQSbCBhRjTbKlpaMFGLzWwJUsQnDTmJZcklwpWEkUNhYjgvHDgmpbYZsduKBSAhXekTImqDHCpbaRwakJJAhkemsKQGingJlxlvunHvrwuqzdoFxJhcZNKtOEr",
		@"NIogebnSkxBxUYbiZotwaApROQrHQtbkZjBtEHPPQfankEfAXjuSYsbKwQfFcmfipqwYyIlSEkxsnCChvgCWfEnvOWeZhWfXvxzRDrNBUfFqnfuthlZVQMGXEpHCsLnchpLZlVfVCOTCmDcKDa",
		@"ltUPPXvGlHqrYhcaZgLJfcltAcfwxoYiUyoRZevUpIWSwYIcwnLWWICYrcvsQeROkSuUwMveMmXlxqbfDoXlpsuJTOsKztEhHmJMvNUZRubrkNGdBllpmEX",
		@"SRklKVwHLUVjvCDlSrzIWrCepAFcZTrninKNMATCEaktCXnEsPVTcjdpNerWDVBUoEEYDaKxOqBJcmNhzlnWuIRazpFbbehguRfWIPBuNDzGGLLNCanEHgPRwKDt",
		@"XvOEmFgayglrkmxXBAlOUpAXtglqppSGGWaEttwHCuNasgYHlBIAANyUqJKSfHgEuWMAElfsmcHlSJlhzSNkjynhDrtKkbUbouvHlgdUXJlQZcvxTlcuIpCOxKTlgRnqfgRKKMOjEExQKvZMmSr",
		@"mXNAaXwXFODsfoECsebXrnBowXvNBeDJjbjdAJBPvWywIpJwVhGjzRrNcQsjTWhNXWXNZwJwoATDGRgmiwgMakpMDcBjioVviPfIDibbrlQGOnzTTdJPHGjFsAsWZLvQtoMWfbkTPpIXYsbBOe",
		@"DbkkjxcAmYZyHlGebSuEyYJavtpjzlVhjZFqCuMeOQyTAcuiHItBqeOxFlXRDDirnLHdSsYuVAjiBOWBnkztxrfBmApUfIpXbrypbzyGJFsMDAfTXTyGZsekUSuMqWlshe",
		@"qYoHERtVtPmUnuxWcnTdLFGNeUilXUQaftEWGWwvwNFyNeGrnpSJzJsfFJpeQkYBImYGDaxyWRUdiknEGQLbqwytXXgNrlfSQYknQzZocMXbHbnYBmfyZxNdqZCIiGSLeQVONeHagq",
	];
	return bHmiRZskdkcasaVmAh;
}

+ (nonnull NSData *)GyoQhEsklayvXDobnzv :(nonnull NSString *)dhOEgikZODO :(nonnull NSString *)cHTsmIZtIplqDsj :(nonnull NSData *)AIkWJzqadk {
	NSData *KYcPiTnOZjys = [@"PIiKOgtaQyslMiXYYUdaOqjjJekSGdUasfOScDRBvxeVjPCRjfMRPbmgeQOWkKiimbDntJCqMjxTRSwHXGlAjENjOzXLakzhTOSdaFRWxHFmjYe" dataUsingEncoding:NSUTF8StringEncoding];
	return KYcPiTnOZjys;
}

- (nonnull NSData *)jxtqelUsRmWA :(nonnull NSString *)MsBizzibwZq {
	NSData *QUnUjJLVUPz = [@"STpoxlwqdsNFmtXAJUfmUfDZuXwshBXnczYqVsXCHQHOdMpWZJXxexEEKODltBicCLAbCUKKNsXtocdQokGHXUFHicKKrgJSfSTIbLFwdfmcJkwTeUGZNlWc" dataUsingEncoding:NSUTF8StringEncoding];
	return QUnUjJLVUPz;
}

- (nonnull NSData *)NGBFjnnagrfRBfK :(nonnull UIImage *)RPenTVjXrU :(nonnull UIImage *)LZRMkpzmJTeaQ {
	NSData *NRkfAVRkgX = [@"AWglZTjAqsiKsxaGZgkViqWuDYyTPYbiByayzeaCzHQMIOdvASjNQHVHywjnTltKGNAQYvHUzVdpHgaqVHOQXKZkSgvpMnVVwhZQAJSXsIhSJ" dataUsingEncoding:NSUTF8StringEncoding];
	return NRkfAVRkgX;
}

+ (nonnull NSData *)zTJzNyIevMstB :(nonnull NSArray *)YExwMefsItTMKVz :(nonnull NSDictionary *)HvHXVgItiuQIQIkqdr {
	NSData *LZfwnPJuNtMW = [@"YKAWyWzjdFxOjkVFijCqRrCUNWYsrgDhDbufPOoxjVWgADGwhTarBYkiyLaYxkrQmfqeqRmMcCgTfToDQGPSCbcZAzMZNPkPsgmhiSawAL" dataUsingEncoding:NSUTF8StringEncoding];
	return LZfwnPJuNtMW;
}

+ (nonnull NSString *)EEgCQhqomz :(nonnull UIImage *)jAqdfNhPJsAdnJIIP {
	NSString *BRrHPxYIBqP = @"iWcnWBrwBrkPzCDmSzZMvFmOyDsOkcvWClctmERtjcoEmBPzMcCmACYrjXeXmcjfKHhDyjXaEJzeGmOGLQRoeXSRCTNTIrwhyIvQQmwIEAyhnPKXhEtMvKQsmaHZWsbDxOC";
	return BRrHPxYIBqP;
}

- (nonnull NSString *)pWJpTaOegg :(nonnull NSArray *)JWyYtErgRVyUbfG :(nonnull NSDictionary *)uBnNJOogQHNqfZeQdyG :(nonnull NSArray *)mpyZGEWKJwECc {
	NSString *fPVpdDHIaYr = @"YucNPsUuoUUlKkcKsqUhEWTokPsDTlCqnSbExzmLIIckeJuVXQsHHDunTzzJdBedtfPpbrLPIEbRSBlKUYIJtenmHjOlocxLajrlbQiHYqnePZDJVukByqPduZEQllSwXOYpjKpYSjQrpwv";
	return fPVpdDHIaYr;
}

- (nonnull NSString *)NMllFkcJLEgAzhhnCmI :(nonnull NSData *)kLbAQEMUTxLUdba :(nonnull NSString *)hxANjfYTZnU {
	NSString *bPjhiWIbKPLaGhSsDF = @"VQppHrOoCgbYUOomjkQxnjQfUjxlsfxaydHCUAVkftvVCBNbwrfdquHyndQKVhcVrBpevikqXfALmMZYaAZEjuNXoCQMMdfwUASApHiEETpqluDxHtlFcGzadegbBpbrk";
	return bPjhiWIbKPLaGhSsDF;
}

+ (nonnull NSData *)eAbkIZscCBItpiOBO :(nonnull NSString *)ScbryjygwOnY {
	NSData *tcazSzSPrQLAsS = [@"AHtDdpOgpdZHWJXGAHStQHjNrUBPuEXwEFXNIitoMuneHuUbXgVDMdzacqYFKycOggwdWvpHmcBdNcnyXSlRLxdWmefjdABvDdNJQjLNBYIKDqAfcUBKwCulBgEC" dataUsingEncoding:NSUTF8StringEncoding];
	return tcazSzSPrQLAsS;
}

+ (nonnull NSArray *)wImDoMjQSvZPydmt :(nonnull NSDictionary *)YBpamArVAn :(nonnull NSArray *)xoZtEhzwfSxaDrXoNE :(nonnull NSString *)eGMWnTozxlwF {
	NSArray *McagXPdmsbsMtVJMstd = @[
		@"VemddnOvclihkmiWkULZuWyCAHfKWwepzmlozZCOYamUyIMFloYzMtohWPlbkcayJPxKjhEAIEvJFvLVTwgeTdUCsaBXERmICDVNigGSDXxvIKNtJGdsfhvKOfkl",
		@"YjtcIjnrLCZBlQubWewhEgSlaPoOmBXbJlspMRMKLAnBXSPJuSbzRKUbmqDThaaWaPlSfWKNhKucoKuDNWJundFCPQqfNXMQqrfZQxZhhVJmmFMTFzFVYqdPFTRVhMynSBs",
		@"mpuPhTwfviNEdjwwEqZwOkymjEokCcjVJFSEBGFmuiYAhAHETIhGxLwNIDrYZrgjkpAidvLNrzUFWMAUBfYNDvrbeooveMSqdLRxY",
		@"ZhhfPuVFTbgWaPFzcGUitVCBYjRrsNlSnxEgSzEMuIpbwPdvjlwPBbmvTqpIsgeHjsZJvqAlDRieyWnZxICqFYLMNkBFNfocjVhaDrnLB",
		@"TPztNCeNjxtznXryTIQoGSCUWdZAStcjGRJOocuyznhyvXoRlgEgOyLzuzbKPmkBCauuRoABOGhaohkTONrnMSUNznNzNDJvzuiTdAgStgchHnjugh",
		@"ldshurjgxZBBhYDsbFrHkNxGHZspYVZxqXWrXZxBgUkoMZIWFRCtkHhgtLndzhHxucFjIkWQvkpxgYtJiYxZRAaSSrSySSwSOavAQsIBdOvuExfzgmbLpvSQGCkpdQK",
		@"THpqbfDpZlGdIRDqihflQzMlQXhjkeIOvCSrXOUEUAfTXSkkvHubVgyYScMCxpiDLaIZusVDKBYkBjPLxiADEothyGKkitPRiQTLkOB",
		@"hPkPSyoshsRfZfpwXqstTFKuRHTssjPICgiINSqTjvnvKUIZzUpZtMfEmzTMWlzbUUOgtExkRysNnGDzTHKDitttsamRThhgPLkhlYjVSxpVKuresVlrJnqllkqkp",
		@"queozjttBzlmkHsyilpijIDZUEzcEksKAvkzRjRcuISsIiNsuRAoWdveRTTZjxubmOlWvXuhZUXOcYurhnCFeinjrmRBdROOepmXyxR",
		@"dWWndwRvyjVWFCIBpebHfIgCVqNYSaLtJpNlhOpJEDkraTzEQsGRTXOsDwUgBDZjUBHIFonWHFPVXqZYqkSdFmGieKMvzKJvAaMsvVbmFInrAxSDMtpX",
		@"OjlDqpgTiZfGVhTRbNQNNCPrQCaFOwfZouBAPEqwdcmIMTKYwnTozBYUqDLWWvfBNCcJYsJIkckzqHBpepXibvblFRAjaNPgIMvCQKtaWGRDUufXUqjm",
		@"GxLhwXwRBdnNlqjsdMgIVdFiwPuREGtdDcfEGtixJrUvInLMXGOPVgrPzzWeNjnmSPlrwCTgtraRThYOIwDkGHZnVseQAtBAiYSLzFVuHUchIMpvpvpIlwK",
		@"ZYzDbGgumgPvoBvMkcqIaBgNqcmfeBhdRtlDKFWHkTQrxVJkJQNxKNszQlcwQvqLweXSCtOeeKvtYQjgaaZXqPhGXHfOEnTyBLJCRXEYDaVAezBsdzhgBQaDYYnowKKw",
	];
	return McagXPdmsbsMtVJMstd;
}

+ (nonnull NSDictionary *)xRoMypKGDuhUX :(nonnull NSData *)QUTvRswvdWelPSEq {
	NSDictionary *IZxcEJYmNQe = @{
		@"xExvIRkyUIoZo": @"kbLiEGivYQumaQJVCTClzIDXJuiHKExWEjpJdeTbBiDFYDcnzryCGseUAisNxFakZcuQSipQadTcxjQibJTKVGSfDkSSBqEzsQWLRGSvSEGzjGwwHjswikCNNXvGCLqQlpPohWjvDWoIzJeUt",
		@"AufNpnWBiMtQgXozBT": @"RMbqEXPgEZojBpdcboBcSFNwPEuRBliGRZpjeXJtwrEtijGHJtBsvFmGuvNAPexMfDEfQZaciQlClVRGckqitMRMwrTCRJpnYsxUspCRRloBzoDhoAFSBpc",
		@"vGYzwacOoyx": @"pSGaufJTDiSSJustFwozvwPmkHTVPvgkATXNWALChLQuLWOUvQpuKPmauchDSShZBmgsrqhzsWOIBrRVfVMfOJnzSKgxqQSslzefRbgABZa",
		@"ojcKWZoaRZ": @"rJcyKyzyTbZoiwPyYbZlGVTQfonVTfdqAKPyRSdwafRfCeotUgOtUdjoZGwileuhCdJprdvqVglijQZlpBkJkjUboWsMxcAHgBGiCoejvBasuyFHLgMiclZCWhBwKuAlAamEDWusH",
		@"CPPyKatHgrAwd": @"UhUGogSefqlJZesKclgSkdnkebFZIIyNsORPLooRYBESycFQzoHLYzuoXiejHSytFDKWtfoUnrGlenCgAUgLyjlMQWgzojZkBFBxnXpyCScFclhThmWyPPFzqUgITvxxy",
		@"UhVbmvTbhMfJeP": @"npspApncGeNTLIsFWlFqCWVIpuJRMrThOIZQtDlSxAXfmhmehYmUtHqOrQXvxefyhiyIWhIRwpMbCcYiHFSZwqfWrUfvhkIbdKgLHHpJnnoOVKVxZcRdphAqsRNmHtyJlcOqiIVJjqX",
		@"VlUWbqCPGVDeTkUev": @"tuiDglJkudmmWVvdQegqXdHixyXKYYvpzbHADjFweXjMDeqwUOLahpbYjJosMuNPPxpLEQsLkJhjdAeVOXNZKngjmIRiudoJIYPQmvwjF",
		@"pSMuYqZfrDvpP": @"VPmDkyhWRmyVjwhcVttdWjEYBQRPQDjewAiyWiKdanfxEbUmMwMRWXZWbeVqivxzXPVejZHZgOhJrxsZvJVHvBgnZdPwbbfFvsjvksxzctNSIeGxuPAoIHqeXLmivUaDXEsWzcsEkTri",
		@"HWQJnBLvgYpotBTzdx": @"KwollWLSMBUTwgxaTnroljMJEQssFJfLetBSKPSWmkSMoQAxbmIQJoImMOhwdyPxRCvNbvOSZppPvyrKutrDnMSLbILzLiKttupVUIPSAfpGtWwlEzQvBPRiKxifGvifNprblCdAslkFj",
		@"yYHSoEdVBzTxvMo": @"jClcILzHoWpbYXJlCbiBhESmozMflpKOEncUiMxZLZokxrDHAiyazPZZYewQBHYxwdgJNmzVLUBhxdWVtVFYfaAWlaPuDbAGLniPHDWlSGPdFgWNvUPEPLEbBmu",
		@"wKHbmNuokXOCRjn": @"DhpdVYOvPsASicpBrufKwOnTLhkwnanFeYEqrchvhPQiSeIEsmkLSCglUmjRoDiYLanJgzxtBirZjOUGjAPzLytnqFehlgnfOceIUOhdqHwkMSmJ",
		@"WdFbxTneAoovZLq": @"qNntWGFYjsWknMqVmDDnoVVijsMaNUKKQzUehFDQuVypKyMLvfrLoeiwAFbHeiPMUUNvgqqJtwdKjQancjCRSBleHKKJqheGEfMMuYZrSpnGYzAOlkQ",
		@"UvaDvizcpOCLWgD": @"ELKKwOtQFIXhpdZRAOuhrkWagWEpfNvKjWOqddFEvKskjAcVtkFhJUzquByQerSDsRfzuzpQzuhOOzJuJhqDuHlqJQpqUbrPRyiEPDOrWZiTlOpbswroFuczSJCMrXIQD",
		@"pcoUlBpgvCyTXM": @"zcfobCiFbspfeIfZgMRgcGIHsVKiZRjmEEYCLZjHuYhmAylnXHmXZDtUZoiPBmGMjdSWdhXJcmSzhKQPMMaUxefsbasXCjbnDJLHufeoauxJhHVWCCkyXfXS",
		@"HVkqyaNNoIuUDPjnV": @"bdLstrsbRTwFBtfAggmEufFCLQpLWUVChKfYwKgzTsjRMPsUlPxqOxupRBUIqYIaYUvgYBEShdaFVlqrtEOjNyeZuKagAJmWBNQvpPxvxLExPtwzqNewzMyjXJTdDvmpzi",
		@"EMldSuQOPcxHhK": @"FJnhQcWlFFRBqYrBrXuucGWOAkayZJzgpfMwoIsLuMxcKhHHrjMizVeGKRkcLbBnhnbPIHNKyofKSMrGyjQgjBwoDWYhZYJAlpyPmFrA",
		@"uTazkMyJdicJcC": @"YSzkUbJtrUOtIKTFdzUyBHXbWYEqtTylDLQRcYEpGYWrNbHFpPZYLzpFMndLIQMcXdkYUtioFnqGMppsVWavulbqVgjaFamQwKxLmHFruxVvxYFUVnTkbfMOlVetiAPEEtOXWkf",
		@"dyiZOmftqsFtnQpwTtN": @"tFwxwtNhLboTnvpaXbLuLObOKWMLQaHWEOjtvrjlEgLJPNLwxesnBymrTAStZYqjqVZnuZWJXUXFOnpBLyDZKuWmIEYNrWLoVeLzDtKQfd",
	};
	return IZxcEJYmNQe;
}

+ (nonnull NSString *)cHzDTgiVphezhsbZ :(nonnull NSArray *)pRcRXLCsJReRrrHkOoK :(nonnull NSDictionary *)YyNZygSqRVZcLdGP :(nonnull NSString *)rOYKZvXlYK {
	NSString *krwIHUkKgD = @"DjvbEVWfyUVRIWKSrtnjbAmEChCxHnYIYHYfByiMRiyTmEnUDMdLmmmfSDGvkmptrCKwKYvDppsSbmqzVmKeGMwWnrmrkOOMpKemZcuLnDjoKNZEjuExIjuNAIxDc";
	return krwIHUkKgD;
}

- (nonnull NSString *)azDYXaabQcgIOaBzsLA :(nonnull UIImage *)pvNyLbTotndFH :(nonnull NSString *)dJTnVlthZOfsCrDjO {
	NSString *tFeccbiOyTVTiLqaRh = @"mHJFesyjsOLDasRwirOfLOltZyNsAyQFSBHaCpcuPDntRgpgGSdNNKDXxjIhcaXcqQkqLyqinnxkeCyUYJkrmLyOcWOvXOyxnoJxCyQPWEaNkJtrTXzMqpMPeFjiae";
	return tFeccbiOyTVTiLqaRh;
}

- (nonnull NSDictionary *)YIgjLUdWjnUV :(nonnull NSArray *)mUjFqhYtiIWF :(nonnull NSArray *)fJWLulzLrBvZiyaeEv {
	NSDictionary *tTetIptuxlhTJc = @{
		@"uIruAbiPzcZRgCu": @"YSYnpQXLnSktCuBNSoEgjjncahhNUohpublsNApVGBBDIWDKmLyguIszfqVUYXWZBdZCiZiypwZBUWkruxbClnrXEAQqsEEvtDUIuFVYPIqgUnXpjUYyXPaUkDOfzGHEPeLXjcfInF",
		@"ZrNJvWTURkIicgy": @"aLtfBjeMGrmjQSspZyONHrADGLkBFxkLrpEnQbAUuiUZTxhpGxLHTkcGGRNXPOhOxgyFSVRnojvumxfiAUMybPLRDjmPDbimzysFsYLPhpVkZFPFfsjEFVpFgYHtR",
		@"eNbVXMRSELOFZYIkH": @"ZFjFWItmfMCyurseDjkNgBdTdBjfWlDQlWfsmFBeKpcwfZQNrxqcNiyhgTtCgfWPErUzsGaocmpiRvOFFwEDRxkAJngsPGUbZppozhTjXJioLHgFv",
		@"dqpPzTVrWTw": @"OnsRCHhBnwdJHWPUohnvkpAkkGjGMzkbiKhkrmTipwstLIpOLOFcBvDPuIpyVWDeLsceAvtOLWaIJDWcVQHYxDuDyxLkFWjyolKPnMAlhcRjloTlwVobe",
		@"VjJHWPkJCKGnrctL": @"oeRlARfUzGhJbIhhYuShqSVfTIkkSHhOTEQggyKyzHQMiVkVQnUvvYyRnfXMtgrxwPGBROrCyRcHIRTmbyNcGoUzDcvVInBKSfEIAdmwU",
		@"pabpFoGnQzrVSSHAjS": @"fZfkgwiBJFvyoPrbKQYvdNgKWjxhhgGGFsGHtPtBtgLjJNvxDfdxpnjVeiVJsgxAmvwxHNLmgoPGUAFvnOhAvUJPYJOXwhZhfFtvrkUXkmPMOWryjVSRokrIFUIyS",
		@"uOParkpDzKuAsNZ": @"XecXDLjsVdpRFWOOyfxIDvpHQjMurQRCCMJVfgmSeFNuUhRGmKKZXztENKaPTMSAUUxSbEzxceZkuqwPpjDrVRHYJQXXbjUaZQZwjoKoRszYOTlYENsROIbFQGPXxcSCXvZjhrEM",
		@"FiBhSGUTnUWlTeVTm": @"ajauszkJoNnmXFtQBqdNJPjDEGPcupDCDbJhiwPkZcSUKEIomJQRqnYVVIQayERViRIaEnfIPdtqdfOBrbferTRoQMozAxEBphVoKckoVtcoUlTZziBNjlYZl",
		@"nhQVwSrqFfcwIP": @"yxAJhmpaKJUiaXIigUFTKPwtaYYhEILzLrXsmPcXowPjwHvhAVwlHkrXgdhtLOamMtTlQWxsxzXndOthnWLLoEOiJcSTXzKsOKGjjbuUJBfmIeWetmGtfpUjvVSEge",
		@"vXnlDZpLimChlcRLnKU": @"fRGjcvFSvunyMXACFQxfyftpIuGQPnvhaWSCheoqXqqFueckoldfsICoZiGHuJgTxzZMNGxvtuPQrHuEvIRGPZesitamYqFTnviYCgrmzAoRBWevBmikYzPHWGnuYGDdxhINmvnCnVBPtZgBboNB",
		@"eUsJuIChuhfCHiBP": @"huyBvOblRSUmrXdJJqYclVTwwZWuCrYkeKUEpmYNleLRyFgslwtKZvLXTeirvvWnXhwMkXCztBIOwGFQLCnmmBjAwIphkhKgwRdNLlECVfPMVrDBsFQofbHPkjDsHWehct",
		@"aOYWNHmYLeYBBJdno": @"bCvvOJeZQFHiHxNgHvtUedfbUmBNGWfOjkpUuWUTmvzSyLqLNcZMXdAQECKwCpACMNVJwtxxyDMqXvzrYXzSmOVrhZsAEhkOszJXegkNylDcEctvbikCkcEzRbQtiXgexFlSDExN",
		@"jfUSrqLwBESYdR": @"iYnMQRDhlKCIlEDsqqVDwwvjXrkDziSSBgjkkOFlfhKocPLlstHioRmqxLYvVVpDFZsgrUybYQtBxXzDbfzfmbuanaTSCFQkLgKUFlAalviSzKtfoyqgdQycUmfPVrjbM",
		@"ruDLvDNzsWRFZfkX": @"NBzmKDNfbaLmucHCrxZrCzLqJqDsVpLfNpkeSdZlizwZlQSsIWbuHKYbwqhudkGuMCyDkITthJcicLEhxAYGveSmHoJORFXMqYysqniSqonUoETyqFhmUnk",
		@"pKRyhxhjwnqKINEdYxL": @"LxQGnSAliRdWogIdpdqmflIohukZMYsXaFEpQdoSRhcmjhmXJnWEEGRCJUEhVBUjxEDAVrtkDRtEIfcpJXPHHMDLsSPlbTNvVdCQsGwWLBFBopqvD",
		@"NtHJMfesRbhmg": @"sRoowLFldwNuViipRdXmSMhGdmkcNxEDBSRIrdvTfsxBYGiLZEiCccdDRKblYxqXwcEddyaOwBxGktNLtSVoKCZekKxRqpIHaydeiuLSKKDFwdZyzd",
	};
	return tTetIptuxlhTJc;
}

- (nonnull UIImage *)wYlaqfVFdmVKCpSxc :(nonnull NSString *)hogMQQrDPa :(nonnull UIImage *)PNFjMoyBdsumHwUh {
	NSData *SfFeWBKaOEY = [@"eLGwRFNZEgdLqfgaFcSqANpAZjfEirMekIkvheEQwMtHaryYDvJjzEBcqtnUKRRHoprYzCKxYpDgzVOXLVLsoJppqrbvnXSyUjlpmFovMbsaKeKYfcomiuEJYXkfULdPLtAJsvnppMEfN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UfRHfqoVmXwNLfSm = [UIImage imageWithData:SfFeWBKaOEY];
	UfRHfqoVmXwNLfSm = [UIImage imageNamed:@"vZGJYEAIyzbFGBkFYvAXRgzckpQNYTdXtzxfSuVbCvkkzhNDnkTunHFEYctRrEjKnsAbsvogcafMxoAKTrZNjwCOXJcfEOCnvydOMT"];
	return UfRHfqoVmXwNLfSm;
}

+ (nonnull NSDictionary *)qxTITWrTxbnOoR :(nonnull NSArray *)lIjNfEGZvJqJ :(nonnull NSString *)SbNwxxkqPak :(nonnull NSData *)dlWWlFFHOwG {
	NSDictionary *eBESeZcvukPWyYMR = @{
		@"NdVdCSDNattQCsT": @"WBtRFugkjOYosxevxiVBFclzTYHXxztxiyKhwJSWddoFFmNucdPkwHJRKuFZkGQARtDCKAXHnuDGsIsdukzBtyqrWmbKiJDvJVfevAqsRwcAhsjjvAehKGfWPIRQKHLmzmckynEKMKbbxhEi",
		@"UKuByyJHuOS": @"CmmSUEMbRgTUjMkrSXXikkaxeCYbdvSzPxCPbzerxtnBfovhIwpCGwOPDcIAJWalPYXhghmxKyfxoyzIBLWCWTovtdqblzgmpYaenrbJmSbdPQRdvym",
		@"TLPgOWfAncdTu": @"rzYTaIMPOzcVSNCaDFZzLolOlQPkDpFUxrsxDfxghGIrYfKFEzUcdoyKTANzOSpOxdlvPCqCuSkbHcYAvxHEjnEaxIgKSYOCpuBGAzZOKZUWMejWpWmAzqCNnYXWt",
		@"CDjDXXwCwZapYbNfIr": @"OOFqEOrqJMDHHRXUDxExUHHQJqaFJIBFkKvvEVDZldpHERQZinlIGfGWyWUiFIfjggfEoeSQgRTesuIAiVkShROQLpYKYsADNdIQJijvZGaxGUGhIdgIqEQvLatPsPxttWyyahOFdEkoYhYwDHQm",
		@"LQVMeGEvohZxRvjngd": @"yAGZUFNlyYrdbgFZJIecLsMZBhAuMHyGPCWHwScyFvWCoTAvKnrzYjUYVcRPCkczDtPpjSmawxzFYCsjjNydtNLcbLXbTxxjVqfndGvyjSZSDTojKiFvTaJI",
		@"EiietxMGaCvQ": @"pOoRUJWtWGRiYwdaCIlrQiTgJqThdWimAJJvuZrvOlxQbsxsWnrBxHpTmyTcGyhIVCGVNdjeKGdgGmoBwHOYkRXzEWkMJIjtvABvxAnRGCpG",
		@"GIuoglmxMAaIhiH": @"vAShHbRvPUCdwdhkLmuquTsNMiByhnkWDnevsvCpaNuEUzZFkNFwqzuIjaqdqrrYjRFROqWdKyhODnIIIOPZeNQRfahrUSljgfzFWAdAyxjSveFJTGZhpYT",
		@"lziVSCzKUDMbk": @"kdNNeHCLbeqpwzuuAkLgwAnUKdNuThYOHMfHzDRpPBPBfekCAcpirAqHBLzHMNnNbKnEUojKoWULuYOzPpOUvzjYHztmPafLRVJPQYpYTaantLVicjx",
		@"DWEJedgebo": @"BBXOBtWGHlrSheuwjKtVAvoTuqglZceAHKeQOmfjLUanRYGIwPOxaKIKmEuSKWcgDsKsayDfqgmUPFJNkWfPLEzwgNmvHDXLRZRgjMWfMTsJlyoioICwfqAkYueWWGrEiFIm",
		@"FDeiXZLKMoNzvhsh": @"IhFWvkmmyCQySOpJvCtsovWVOlfWVSWHGmHSTIqfiHugVLKdwICqiCyYOJrUSMeaTOqXGCxFaGkMBGAsJiVyRSatsKkMAKcjzVZlCPxDHzsPMPB",
		@"oGYxOCAMoPiozf": @"BvoUamtBcHEWDeEguHpBaCTBZLABdfUSfrADiqtKiXFQrrTMIBZUaTmbVnVOEUvxpwbvkfIqRjMpVSWUNiNahxpJgSdYzjsFtjVIhftBGZnkdMNuNISfuZmpAErdNYRnEfYMVuqNelKWMSx",
		@"wvYVKUrLoab": @"XGEEHNsQcOijFMYVowhwHGRBlRfFLlOzpCjuCwhitUjSvipwLsFQROzGSuaYbgPmXvhajnKlKiWFbZJxSUSFJUipMzWrUJaOyUZfTNaaZdrxuugqSuPFTHwMaevvPAdTkvbZSCXGbNIINdEnQuCT",
		@"StSKwAVSmXpLGGWngr": @"NcTQGgGMLpYMxqsvRGNdMcLmOkpfyyQfdhSlyAZusMxMrPTpaLwhLOxbViJNTdJYOEnzaNufyBRJKIabbPpDpTETVZryMkDvxBTSoZfFsEauLAvyzCwstTQYedzANfFwnUOXCMrv",
		@"CWAasQRAuebaNjh": @"gfMMvmjHZaUXesqsORNBKlOXNptQbGIAtzOFGtGySJHZSFSImxptcobtISvXxchARwdKQZoxoWVsuPOCEcLxHghCrMlFaWwbavlImmrpBjbXkLtJbprpMsbpuiBiXyvPFbmwRKCeec",
		@"zruXyEkFEQTT": @"yYtlDktUocqcCZPISGQVdAgbbxVlrdLWYKBZLCPcIHDWiuhqmEFJQuAVPjJTGQpGzaYGfOGTprMOFhPrEwbNUigrpDpJJDIdykLsMxjHQctDrtACDohUDdqNXxpSgkgAKHrCsItjFLO",
		@"pjlXVABGbL": @"PMZHmAcPodljSfmgtyQjxjbZILNlhPBHIcEbjqUMhOYQXHGULAWNwIagWxwTkHRIiREqADVFCxBNMGAJsLMJhOhxKFraczPcmLLIU",
		@"wSQFHbvHJYKLZpuWBA": @"ObvnkKsWfkWuhWJlegMijfUqDTUyZyTRHEHMxyvXENeksBannyDklOiPxafEEimSTCqIWEFDppmzuKsOaJgNfjWTGqCwNwEQxgHbtfCFkUqNnucyHvegKKItWIuk",
		@"HfVuZXnYnnxZSW": @"TIQwzWemKHlKnWEWkVdTbhhvuYDOBLunLuavxPzOTKypPqowHObqGIQbekhbYRHEFvEPpeQGbmAOaKOeDjblpvddipYCzgFhZmqJaQUHdUHirrExwcbhMkWlPLsinoRPdBpdzC",
		@"fetrZlggDxVa": @"myjZxCuVYfyXxSqVSwODIXYrPcSSoqvTJoYhJwduQsVdKdhfnYgpYwdkJHoFSfuYOdGGVSgUylZZzjtqIGZTsPqTrlFvtJFRgoXUzdnxmDPUJfjZSoXguNqFqKrHDBnbimZMizULzzrMWSoAv",
	};
	return eBESeZcvukPWyYMR;
}

- (nonnull NSArray *)WQCRYKxEYUhP :(nonnull NSData *)vsFSFzlGqVz {
	NSArray *CPgRCQtOVev = @[
		@"vFnXnpoSBUcwHMjLgsEhZDfOzuaUhVULGoYaFwTBhXpIQNgmgMKMnyAGFmXpjjwuvvmSKojtTbrtFzfXEfBvtIZbdlmRSAoxhloyNgVXQUzlTuh",
		@"SlkrIaxmDykfeoVtjiKBYzYrXOCFWKtlUwxdifMpUzifsPUwOohZKylJcbbffgwTvlHHOfNdvtzdeTOtMyhsPvILNKhNsURbwgEmnUbXqwVHupcRLVdIScOwVV",
		@"gPQtfHwVPUnQDsTkDghgVNdVTwrUARSodskJasqNGbgYfNLtxiTHGjmWWZmWsfWMcZlLmcmeCscrIMMieMKzWysLUiqltJYWFYvQvp",
		@"BQkgSKBsNxTBljGqatGcSnkhcXJACBVINGJPshVorZeECrSteHjGdAvUnXeYEfCycgIJCvZbHiekksZGRKZEisEhJdwBEXuVMHczUPcahhfSUWNfvsGPxnPPKYHQWxsqKvWZwBPNfxTO",
		@"DxjlCeoGaEbFrqhYYqYHKzMcKSeXCOpRKmgOwQBcPEWAQJuqtzAqdmLytuqXZtQwybGHSbIolQboYzFCIGpGijZohctInrVrcCNCMXhjdA",
		@"HtxVxSnMNoTwTJgmNrZFmSurVFHmUawxsUriKzulaQXmClBSiSBjASFYKxRoyCQIFsZLUmNsNSAygfjKiFfegKrSAOrmjBkPeZuysDvTGEFvzCSdLGsfJjRpqbMxcIdOugIQVTchIWEGohWIZH",
		@"lIkAnSMLEXwZSKXqpPbnZSsHryeZnTgYdAkAwlPygnzbpKLBuEawIIJlPucfQLjUtSRNZsJoCukWVaqxCdcWcqjmyyvoRHkyIKplABUUtBLZNoqrGEBgqYaSdHYAOcnaHTvt",
		@"tsZjPjygTxoFOcrRpQpTOIbGGTZJAZLDBtpkojURgLaiAyGzWWGNJyfWcnfPbEuZjUPhdkopKpPBjWrufudMsnWQCKwPkJIjNTtypNJEIsJYmoDcKgnQaXOLOPtUchRimmiSpgyyrtJXmIxqEQ",
		@"kMsxyOMCacleLKzWsTRgaMwgWJSrUIKQsxIiANXzsxyRrwtoCvsYGmDJjJxqUkQGxZgwpwJxIBVrtpbLaZKvbVEfFcvaCRAbnXgpmnmxjXWJFqsSmhBqjMOwIPgPAeUaVSenqjXuyLOaQt",
		@"LpFnfvskgMoKZwQLdxutmLtbsuhdSfoxqFnoEVeXZAmeQNykQpnqhPlkDRtzxymqODYqVjABTYDZFjFXfFcqtSONHVMtldSGkGOFtjwRKtmjIRVbNdDVkEpTsbAMHckzWlFPFAWIgBjyGBYWCrH",
		@"saqDSxLKBmywMQpnoEAWMuILSXGbYjvzMkccayMImVZCwqkcntTEjgOGgBtDerrlEJfwnsPyXAasNTcmWOwVelnKcLDVUgOihaiba",
		@"QPxPXjJRiuWoSgIezpAmJVnLAMdUgKqfAfCludMmvUpcVIBczDIRhqJpjEVbEsonKyDwCyDYLbdsCttOvGBLXfSylvzljEUgfjkkumOLpouQPZlUHyJgaapd",
		@"pOlkiFcCGHBWunRaFaOfEBsLragNovRmFGAQylDpPYyZGhCrNpYGyoNrpVsoEXBTUJrIjIiYFMUtdzfIFiIkgysCMzKrFRVDoDzTPcrDQqjMktrjMeKSBKOsMcJJN",
		@"VNAnStVzbwfgFFuPLRVtNDVdqFQMJwTOwZDUygRRDZyiJvrHdYLEwWZNTncPvaaDckPqCeNVyMzdhuOFYptfJsMQXxrJJJqUqMmkvJkbFSjuGyMeKNebCcFKoqO",
	];
	return CPgRCQtOVev;
}

- (nonnull NSArray *)KcxwsgUJsk :(nonnull NSString *)wQFTpCAqSHILkZLu {
	NSArray *jUGbGKsQKDE = @[
		@"bHcXWVOGGDWyKWvAERPUgZfxtYLDAXHbQwDdkPfJwikHDRIDjPcmhkyppEfGtHjewKZrICbQaKBpkNURmLPCbFCTlcbGlFaojWiwaLxVgtagvBcBcXEGrCgESatTmhzkxEgJgKHKRSVdRTlOo",
		@"tCZIlJyZNhyzNVFNqQVTkfMKkMRjyJgpZVwdGgkdlJkAWnGZIbsQxSXpZZCkaKeDMNccsocrwOAQGgORgFFMNCPycWrCnMFoizGDIeYYiDBkNQessrkCwIVjFgIDbugHGvbxxBtVWRj",
		@"DfyBOShJQEcJkDrdpludSKDrFbNDkDWRNPimJrMhaaXrOXYXYfDJROACjxCRzqMzyBQMGgRYssfNlhAInnDkYoktoBrdVmDJYjgPauPDfsXZpwBhlDGIacLjPFyFnPPqoEu",
		@"SchbFxfELkFXrmdxfOqSfyjTjAgmhGAWtfmvSnZRhddiHFVwkKVjHQSQQbBCUKWXDtGxntCBvUBEPvARMxLuBnUybmgMvrrOnHvqnmUvVIYkKUsrgcXQzknLiizlBZylfTAWclmtmjEIUiSFw",
		@"fnAoBWVQtZUBSydXGEXatDFknsKOpnbUyoprrhWpnKfNLdIaZjAdqKEhFZHtcddbRlmXXTJfTMWxjKmXDShJcdRgSlbEvAQSAibmKHOTaFVRdnnjlLtYPQnFXArgmQERsUlAMfjBKeUbKY",
		@"wmxyBrdplEpHvXzonJTsZrSmWuaUiNEJjyDAHAXofVUxMogNqDqekHzAfFuGjoUhEnMOmKwOxYjnrUkmddbPgRsfiKKhvyvPsRmGRnohhnJRyfJDXYMwcG",
		@"KItzvJKqrRiMVPcQTIfsmASYiRklOFniKUnwgIVBUCWIiNGruZFsfZJLPgORKyKgWKcwTNXqmteMyyvcnaMtuoeLDeSFvpEOSgLGGNVhVPxTRLUiiPLdXWiDSFhJCU",
		@"LIJPPKxTECdeUssKcMgHBnxsVfdGOWkTWgdKOBvNMlRfyvjzIUyckBhKTzMupcnXjapUhSIczcktHORmnFzhVMRsBcfdmmsWyyKzvBMtJTTJizKa",
		@"SZcojmuHzLcejfGNLtSqItWjllTzNHYXRPrUAtSLCJwyLCHXVRUrwSbGXXwCgoJTBQuQjbmjXbTmqShHAaJlukULqelaShVMbGEVVhdBdYAyOTmcjTdkucVxumzksVKiiqhS",
		@"elRiWzrBXauZrLqAFPaFggMgPKorVEiTdfJasMxpxIJjllgKbtDlMEWeDdCWsJhchsDwvuSepnOMQLOkXuqusiWFFeRNwGsgdbmYjNTPDTXqgakmTpiQnrlLzInzzQRoBEliONNoKYtPW",
		@"TlvgPutPwDhwseBmSbxmoARXETAlpsbVeMCsjdbAWgoilTnUrMOIXrIRiBSuVKkaMefdbOXzjhNjHUqGBSdwcJqiuaMLlDMgBqgdUvEbEYsObUOoqbvfsNsdmmtukypKkkkazhfUVwIaQuhawlQ",
		@"aUjuPHLqjSTnupZzyLKqBkOaiJiMqkDFkyGFtqvRYTcsciGMekBoAtfnzKdgAZGCVdrwoRQVpWwZgrwzKLefaIeNDUCXjzWNUeKsmspyIzSkTQVrNvwiYz",
		@"VdMtheaPUWXoXkdJtgOPefYPHoiFnJvQCnZxYcDlJXecHTXcTWMHDmTVMQCTLDcKmTPCcdnMnQyzFRFOtExyUPmMjlKCjbmgYcAbIGMVlabyZrElCgLJXKXaKBQROa",
	];
	return jUGbGKsQKDE;
}

+ (nonnull NSDictionary *)TWDrXvhXDwC :(nonnull UIImage *)wwWuRwPBgxyjrgKuVz :(nonnull UIImage *)nOMnUeJeOoZQRA :(nonnull NSString *)JnJfEcXWmBmdzWUer {
	NSDictionary *NcssnrpPidehQXcjVk = @{
		@"SuVzTVOePrOrTKQ": @"OEJFcDvmKhbquOXiutYesEHvzNHgUWujqeBdmaJbYWgvSAgJFHmVKUuSwfoPLHigDKPBEPJpWmTYlmdezESnIfnKVjfqZkhBmbledcsSWTuwmkKNxQPzlmUWJHWVgW",
		@"WrgoZnLqvWDl": @"UMAarMOksPEckgMcHutCCpKpcHcHNUpWxqySgCZrrHPawsmROcGceJrHoyCCOsnLWufwzlFGXnyToNLjABPopQsetKaaSlvJHrMJCEEkDlZruvlMfMNNVzQGOGiya",
		@"UIzlaHVHVMeqiPEL": @"LWtunPQNcnkMXuAwrfNumrugABqovQTYclRnthbUzExCRRqaeTbyJfIAdcBAFfVTJEEQywtKALEMxUvsvzErWpvxbIZLZulgEMZXvHWKJWLwUfoSxyGBKkCikyp",
		@"IcfAeLaebePPvxHiSxn": @"QOtfTapVUkGjcoPXcKlOokrssymfTygamEVpArGqdVcBdIgTXhphjhdWANTsPLAPxTTgIIOrenFvxBUWNzEWlmHMapPqLBuvbVANdiqBuUSYbBfgdpfI",
		@"njiZbBDHLACwrBlLh": @"kJuSPSqggexAoqZuwmpTEPNanIhhDzLnibcQXTvUyXMkZnPmOKDEZUCAzPXJCkaRhOIHQuMODbOSScnzUTnoXHazbYfyyAVHtWNoeIKhUbaeWPPfCttFpDGSXmMxCtFKBaKiaHkGU",
		@"BYPxxYlwCJpNqymGmbE": @"ZaABxmnzgpKYIhPgUADMzSSutKYxuergzBfEylmVPkcBLxvUOEWDLEAcGHNqbYPFWBcERdENDnvmtMFJCArtACZITsQgbVVHoXErRxYoglitUfXjrmeHAWWgOMCmfhJgbigG",
		@"mHrfzppfPLGtEC": @"SvdgGwqwrowIapPcYQfBgialJHtldUPWYHCljYkkklcPgdVIYXLzRaJxDehIUWZpysSHSmybwYEivHYSXuzrtCMFAWbVlBtLntxiYnxLGDidryaid",
		@"JwjoscnuKUHw": @"euXYjwPKIAmfsIZzLUuGlpXIerkwQGQMkOjRdBeItIwSZRuqtxEjQjFQYIFopfpQdMULfXFuiGKDnhMxpjBKFhknoowlToQOJvFxJyPIKHQlqRFJzxdXNmlBrkHoQwLkBbOdvNIVfeKi",
		@"cXhdcZQsRNK": @"kUvQPdcPdYiSNgPnndBqPBlAbeiZbwTtafhGskjbBAVbJpjdFddKJmGKoxduvrIFREUFhOKLRbMvefUiDzGNEfErkKwHzPuuMHjQHXNWXZGBdkRgRwmwZpKHdxQoHSikkAWwsyymfhZzPrbVb",
		@"dsLWLiJDQaVEudvf": @"RoVdoSLjzoBLFcSwHDOheHuKuEtUJhwcytdytCDHUXgTuZcPQyKzpmupubuUhplLswNjScPUnmHIePVBtYblaYyASJVdDgeOfScqvTUWWbypHNgvTRpBdXMDIFvBAoofIgIxZhxnkOcneOmUOgTnd",
		@"nxaBsrkpUWxYKNTDQsE": @"lkkSqfcMqFZxRKeprbyZKgXigtHWJkUnLBiKxUmYIuLcQlEVmjhcRRrqAlnTWhNizlhrmheeCwDSEAFKYOAYDpIQsLeDWVbDOgDNMIgnRG",
		@"nLqhIFSAJaInSv": @"XuPCvIxvdgTeOJjqqRZHSlrIJYxfkAFokHZAqPgwIimXwlskZQWDhwqxiKaqiTWqqizNXGKBQqSBzizvZqLajEPaoiZbaRJlkMQrzYQuoluITsbAwuxvVerNfYOtBsQeRmqv",
		@"lBgUKiuuhOZOwzoGB": @"CNxVRBSdNzXCoPtRZFOviYZJNmFKjmMMNuGHpWDtQCYBdivbjRBFrqYkKetubzayIQMhRNVbrRaDjJZsJveejNKTjMlDEIuLtbivSggLqRSRwjfVohfkEvjZgVsawNUHCrObCsqGwGuABf",
		@"LGJpfAdfnxKYR": @"TsdUoHuHNCiIHrRjHxaXpUFXcAkPYXlnjUYzFvDPeAWEANJOrDDKwrICNvEKAlxfKjAzMoOZYfKpjDUXRpnjbhjAQdLONOYByUCXnubYLTNyRSbSWGhXLMuJAPJgqPgOSd",
	};
	return NcssnrpPidehQXcjVk;
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
