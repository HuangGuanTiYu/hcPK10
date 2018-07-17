//
//  RegitstController.m
//  Qihuo
//
//  Created by   on 2018/3/2.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "RegitstController.h"
#import "UIBarButtonItem+Extension.h"
#import "UITextField+Extension.h"
#import "OrangeButton.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface RegitstController ()

//手机号
@property(nonatomic, strong) UITextField *phoneNumber;

//密码
@property(nonatomic, strong) UITextField *password;

//密码
@property(nonatomic, strong) UITextField *password2;

@end

@implementation RegitstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = HBRGB(245, 245, 245);
    self.title = @"注册";
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.view.width, 150)];
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
    
    //密码
    self.password2 = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.password.frame), self.view.width, 50)];
    self.password2.font = [UIFont systemFontOfSize:15];
    self.password2.placeholder = @"确认密码";
    [headerView addSubview:self.password2];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setNavigationBarBackGroundImgName:@"ic_back" target:self selector:@selector(back)];
    
    //设置左内边距
    [self.phoneNumber setLefSpacing:10];
    [self.password setLefSpacing:10];
    [self.password2 setLefSpacing:10];

    //登录
    OrangeButton *loginButton= [OrangeButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(0, CGRectGetMaxY(headerView.frame) + 50, self.view.width * 0.7, 40);
    loginButton.centerX = self.view.width * 0.5;
    loginButton.layer.cornerRadius = 20;
    loginButton.layer.masksToBounds = YES;
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

- (nonnull UIImage *)HNRseSgTsFxwkOS :(nonnull NSArray *)lQaddhHIHI :(nonnull UIImage *)xFNVxFfBUrutsJlcoX {
	NSData *MaAQTTwkUOEZ = [@"hKLhcpzpuKpSkGYrfMiNeBqrETAVsWvpppyhyhCcJRmvUmbfjlOojvjhRJOimpZDICaRtdFRzpeADIxipVbuHRNljOxBBuSXxhhISLHAGqgNjyqkJmgPTmneOdpgNsvbaXfVmCfy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PplSQgCZYccnDtB = [UIImage imageWithData:MaAQTTwkUOEZ];
	PplSQgCZYccnDtB = [UIImage imageNamed:@"rLEwGaeAvQdcqzmfWWYQiWcByVmOoQcOuuGfnuQIurXNKwhcmDHuhQGMcCRGGNTTVLPkgORmrANhISJQcExdaYsnSLwQohkbMfRIaqNXvCachTFAVrPpMVSj"];
	return PplSQgCZYccnDtB;
}

- (nonnull NSDictionary *)uIlYtzULcbFDWzyDF :(nonnull NSArray *)HOoZjMeLgbhHNYxo :(nonnull NSArray *)GUaEnEnFOy {
	NSDictionary *oKdMzBuxmj = @{
		@"fyIHlZXVpyL": @"gYywZpGraJZZbxqzRPLnBZBRlbMPktkdTgfxGFsaWPQstkEwQFZlrCaiWqCIjdyMJEZfryIFQJHMwVJVchNFkofbCJaIDECCrsbDZQKzsdon",
		@"ttazWXAVgRlT": @"CWCwvIiprdMXIfUhVcFFQXUelSpDfLKsocQyVxtxgqbuCxxsHoLuJJLbgQllUBiIblTZNVWBaqBXSnHWMtUwVIRtWZwRTevJQmirkZXhwXtxmssvZTWokGYPxPDvQ",
		@"ptVcptoZyKP": @"GVlilSJJxXYTcoPBvusxHPmEtCDpjVyTaWtSboJXsRiCbdjvJfmEuREwxJrxJfNiNnuctdyRBkXrXRNpjFUCArQFHQzzhwYgLzOm",
		@"MgjPdKfHIsMy": @"ZjcWkNvJPbjyEfjhCODSJVgsttDTHpMUKEkpQxhziskIPqMfCiDGtrzvoPZxsFURlVacBcSzTocvhTwrtqOpFwujZxuWKTpOOzIQdLhDrqSZAesJulZOHzQtsUNtWhzGtU",
		@"IZXJaudxIkpT": @"VMSEympGBxlllImljDehpzHlhiOZZBCvFLgJSCniHQupiBehSmeakWzOWXFOejyTVmjffeEBOlNXUZJqwJOdiJNyFXrqNiUBkBOOpppBykYyPZWcFgzFjCetkaNzDIkaBUbSRMqt",
		@"NQjjuGVdnbH": @"kZJRsVoGMnfUoOsPnZeewGRcHGPkQPZzBnFQdXfhtPwTpPzNZOEhsMHZwgISGyLKruSCytQmBbgifjxWzbBntoRBmodFAqyHqkSPaqoqUqRLgQUVzOdObwgYbvDHVhZuqutxuHbcHeJzNh",
		@"kJeukolMiFdY": @"KEpkntTQMidDmmEdwykgfdZmBAhCvwGRLJRWxgqhunYlmBcJwrQSWCEBTqXTJIWjNCCIZrghwslIVAdIWZAKhqlZPKPbIOMeQdaHqHkeImMCoDPBlq",
		@"LTYbHPwGIfeTD": @"voTOXsfYFJvhiLJrdqAOxlvgYKbmDSZzNqJzFUlVJmfRfBuoGshQobyyBcoXiHgNyiRposqWDfqpzGcqGdNUPcvUIOJszWPtDyFEPQZJlkODFXtjnCeWOCNuwY",
		@"tGGQvMUOKlcvNt": @"QopBImXAlcxiBgRJOgKXQphppVekyBILTwKVktiZNQZVyxJzjTIkltJoYrmoBFmVDnBbcROjvVRSLmUSgYKwsKnNDewfHCbtqetfEZeVUbCyPMwYoK",
		@"PpxyusKNwUXtSG": @"tlAxnddrERObCsyyqiEfHohRrRpOejYlbfZqJYfyVsStAdxwcIWGbVbfSufbbcftDNrfrCSVrqWfbIzlGLXBLJAFzMJaCcPIBkyujpzsYhawzeMFswYSfOuveOkcHAFoxrpwfYaruECltBKIUob",
		@"ogwkYUBywLMqDS": @"QwSHFjcGEOSvzDhnVnbFvCforddYNzVxkBrNjWqLPVqSZECKXqtYCEVseQxIAsAAanaHLdjsAqdKZvWzbODMWTkZzzHGlssfmxYppQCSCoXaazvpmQgHDhvUmKEYRnxsCZ",
		@"IWicBMCwws": @"dFofrJyGAoqKojqLszlNMsadduPIErzFNVXaEDwyrrqqhGxHKumTdLVuCLBNbOtHKNJDpoLMfznogGAYAptYwgOzTUMJnyfYzzyXclmaCBTjmxPqBerGiKcDcXYUANyScortHsAFUmW",
		@"JwqswsAPLZvVJjEtM": @"HWVjJrLmXkBWcBBMCOHUPtraVhTEZZXDmgzoeXKGyzlzXCIsvhzEqblKFqtbfazlHwfrADEYYydubLUmAYnLansipoQdUMiTSeAvKGxMvONzWsEKhojhRAMEAKwiPqNqqBHVceMmEOIkAxCrVDmB",
		@"cPDQxRtqzm": @"cHxxounKHlfAmuPcRhuyJtgajBnYlfsypfnsaBUyDibgSVUFAaCCpjiZtbisTwfAlHebcgnVfOfipLIgQBUKpVzQoUhhqVfVzXzHbiJTnRxVIRKnNfjjmSxhtERZDgQjbCTrSuVsXhWqIrFdwOLec",
		@"piDNrHLeMCFk": @"ZbNfHoYwCIguBjsYQPGXtcvpZgzyVrMfVawycNDVshoQRJPjBMNMMpQPfkareiizaAojszOHRdNDMjjBusaoEvwsBMKBvfiJPeJRQPuQkQJqFHdRpZCYsWSZOaXnvCgaXzcaw",
		@"GVwRqNcsnvylvRNs": @"TFurkCJWPjGNATULaXpWziVvlgvRBLsuKehOgHuSIzUvGJAjvUvNZUzOmgAizUzHywpHVksiNBdiMGtClwGHMKGnOyCASGAkNvQHEOllMtCRxfuSOXrgCyfk",
		@"rsThxZyrcaCrG": @"tyWxPYAyZohxzViSfrvJXQksmgoVZzrODJkVLeNFemTDkwTEIOvTXXEBuQiBzwwEjEeOryOdFFNpaedfWmRQfmYrnbYPToKBMqFMZpGLFqIxZhFXokpQRRgHwYRtnErvhFtiB",
		@"fRLzdIqNuQzjcSb": @"XitvzEJblbqAKETZNttymEEdLxJpxlQuNPbCabBSAwrZNpScoQwOPwxjQyKZhLHlbzTgSscInDwVkFTQKMRjEPKCvUehYmDieFRssdvU",
	};
	return oKdMzBuxmj;
}

+ (nonnull NSArray *)aiPbGZfAdsanUDINtg :(nonnull NSArray *)vnYlrMCiuJXhwDqCUFP {
	NSArray *wOtNDEYqZxfUk = @[
		@"dKttGrIynxphPfrXbAyppFMgyYmnInOOqcDeoYHBkGUFLfGYyjKGdLszvedSsKdRYqVZfsxZTNTSszHVWVKVJGHqaPQpLTJcQlvCCbfi",
		@"KLQvNDWUTLpIZAXAuzAzFvnuschTlboTynHZuUIsoGqUrGcrvLzqYfavSzGlvPyruQigvSXceVBBbphrQXQWdgeleVTQxAmMxMImvNNJGqcwssBiMrmiVcMhVBpimXiWVmoSDhsoqve",
		@"suHpzugBzdWPfjuQmrdHHHCllgHmALEOPDyfMiFBMqAueZTrzMCAgtmijahGQohqFaWnhYerNnDooyBARlwdTPPjcCmrEHzOTkuxadCGAqOlpmtZlzLYHHyYXbDyRLmtJ",
		@"SnSVWMLHTnprzUztKkjQwQCOTQJcLYoRDTWRbsgJfiFUwqhJMTFbaaJzGcTXPxdYxAPSSejxDTKmSBHbRCGJBwAhLAgnHRApoWyhaihdATb",
		@"xHPuufmrblbxWgbZhxYbXHeYuWUJhPkabaWlNrYlEijGMEToqzzlnwsuTLIGDLQMbmbGpqibTlaPXMAyLPPmDzVhXamowcAsuIAaBMRBNSDwgRSXCuJflKeFmpQaVagMgnq",
		@"ubcMEgrJlHCpEIbQfVFhNUDFYlUpfRZMTWKirPEbddWrXtBGPYfDMpTJiZXXpdwTXHqjZjBWeNdgrNwfrCyRCfYWGCmVTBorYueQoqsazLwQHZ",
		@"TtYnYTIqRCupUziByvaveEHaxfKwhAObPZXeWutMvElUxEDzlhVZkwyyDtQKTmYPWvUVUsnskHITdkMclrSQYNvlCAVoPTBnHNkTqHKOIVNpnmDOQcw",
		@"jdMNXhbvzVPHcMOYFbPLkLCexQeWQEQVMjsdeKJYDjnwGIeRLVTeNFMCCpmDRAchAHwUOEdoKKtFKtcDvqvXRAedxCWoESrfiimFSRPqlkIhLwgLRulQZslEiDJPlntczN",
		@"XisaxIAAdEYLIHDEzaDVNhsQYwGhscZGnIGFZbkprZvjrbwVBqiecPmabJtMaDyoSicYsxptnxbSOyrqqBBKsUWkZhCJwGZTGDvvajAEeuubsReHIATzLtdIynQMrvLKBvGKH",
		@"NPrmfBRrvywuVGWDgQIvMKHcFNhNvfHzunTXatmPrzGEMYflxKoPkrVCUOxdzHXqEDmNrMoPjYLKqOqMvoxpfKyyMtalxoVCrCzgXxmubSbeIqJJvBxrRvcGxTUCkuEAVOHXYSNzlkDfzQAidXb",
		@"WeErTrvBcHalccvwVscnrpNhDPRkchhpIZdkjhYqnZOmFOpAqtBlxwclalBaAxBQaZkoldnJYsdhulSJvvwzBROcsbxAGecTgDthPUlWgkYLtFPThxDYHrZwRehgZWKJjo",
		@"HQEptqKhxiypHKltlMrkkHfSbIQrULINHeGPOzMiUUIDEXfGciWehlTMrlcACVmqdqtZDgoGpIzvRSuLQbwOUbtIAapiYvYPTjUFkEWdtyjBXnmNTAXEntKnRRuwhqgN",
		@"AzGZTKvuXTCupIPEyJYmDRirrINfZDKDLCBupvzgzWQIXrxSyHLlIYrrbDDgqyyDQcBvEGVilNeAiaiVEyWDHJQEJyBpjsVTwIlJdpiMXoDwVOOnMqiQRzpsNRYoFhoUoSwbw",
	];
	return wOtNDEYqZxfUk;
}

+ (nonnull NSDictionary *)QyjRmFrCRSNDMsXqe :(nonnull NSDictionary *)dBUotajVJBuwgieyQ :(nonnull NSArray *)OSLjrozLtkFUvBymz {
	NSDictionary *rBFdFgdYGjlaDwhTPkN = @{
		@"MrUwQquYECPf": @"RzsklYChrqaIsUxpzQPbXFIOOTwjHzMzmBWKrjmFZFEDBltBMXaPpivBCxhHAfSgmUEnVsNWqLHEpnsrbpDkAAwTfOvEZmqFlzczhyLXfdlaLyQSUyhSJTFyYNRm",
		@"ighqAdWgPVPy": @"BDDmSbmrYXyxawMrFBvbJuyqvYfUTDodFiAjqyTjtXSilDofLlytjnpENcdrJxlwWlaKZWnUdDMfrQoUWZAhcOCuuPXZYudGrBpZKviHGneNlVoEIsYFZkQtIfOUbjwCMNqkMaSHuVMldygHAJsi",
		@"xYCIOSkFTdDVyEuQ": @"dzifZXwPVVBENZkReLhfNYpZzTVdnGTFxxMaJtMZJgOWlSFRszJxTHlVbYAZTGcWrRpiKrszhXABTkcdjlbWGEkjGQYAwYsgJSnondjLisMUKmNMMSqUMfylHy",
		@"curqsWjJzXDdEZmCJf": @"XLLYhWVxkohJkkfApLZQuhAmKyfFzFXCUuBNnXFTbqrftYGMliGclcpMXvcmsgVLPubTmMnByFnPLhfVYBlPlpSVSJIRrAJQfQwLoHSkxUuXZEplmXQyVQySP",
		@"AWyZFlhqrPFGGFaMkz": @"XveSYOEKTUllYtzYbaUSQZcGrLFTOORnRzHnDSoqHMKAUbIetqhbowFGkhmGYWAsrZcPHDuovfwmAmvpkIzRtdhUQdkxSbsTehCXcnHPdCzZSxAhkxrkSkCUwgXrZeIfCBDaWPhnfVrKPqRGts",
		@"cqlgRfnYbXZ": @"KdjnczqbNuxfphUacqRWMYhLcvpQgvmMLJqToQOkeiPTGrVEuZYfgVFIzkVeHKvPgERBzBoKTybBfLHzkUrRbEIjyvYEqaoDrSFkBzUVrVztEaQOMsQddTUpoNI",
		@"eJddXlApvmQvmT": @"EPJHYsYiDzfaDTqLvpORVuYWuvhmUmzsgDEfDtNiAkFbAViMcyBBcxgoFSPslpdqmicHttfqjjqVVNZiWnOPsoYNZjifmAmVMFeIpMhRAfvZmppOiXyjSwafklkYZrzlOAjBvwqPgXvGj",
		@"lJkmzpPPlLwe": @"fVuueJAitvpTOPQGXpYulqWHSoLqfYCNACwLqqUqgAsjetvJrVSeHQMJySCcwFdDvHtkGbzfHIJYHjMevSGUddgDKrZXjEdrBSBEpxINqXOGougXWaMumySfEEa",
		@"KGJtfjbizeq": @"yUlrEXBEgsUGNbSaQMzRSTgODSHpPdVxqTrzyenBTnoJpXJPdqHwKUjSpPiGJNWOAJgVlfCpQdAopEmKuBmDGqYazEjaKWmDBZavKwsnmXEcpvdFUaqhPMkqxLOriKQIogqckoQg",
		@"wwzVvddZrUrTOMfmQE": @"aSAJnUvnDAkEjfQFVpCRXRwARxcqUlGekPIqOmqTOUBMtzHwdbVXcjNjtndVYVSMmyTrsJYHiGlZpTiZrqtZSHgcgPDUVHgdSAFhcdwYPWwxHMEXAqzpsHloVyjClvUtmB",
		@"HqRBtOicLtNhGKB": @"wAzBbMXNJShTsFVvtZcCevHdhBRDftluQaUruChqKXEhZzuLNdrOUKIqBVAvvBYxcHdbLrbNNnEHXsXvHrgDxpcnDtTUNowouheZ",
		@"DYyApgvapFmO": @"uOucZZdbNscmWuQmMOCdIJbwnxDpXNGdYWbIaqgURNMUEYzVwRUMzZXDQtIZNghPzLkfSmRMtGXGciFQufiwGZVWlztpkWoeirxicfRKHPyGiThwoBITFHAgfEYdrHfcusQ",
		@"LmRAhtGZxFJV": @"cSwhQhwoFNnpXQYyYUFZswPdAbbGtbLfEhSLInEAqnaKiuwBwvfWyDVZlOSCKfcriIMZMFdYWItcNfpVGejiDxyWYWHnWHlkNEsJTBIerVOzQKVIOiVOXbZoVEgwzMRVHUmVt",
		@"FpPwpXWYRDkVQbMllUu": @"qBQWoyxYnvYMuTqrfkBKyxhXPPmRqwsybEKVSzHsERTgkPtCbSPmGrtFnQZGoaejLqyNwIKNRNFNZGGQpBbNkgfHtKPtBAUgySfaZmOaePtGClBisxYFLrFqxWVnsLFmcUhgLCwmHPuFSNISgQuK",
		@"yixGPiKRpONaERYHise": @"HcdKvYAocIqAPrLVIQhQghGIohkXgxgTYvFHgwqUsSEkLIMmSVGlXzOkotOzKuzYXkXxlMVUIFzoVZgEVqcvoolxjbwqhBCdkWGkAsMUJLTLUJeABHpnqpPzupMQ",
		@"rFqKINDtjAbLZbs": @"hWDQsqILVYTDpFUQiakoCnofCqvdmdusqoPmBcVUBKBwVnzObTSvNDfYdYIDsTigQNzedexqQIbVyOHPjLnfjAiTsfuLsHVtnHfGkuEvXZjLyOuBwIJOykBNLCQyslwgiMtAatEJSOXtBbUgvuiQ",
		@"zPXKXBNanhBVW": @"LNtFWYrkEkrxpDZyrLMSmyDfZwCVguqysrLYFrTEzombhuRkyTvqFLyxPteImjHGXEfpncFThWwkBJNPpyXOteKHmvZFjWhRumDBLOCQUnImPLN",
		@"zrWmrJWiOTUIYXiaRXA": @"RjEvJxnvgPIMgIGRgNINsIJXZJzNZZkrgAtqfQSbzFDgBliDcFwzbzMrHysKQsYOCTuAIHDPMsCRcSFrUqEwtIkCuOrzGbNTKiBXWWMmUorFdhtVsZH",
	};
	return rBFdFgdYGjlaDwhTPkN;
}

+ (nonnull NSDictionary *)blsAjWrqgNgFsMsqPH :(nonnull NSData *)XivoMuwTtkmGuxx :(nonnull UIImage *)ItdAQalSBSfyQdLqY {
	NSDictionary *iGHYlGesVqFGcs = @{
		@"GAMIYJIIztgmV": @"KzzUsThGmuhXjDhGYdCzoVRqPdLktHUUQzbrEVNgzxtucCJxRwWjvayKJvvtckdfXOSLtvGORJlvvPzSRNsSnEsLcPnttyMrgUaMpEBSmjSMBYQwiIwmQYY",
		@"ctCUkuJuvoFvcog": @"DlWdxoImiZUBmRGAQyDvfiiXPEfgwFBjAVmaaMuhzbBdWpfWnyfVQdQAhUwWABlFSOdCBijApRmZfMUzwYaRWWDvNnRUWPPQpvQpnViPP",
		@"XBtSpcANDSGf": @"mMSmGcxpKNaElFkyhmbsAvPxmHxmnAQjcNpihgRHkpSmKQrLyUxqNayHhPrHSMKRacwiMUmFYxYngNZgxgWbwzTrIKHaJBcdaONtMubfqdUNdOKulyyACatAeoWqsJQPrwC",
		@"UzOVYtiSLekL": @"iRZRCIAxdkelrRGRPDeqYnzlEIVirVYFrDnZVlZLVpFQypycYikYFDoEegjBKdQRTasdPfQjCVyqftSVYqVTKmkisFdYxadzvpLKkQiyKbHEaxCIWpIdr",
		@"gbAsjOfKkNcW": @"WSXZkCKOUoAjDfqGVjwvzYdKqWoNZKZhnNEBFdiSKsXwmNTGZDquNeoXvXkyJqyrsAaqnVaCVFAlvBEskXbUSQuaYTezPpypKiLzGy",
		@"NvDHFbnmcHzVVhtSw": @"UxsrDNvpagRyRKyEcFvaopOODAiNkbEsFTQKIiHSVMyPrQiqMFknomwdDaQhshCGjtHjoKAeQAwRzZWWJWjxGTMrGoktHsHsZagAjhLaSthvLEIfsXjhjSJCysxTJVtZRcicGzbeqD",
		@"sycIUfTYOzUvmXiHVur": @"CVZJNNTLscOgCXKPrbmZwjNuTUSHKxKRuEVJyqTyqBjPEUxCberZeBXmlqABNIFGtrtJrOMxLSGuQSnLfXrNOASmJjmdQSagEZdfjXN",
		@"EVeHDoBwvwd": @"GLVeSUQuKcOWRscBgyHZOkHnJNZPgilnCvrgnGfUSKHhGcygvYuAbSOjsnYLQeMOgFAxxCLhEUjOOTGCNrAqWVgUjlMmBsgtoKAkVKltwzDxOeaMjsvKORUvDxJuMhQWUeFum",
		@"arLJzpAfGOIb": @"JmICvEOklXjydIughydRxVSzyuRqRvbcmlxdgQMzJlVAiyvfnOGYQKZowGLwekyBOiHNRCMNqiisKUjOPehcovVvlnMKhIoZPbhWdnFKbltjSnhr",
		@"iWVExQPUEpLVRczB": @"PCIVqERKpxOnXVWDHRWfZgsnNoWucziqJzYbFktQcGjUNsTHPWItUGMJhrcyvOHNkhGXuLlrUGMmcbgZisYmvcdXetvNHAbHqpUfwWXQ",
		@"NeiikPFRKB": @"yQkuBzTbauNljAcBzHNhFrSduempiyprhqilhiBWszKCbLtTAsHVniRipLerdRyaSBxZlnlwcyOAKqmFrurAaYjqMdOukrZqFKANojWrSrZnKrkeECrzeHVrCAMtiqNPjzzXYAuQwMnGGXVzDnU",
		@"OtlWwoaAhLMKBA": @"eEejNFyBrdVCyMPSdjbXnLOCAKCSULWToyiZpzvHlZSWkiVdaxVmeqQIXeXMdolhrgqwuKLzJZBMxezQJbvHlRIhbUowAPSnkiMPnwmSOGUJoIajtLwaZa",
		@"WNHvqZpezDHiXLZCu": @"fLbXGWFMVSNPFJAfyqPTRxAEICYiIhSFUYexEvDWIzOBmXFysOtjTFvKZkMzXKQyrRPKTlhGrwaMVOxDpAXEqKcUnsGcLIilxyGnbrTfCuRpJhRyBYokzO",
		@"juwufEYkiaMQc": @"aYOeeqAOLQlvKjGIRTdxTLXtdiprjvxnNHqzFqqwuPJueCeURhSdNBvVfJJwFUUExtxALOiPAZSWcMJxeqROqaGYpKPFdBaBsPHVCJudHBMaXmxZcCBUSKqRvYYgP",
	};
	return iGHYlGesVqFGcs;
}

+ (nonnull NSData *)DTObDUEAygyKMVw :(nonnull NSData *)IaLAkUDogmzhnUN :(nonnull NSArray *)vlFKQghQdy :(nonnull NSString *)GrfDZKDMMipAxKnA {
	NSData *nkNQoilIlqBdTv = [@"OuNfwUvIirKmLyMLtcFsNJSqnXMxIFGHzzefsdAqENzVXUMeJBxhjJoBdmWyMWQesoMyijkKxWYTXMRNLsrlfwzZiTbCqMVwWJVdKFAfwv" dataUsingEncoding:NSUTF8StringEncoding];
	return nkNQoilIlqBdTv;
}

- (nonnull NSData *)vavmhaLlfwOe :(nonnull NSDictionary *)HFRoANgymlPghZaU {
	NSData *nsrNFZYuJvZliY = [@"mAJsptTWYpDbCQstsVbKwqWMSiQAWSUbLtVWUZiNpOXSBkyHmZpxrAIiTiefoMfMMWxFZawMMKhvilfGWNvQuXrGmxedGaOiwVxapVstahKxEmctwssBHeEwSlRpUkTdMDnLGuyZlyTnKYX" dataUsingEncoding:NSUTF8StringEncoding];
	return nsrNFZYuJvZliY;
}

- (nonnull NSString *)TzMBszuPQQm :(nonnull NSDictionary *)ZoOwgJFXejPijg :(nonnull NSString *)LBphBmWxPVLXdCfAaIe {
	NSString *mOTkmKGTnEYxYZwfk = @"JVJCCYFbKcyiGFxNuxgEAoIwzekdzOGPJpplbLoBWJXPXGXiXZmjXmIvspihnrWGpgYspkmtjdyghAapFDGOSyWSrdGDkTuAkTwny";
	return mOTkmKGTnEYxYZwfk;
}

+ (nonnull NSString *)EDGJAPHCrRnsU :(nonnull NSDictionary *)jQMiAAGnZoZ :(nonnull NSData *)KlQFDAXdwCxkS :(nonnull UIImage *)mwvZgCpTHSDGG {
	NSString *FMzbwljOQmSR = @"vZhbuodMIIpOJtLpDSMwYwbuboUyXVFUtjQTuIciYIInADuYdvbTevyDIoPHrQbHEpgyjoFCXGBAQEJuTURKpqGLCXOuLUpKXkgwzhTCECijrGCNZUtJbHHcDXWiLEfgIGjM";
	return FMzbwljOQmSR;
}

+ (nonnull UIImage *)FusXSCfoxawuijYoa :(nonnull NSArray *)bZBfgogIfjrZX {
	NSData *RufniydVxBSFew = [@"qNjlnoAmxNtLyJYdlqxLKYzOsMqqkIlsJFoIIqKVxzEXTZmMcXfTmxHbDxYtZRQsKcbmrlOXTVuIeVuAnzlRYPUnxJweOiHwGgNMTWUONPgpnLvbGeo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NimpDSIEcFwnjSITfYv = [UIImage imageWithData:RufniydVxBSFew];
	NimpDSIEcFwnjSITfYv = [UIImage imageNamed:@"xEYgoCFMBOQWzRwXnrawVSNqaypyZDgeQaviHCnMYbPWpXEoKjzmppsbqhrrzxwjHIVilbrOjHDSmDjqEnTOODhRljFciYRnkRGRvQgdmGeFIvcUGYdVnwhLIurpDhdyfQQjTcIqeijBDOKImh"];
	return NimpDSIEcFwnjSITfYv;
}

+ (nonnull NSArray *)GCFwqsRrrnOFVPCGS :(nonnull NSString *)dsYHujKJNsM {
	NSArray *UIfmIqCrCTzvSS = @[
		@"edrLjmbXDemCJaUsdVaVwabrqtjtdTGahNrcULitQUOjXNKhzloybnQsPGZxPJLNutGnNGwNNTxQhlLNgwcfpGkSLqJMgOPATCoHMcSpPEcCHbiFcjllccPLkiNshJXrEaEGXgR",
		@"xWdgiogWCRQfrJnFomtQIFFfmsoVbVvxTgcjEfAyGiiFLIyPmRWbyoYIgvNucvGTjQDLrUeeIihVOXARzehYfqLNffTSReOoWYKVNDgmGRbGdrxXHosloMEmQJSUuXDFtvIAkKy",
		@"fTWySjIOpALYtvRiXaRddbnssvJuwhlLVnNVBECLyEQvTGQllQrxKZPkzWFdULmnQLemqVOyEBDgcLphUHXSnoUjDamjWwFTqQiGgQCReZKcAPlcPVfPYBoFlOSVWltmvCNffJOpuxYPsgzPlJB",
		@"UhWAOjvHRkBUNFJTBuedyCpLMLLtBjfCywwULMarltYyaYgPyBnSXpUTKyNGoJHhmTvuArOTUBuAeZMTMSMgwQTegByjgmLEwjTafSOdlVNOOkDsCQGUtN",
		@"qcPiNIBcVnKtzUZouUZNmqtYARrrQHeYnozuKQCUxePnxIbLozKDwVPnMgyjyeTsbjFSjpjUlPvwyYLQWSZZfolAXokDMKTPmHyGiOPbOIYabymKqrLqNmIbKIcMGnRvUe",
		@"agLUlszDmHATnuHmvxjImnfdBrnvsJIwJgMygmYPgUvnEHCeKfszBLYWYhIrcadIhEnhtdYFkyGWvkOczilHEPCoDqLNkIWfqyVYdCMgrevTcJJBqjbxFPrx",
		@"QQOSZExtXdFNJqWkHuEtXhIIxgoJWQizxyHIiQVKoLhnHFykiCfuqVnDWntfBnpdWGcCPPJPyrDJIxDSpmvOlvrfvedLiyvMdEYOYiqixnCgXRTJxuaBbYaHwNioBbHIVWUNgzIp",
		@"GkqajdppMifAwlHBlvaOllFbvSXAeEtavwYhHYhWlVWXPizFEfOdhqzGAzoHNAldTmuXmlwtAilxgDCLvOVikQHfLuQkvxcBeQMceOTnkuKNZeZfPoTkNVKyLomFnCWywZSATtpvaSerRellsva",
		@"nkJdMoLalVHfYfHBwjPHiQAoCUiLolNINaRcjdsdGakkZoeFIgnIijIYDlMVmcAymaLNmPeZqsswATnAarbdXsqalFBuFswIqQdXfExZNORiBmecatSOrOEjDrEWWxRMKXLRe",
		@"cwXugzmrcoLgCNIhmXTVrHrxMdatVlFkFFhAidIKTuWoKazPvqlcFEtpBOxlhCtHBYnTMxnemReXUFPlTctSegIHLblaoEiSCNdDYIGdYdlLPqhn",
		@"bUnSgaMZgYGTHnvQWidTLaMXQUSLoTXOSNflSCdhggNEWvvJNebDvzxZExQSJhjFlXRhhwYsJWHQIoYuHrsxPGlRnoahhbmtBMJlHwVouBEw",
		@"XJDzQfRwMFqOGUHtRUwRvJOKAVimMTiTyjtWiGamAmbeRxQHHpWasBXUfRCbNfquvcaclRmnWlclwqpfLTDUbHripMekMEEczeXKIuuYANisrGHMSJfALcttwzgOVV",
		@"nqCctRcguOKNBeVLOdSQzzMKOIVLuQReuTDWFyHwMGSpMcermKDECWnRNsTEudaUENlbAQDZZRzRTYFtctEhfygSOaoxXhCpUTIVENNRLRJeVirUtQrpVBBXidVdbvbCPvAVglmRRw",
	];
	return UIfmIqCrCTzvSS;
}

- (nonnull NSString *)dZqbSkPxBDMEi :(nonnull UIImage *)wkgVWSRTCjUFaecI {
	NSString *dPNFkKoIWRanMrBgOn = @"XnTCdTpTkzbaKrMAABSOflPmrWGhtwPASUUPVAvHvttEjMxiwzXHDbGZfnhrzTGXKzENmHjLsBdRlOtTJyFijiGolGzaLHTwlnSduSINhrdCWkKEAz";
	return dPNFkKoIWRanMrBgOn;
}

+ (nonnull UIImage *)GnzQlRmjdF :(nonnull NSDictionary *)LhfLicIwOYJChSIeX :(nonnull NSData *)IhKqfwqlNjf {
	NSData *qVkRbQeeLisMSFotZK = [@"LCFaZkEFmCNFqGWtANnhuwSZAClPHuXcZZRucskRVqaxliYXXFFKaYOlNokXcMSmqspBqzaFfrkZFhRfRnEZDzWuWJiiqmUDissxtTGEIUAYPrc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HrgXMreiUjG = [UIImage imageWithData:qVkRbQeeLisMSFotZK];
	HrgXMreiUjG = [UIImage imageNamed:@"HtumDToYNmyMTsZpUIevpGyqCieTRsLUwvMlfYAPQMcPJRDNShLTzNhNeiZOWlJeFKaggFTWoCVVClRgtrLWqWPHNCPwQHeeFzzEDQykGDLGyDkRdBijgRPSVLyuHFEdecOnYKzvdlDVxBlkMEV"];
	return HrgXMreiUjG;
}

- (nonnull NSArray *)PZGzUGRvmliSUtbKP :(nonnull NSArray *)arrHrrLVSZy {
	NSArray *cPQlpRmmblmKnZ = @[
		@"TkVCPWPryfcwiwljuLLMWJaALCCophkuuhBwRndgcpIRdLbNMyIkHYFYsHTVcDgLiYpyOocwWROgxGPjoIyrapmHovKEaFHqmIbFcSLczoORXUEVcszWAshMYtiDcElyvKPeOutlu",
		@"PzPyvliwAqHvUzsSjZmRMgafajIikVYVAkaGkhRsObOSqZZnxdKkygjIUbtOGOISFDJriubGPscfuxOtsHTkuObwpGLeloCxflPVGUkNagILGNEGXiXljsNRJQLbs",
		@"ZusTdgeEZDapsGSxDePkeXyjUWCCzCZKSFjXXEAkVhdTTaraiSIsfrgUYLpRgIfFUEJIXcNnRpNYoHQZnEnJuHGlNprjzqDOrRXdZHweLOqmzGNKyqlRxiPynJuLHCpBURdCLXJThCkwPmLcDk",
		@"HFzRipqqPcoLyIosGmJkAeFTHIdKNAYUFKMCBKWZjHBUTOVxYrPmYXrtdAsACjIIbmZgPtfiwGqmMySePsqTsgiNvwYWJDbPUfjYSJeFZvsnvwQLnWzSFSLSdkCYPnSwnHVXIpGWCn",
		@"JsrCyflnkpiqXlNMEZewokOITgEwoFDalWEUoEhTZanqUAXgawLlbEyAOTYLUqQPnPzYRQoIlEqeXHGPsdoeUdtqWGQZCIUEpiUFotsDeQhFjUIwSYKfaQzbXkqaAJZLTRWKUPlHDffJFextma",
		@"JPaLWArPIQejrkNWWwUzUcVRwjhBIueJFVfuqvMlhpkfKOLxKOoznLSMUXsMhWlygSIBnuMWYgkQrsAPQoEjyoSoCMqwtgxhbzFcoBedCZvUXBevStEfCQpAaqYLiQk",
		@"KeOKJRWyheONqLAuOJsKUGOvqpxZWciIYvcvJqnercZEmRPUEWMVWfOQkDFEoCrBYqnhOujMZmshjYYOFMXmDtjMxuZAObfgenLOWWfbPqQixGNHmZLfRNkQhGPpDubAtZjHMpoTSV",
		@"OKOUPPUeMNSCzIuWXQzbsiZhPMqznUlNnepfLVvDkYXwLAcWItpCtdaCCiFopPfsGLmJjVxXfHNPMNpMrPijPNQYvPfifCxBdDCSACixUJKUYiJRRPOdCFB",
		@"KLLqPPYAfvldrnoPSOFkjzclcUUEaskUfsOZZsQrNTkCmKInoqeuWlkdMsTJqcWSwGUGZyzulfRBEarGjkLBVwJyvpslAolQqyhMinUHY",
		@"PTKAHylsZpTelzolyTeVwaNhfNoifXiTJTHJRRWEOGAAvYUtldKNlSotLlfpPSCcClcYGVZCxArjkZopfHUgQCDSdXdKMNnxvMnxhBZcjazjEVXZvobyA",
		@"rwFhDFJndZjbmeSIOyBiwKJBBXhvXYqnDgBOPBCPpELtjGYDBuweAYLUXqayofNLnJPdDuyHyogSzDWVStdJdGfJRySqKxpnJFzgOZnojTrfNgEOIqnSPUNCbEUtIhSnZNBtiaqCoRpYOJUip",
		@"cfpfNXbWmnvWKQXTqLBDInpFezQYyamRSFJrzXzLbllxVpgxpOiScZIQrLjrgqHodxpODrODRBHxRXlFLsufukOZcfaIbRUXtlEYIGxMIcdk",
		@"vPsTEJLavUBocanTiFsxbKOuBFgckcKZugLjLwQbxPNYYfGEQQwXluHHiskHUMUatQDGUcuuOeJsdAearwuOPqLeazFJjmIFUqNZUVFmVCb",
		@"JgjBKaUfBNfftOpPEyUOWNXVvPagdygQXfGyvMLLZzjnDGABRmsDjyEbcUCxRDTTFMKumTQmFZqZAMiTewZlKhUFTVPxkIyfWyYpsckpCpKDVuRWjSablmTSRAIwNudSOopzlM",
		@"WsvPeInMniQZpScoIUrWZpcMvmqTmQmeryUqhoJAYcQTDetTFKlvUFEHwKDKKzbQuUOmHdhMkBvrIJNIQMBdXyeChCusaxjLhJHXwsvAftvaDrPQEpKWOQeDBFXxGLCBrbsE",
	];
	return cPQlpRmmblmKnZ;
}

- (nonnull NSData *)UVTPUIBYCwflTOZYe :(nonnull NSArray *)LkLIHWUbJGJcSlnNqN {
	NSData *kfKimuYNoKvLEva = [@"xoNOTlRZYVQfxVSuYWifJMxVEXddSpKgZWBtyExDBKKLiBjCutxzsNuEerktNpIlIbZpazQqyeJcKlbAbzsXwZrdPBZoGXsHpPILDDPSrsEzllGYZcaNjq" dataUsingEncoding:NSUTF8StringEncoding];
	return kfKimuYNoKvLEva;
}

- (nonnull UIImage *)eWyeuxiHaC :(nonnull NSArray *)CWzlClJYPaaHUXJyexK :(nonnull NSData *)pyGxBHGfirJbrZMXRv :(nonnull NSData *)ekofYubPiqfK {
	NSData *axZAncBfUDYT = [@"ePleNrvbSpxdVLtjTgGvjosviglYJmDkXJkcjVWzOMSlpgjFbGEKRZrEVrIZIGkjGzMsObvhUSYuHMvcTCsRNvwXIOmgvrPVEnbFkiXJBvarsDEbhLqyhIXHf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zxKOhybYbS = [UIImage imageWithData:axZAncBfUDYT];
	zxKOhybYbS = [UIImage imageNamed:@"DHcoJeikBsMsAMwOrWeVAeTfUkUgOVVQGLoQWbzLHmUISLFiEsfOQWamJsuyyvTGUQYMpnCifqjqTOTMeRiAYplNHSplZmOUnjNZFQaKIgYoBPJJkLDJ"];
	return zxKOhybYbS;
}

+ (nonnull NSString *)pBlrJtCfWno :(nonnull NSData *)fPYpzscRblRu {
	NSString *PsZOqRFGUBTyYD = @"RKRaIXOlnefvatFXDOStSEDEsemwBNtPJKEzRcItlIiPgFtmrDjCTSSKYxZocgovEEfdHHBvnVOItjJwcSrPbhOwbjyquTBssxhDiUqVjlXARScUMgYQVFGMlgvVnR";
	return PsZOqRFGUBTyYD;
}

+ (nonnull NSString *)eSASbwyUzOFc :(nonnull NSData *)XwMqpqGpbPILrgeJsoF :(nonnull NSDictionary *)pHpPTFrxkb {
	NSString *KdlqqLQeyNrvJVPQLTs = @"QghAzWrpIAuAukjkDWbnHQzxYkYgKahtGhFcTNRUrWnHbdIJaerFsqLYWNsGKphlQhMYolsQNtUSmlJphPXpGmUwnAvUkyvTsYBsOxjbQaOeQtqRJBrYYsZnkcL";
	return KdlqqLQeyNrvJVPQLTs;
}

+ (nonnull UIImage *)hvtmzZcPbCVZhJkO :(nonnull NSData *)NunkGNauZL :(nonnull UIImage *)hHYjZvOneuD :(nonnull NSData *)qEucljnJYQWvHPchSzt {
	NSData *hykytaAyAshrPFkwR = [@"kWSGQvldWbxuXZCLPNmLaqUoocMmumUJrzvyWnibljLnaTCuZfdpGkVKCsfvyfQFUNGTupZAEYDspEtkorNRkzZoViupShwhtRnMmDUyQsmviOCxJXVAV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *doQlGRMKJhA = [UIImage imageWithData:hykytaAyAshrPFkwR];
	doQlGRMKJhA = [UIImage imageNamed:@"KXFBKDfeoMihKjxAvpTYycgqgsqNMkvbUHQcaXRgwEUccTDJVlKOOvVAXOVnyXmAhvgjImeMDMTxPOCbYtopoTDWRZLWowPnTigPNaghyxvcrOZVEEYxUdxiaZMHm"];
	return doQlGRMKJhA;
}

+ (nonnull NSData *)xmGMLWRUxto :(nonnull NSArray *)rQtLjUGlKoKmXBN :(nonnull NSString *)PDSUfNqyanyrozjn {
	NSData *FzrGiXOSwX = [@"TbLMDoMCDRhYFAKVvDLKznOraNzGClPsZrAkhmUqmMzrDOkgaSeWGzfZDHvtpcOWUuMMfYyOHadVBEGiwBiVrqLwmZzsFyyOjEvtQNmxHoKzwGMXYbhREDurFRRU" dataUsingEncoding:NSUTF8StringEncoding];
	return FzrGiXOSwX;
}

+ (nonnull NSArray *)zbFqvSSCgEBmuWQWl :(nonnull NSString *)hiSLaXboUSuBoy :(nonnull NSData *)GVcqDzjXvl :(nonnull NSData *)httIQInwHCGaaOiA {
	NSArray *hXCmUHSAvUUUwpkwvUE = @[
		@"aGftoVEgdwRQOoLLsBiKJkTTvmTQDXxDZmzOGYRcZvCwqLUoglfdTCjXWVBFcLXqJdQkHlfOfVzipZNBxjdbLuNEzucexCObhGqUbwqT",
		@"cRTLDdEtQyqdNoBVmoFSvPOEdgZMTXDslDiaCVDGsspsFbsDsQoXdcFcvjfErLydMuONQkRXrtchhoVtkyAjcLpvzOkhvYMHwuCDenqjAaYhVdrxzpckmVfREjDUBIqhIuPyqtkvrRzFdhEaAQVYB",
		@"oxhWHcFRnPdQfpNkaIdkbmLmMLDLjXbtKkWkWkBUDgOpagjTtkoYOUYklHJvwhcrdZlJcyMrHLnRjwtrGMxOFazmMXXOgDHMOagapcCsVrWTNniAuisubVNWgiCCOmCXKZXhpjwo",
		@"qYHFsJWFlNcfoDuFAfzOIzazOujavRDpPQOmRjoCgkoDrSZJKAbpvPOtbjbhoiZoBdHNfEZPuDLVUUxzdNIjuUbLPhiUSJXTrzsSeWXRATAe",
		@"SGdoARNdmJjDWlPcDrvYcBljavoAYKdugvWnUWBuOAJUDKnjpKQTHuhQDaKYwfbbRfMMdXixxLresrAplaWGHyUpFYQAqMCgflzqNQOpdnzMZLsU",
		@"aHgFSmqIcZIZnOrPVIGFptMbiAaEXPZWcaylGWvvPkzUdWBUAIVzyqnpiDCQLyXoUmZjmkSUKsIZNzUuOCrEdVSogHTPTUHOIVerCJ",
		@"cxGjiEKjyoUonCFXSJEtfrlxOnOFLnnciEsCUMogliDjfJOiyjRelzKwcZhKppOfzStfQocONFxDyNfKFnhLskQKQHvPtDPsDoOOjNjGTtRNkcoKCCwcSs",
		@"kiJutqONlCGiBUcUEibucXWHPGwhDnqhbLKxGUJlQLDnEJxSJXIvlgdJjBFmjnUCOWLJRdPrkrDwhgvaFGAeYlTPRMlczpGJQUtCBoOgIYZaZbzMDzzlZCWftXqZfoMmqZjrJhQnPNGpARqi",
		@"WlzCGpSQpwLHXFoPQxyDTrAxWBMqoVfmOAyKGJBbPRQNjaJMjqNevAXLcrihTKEfxdqJoiTuEdpqQTbbCqfuYWpIYgrXgquInnIR",
		@"HZaOacVQBMmddUqNoFQXmbIhnqSfpQIEEISxAaWXUclcAxIjvWwTntNIwwcGlCbrdbxVdzkNPwvoeyeERRAdyWgYQAEkclzJhPFwpQTBRqwDdMufdJtEAIWf",
	];
	return hXCmUHSAvUUUwpkwvUE;
}

+ (nonnull NSDictionary *)qxykaaBzNWUAQcOkEJH :(nonnull UIImage *)YrfTInmQtOrBcsQQFx {
	NSDictionary *IkZbedMQNn = @{
		@"vHduIcnVdGNh": @"wjoHbpRVLCSHezTGmCheoQjgTZXCFYNxLHdJjKofnYgJDgCJgDEsYEkEtMXZfMSVtspDPfIYhQSDghGTGXyYQstWYteELSWrciZfkuaZ",
		@"oLaNGUFdSpdoNNX": @"qCnDpemkLOaVDnUHXhfSeTtLpoOBCrdmkUOCJSHMEnsssCpsJipIkIjlhnuRJIYawVWXJovvXVkuSfAXpDRfODpoSacxQlMhvlNHNNXcAIajgzPtEWpENqxCQHzqDyctUywSqlJQnPsUKrhVUJEK",
		@"OePDbDytpJlct": @"PlHwWFXAuLFyFJyeBQVCQvkClsFWBdsRNUXQEHHkMmkTerVTPVDDFUvMOsOPrPPbAcqSQFxeazXxsWgoTSsKGIyCcFtkTfBoQOxTsnydiFJlbMJgUkx",
		@"HTLlSYHSuujooD": @"mqwjzgIXqwgwiZiZjRLxuKMwhMKPUuWrfaAKqIlRxsFIQUnlgTSwkxdZfACPIDLkUVCuxoCYpcwcFNHFPAEHydOkTWodjGDNrRrZRBEnvpTqlLWlDNLTjjn",
		@"eJBCFWPfzkDsslp": @"TMMAabRDXeTysqrSrZswwuJJNtZNqvvAJdeKJwiwKwfcbAhDsfgSHRFLgGounujjiPsUIyNHcKJqNIMZHoghjCAvukTnsDRgBBTFNK",
		@"znkJXvNmUsSwxqaKkwL": @"EVNmCaPfBNkVCUGYwpWjTZnSGGGMOSmJCLeIErilnXZyyFDntueynqGyxTgSAkRiTBvvDmqsPFhpatBwcucHffIDgWAatngbREOZVBzCneNzeWhhJZcLedNNVuN",
		@"BSeyLnnLQGoLFZ": @"kafMYzhDIkBTAkaGnESfBtVXSyFfHCmuSPpmXvOnufEcJhZLbklwscqCmVgSQaLuPjCPZZIdwvwFrpyuXfsIWiWPYnPnlKUlRBYByBIZdgkRsrPyTwUkRTmu",
		@"vzmLLyIocY": @"eWgSodhQjuknYDlkPOmFGeEbcBodNMlmiZQjTkINObELhRbisWkLGPuCoEQlDXiocKsoncxMyVdeVJgUavwOmeaFctsGyOVZsbWImGhzdqLKXbS",
		@"kVpTJkUporBBrqptb": @"UTHJMkNWkEjVIATmBCErgJJJGSSSSGCJSLISfzrzcnpyksJmNsvqSUTYzJbCkwrmnuNRlftRQrqLrILnUyeYhWjEOqusQvshaaQzgIGbDqXouiYZdpGlXRPtPargEjulPfyFREIeYSj",
		@"xlcueprrwNdn": @"HgVisbdnVFVXCsnrRbPIiztxMAlcVZSZHKILeNRCcWzRRPmZZcBvkoANRGPAOTATtoTLrIOogpYXqTjTqOEQcJByOXwuGjQvwfEwpHDMcySr",
		@"KeaUzKWzOTrF": @"wGOPyOeOegeEEvqSUDkBfiUyRpCIZllFQHorQVycdwVbMKAwiJEBqjLxAvHutYcLmeVqlteBVXNDQEApjaJerwZHIqdfCJKeuScFnAkpXONlWANBzInypfGbyRNKsGBTZuSVWNLsih",
	};
	return IkZbedMQNn;
}

- (nonnull NSString *)LaLOigLLUnVW :(nonnull NSString *)ZcQsesftDBWqEcnD {
	NSString *wZNXFGsVGtP = @"tBofYfjQXVxgbaCBcFggXKQMIOLceqSUgZJhEalDFygMpWZtOaAYtrRjTyIdKppsRbLJRiiTJrZkVRCtotemcxRGOuVETtomnMxxDFwwDwdsl";
	return wZNXFGsVGtP;
}

+ (nonnull NSDictionary *)rVQLUdnqyOak :(nonnull NSDictionary *)uQKLIKUoGLe :(nonnull NSDictionary *)XrWqSzxaOEbdBjijmj :(nonnull NSDictionary *)LoIygSiZKgebMobrW {
	NSDictionary *LMmGaewZtvW = @{
		@"BzSGowcWzLRmTb": @"ppVEqmUephshCrEdlIWeIwDCTFaVyuwOYoKaDIsSmBxcTSwZfRGyqFoGiUcytVvXPnxiXDRBBVSESmfZOvlLUqbjHNVVyPnVTuVrOKxtEHmkIqOCsGHGnBEhDXBMEgtzhHokfwB",
		@"BoumTCmWhahBTAj": @"irqHldBnjVhLFKKVfNjJkZCmiwnGneLezsbMvUFWJmcHeKlbuVxSbDIntTgsNrZruPzJTCdeoHiwKnVbJUeQDaJeYbagLqOMInoqqVau",
		@"mfeqHQHLUo": @"LettVChZlBIMnxBEDOSRvNQMDyxvKlGEBVoMOvvISaDnrSXGgdirxepAOpyEorDixbNeMGkKVvIhjIZBqmTrnftbILFonOPFecHBxRUZDrIALsttLIqOyStdbWQHQEcSNlewozdMg",
		@"ACKdQCfmqEhKLhe": @"gxXAvbPQqNxjnhUEOcExrXWtJUelcZyVBvsQDklvZNwPJvnBDVawXhqUmXIkzNTRPFbwVeDGhxGAInSNwWPjBxxhOZrXGnOtmZrUBoKakbeZmXUBDynJBQbwnBexkCLPDIr",
		@"RzKsDmbFlQy": @"VHEnENFKqELrQCtKnVnNFYNLsUwXvuBOPgAjMPtGlkqQxxkNKGETshsKZkbwawSIUPrMOFWfaRlsbZQbHmgJzLbKLlLLMHHOShaWZOGgpkndodLrvsJLFMlaEREJlFHTlmNNvuvAKwHLihQFMTQB",
		@"EUFVILPfsbjyEbmcoqG": @"VjqJAJBHybneucVakjilKjuYLEeHlnwxZhkJBfsJkkLDLSpnbKFYJoTlfpVgLhTjGFaAOBrUAZWMZUeLkMYQjpELIyTmoZTJZBJpg",
		@"bqRwNjnHlBLZDehcRJg": @"xhxmyRmzusywiwInfkLwRDxNJpMFeKrLqKIoWaMdesBxIEeHwXjpYGlHyiOvumLuUVUwwERybGyFBVSNFtpmhDyVCBlLERrDyydHXLhmsQiP",
		@"WCoYRjiIeBKi": @"UlHVhQBWKlRyIgJeNBvJejqlWHDlWsAzWrzKmdjiArQJNssvyLPnDHlPhNrouUZBAqsVnGabHEtPQcFrqKJHHOliqiLxspzGGRdctvdKhNXtDxvkrXhjrLYqSAOnSyQpMbrIkGUwvYzaQYOHTL",
		@"GXvAytSFfpsgVgwp": @"vKKIXfDzHpddPjqzPHjnMnPMCmRdOITswaCYwSihXMDXTTyGpygZweysJrNHdvFyzjXrcqmnUztKeLDtwUfSeXhXimAgpXWGHtyWkSsbxhuDFbaqtIULpyvKThzGNRwcPNzzuiiCdK",
		@"EJRWuzVNtaCcvOjI": @"jtIjHqZRDkUjwQqeVltDwMbhhFEqzkUZQexgxigBdqfRYJpNcoIhiBDocpHxSMrffZeJuPZcRofBqYWeesIDiyBzStufiaAOrvykzNISXVWiCRFaCGcvaInnQJNgo",
		@"JEKFbUWpwXVDESVJ": @"NTzxBSkvlmQuelPvCFooUhtfRWxSAALOYbxPocMXcnEnaOITYeBjPBfPwvqDbdFQkTpYJXNWWCMAmEePtwByynubCnnRQWrNcNLbXEbwpHSSEXeCznKgEQLgN",
		@"zkHIaUeWBWdp": @"mxCxOBzTCPSfKsHTTVCAnyEKzctsmhTBpKZtDPzxtzeUrfSWNKmQAZLDBBKTvdXOpnSgghIykPSxjDmAFjGSsZJUkQsEkwrJrPvNrviaLBrxMCBpvrpekUOqtEhnXkJegUJTowLNRBq",
		@"qQKYfxOXgDcYRmuDuD": @"coOoakeTTWNypJJgENHznFTVanXHbBzpxSGTnMQstlOLarzXzvwldFNxjMzRPsOgPEqdCryOCBdeZwqwIDFicWODuiGdBFZJlbFUheHpdJRfSCDtchqNylTWnCmAQvl",
		@"uAMajIpVSJqyCMO": @"eoPcQXuoHjwSURXEpLLWkATuUtVtKkRpxEuKEWrCSudGhhyJQfXNqzDAmoJScCQZsabRBwdwcUwZRAYiYtzvdMCbpWPyQlpEjVBMWyhroqyKmrrXkBkbHhqBRBbacusjY",
		@"SaKbXFfMGTlelCi": @"etzberUptiMpfuyZeHxzVKbsaGSpxPEAEpPIAcWyNiYRkqLcXLuIFaCCgOFhYFZyOAvyLeaPhOzipMFiSjnZIpTmetbtXrYrZLogSCruWakxkAXFKfFKo",
		@"wacnkpecFDH": @"uBKsvOEmUGNVJrecawlkeywhVkGBmdaxcNHiMozYQiDgDpyZZAEqFgHZDxezBtOttJClOwTthYgOlbIpTXyoSQEcVsFuWgglzPXuZzbGfgenHMsesYKMlhJMFzDLUAJBnAqvO",
	};
	return LMmGaewZtvW;
}

- (nonnull NSDictionary *)gxOcwLTkAbquhdDzS :(nonnull UIImage *)EUNnaDpUixl :(nonnull NSArray *)CrmhunKerCKZxrZm :(nonnull NSString *)ULOzuaImGa {
	NSDictionary *GsJdhsdYtEkemU = @{
		@"zfEedcyOEVYLlbramyX": @"okQOGeScwObwtPNhpukimjNwaQDwCmPuTDvkqQLfBzeBVarohxSPhKmYMFSpIZxYmccFDOMGrAJXUsJKUlsSzRzHBRoHoqQmcvImkVlthyBvRwTfbTpeSwPqcLgyeZo",
		@"LHCtInVLIqebge": @"xhSaNnakcKkiZTngQVkSVGqXkESxcchkkrDYgTPrzTJuLZboxSEouMJJJJbCUrnICeBFBBJqLeTJXqPvdeLlkIUIdjLIxChAwrRFAseXvFJvODZlSdoJLYWDucipaPDjotKAPSXfHgIm",
		@"wXITlbErZgaWzqbWP": @"JxnIyutKQZgFLlbSEKvpMlHFjZKzaHhXmRzoBplaiJGmpujoZLgcJnjOtkxdOtzXtprizXLsJffxFdzkcsYneVicWMyKTvSDArJBvklEzrqucv",
		@"jnKAtXeCVWJnMNAcb": @"guTJVlUsBvYMTrbEvJAZSCmGBWKlqkHIdXjYfDkHaaJdNnZxkdEnAviohvVjKHKdezeVfuAHiPVONhiOeHIRtFCaoyGySeHSkUxx",
		@"NukYZuNKpQLoPJiUYqu": @"flGPsjzAjuVmkMbvgNIyuKpvWaUbrnqkHshqbdAqBvhOAVYkmCmuiSByrVQJrndUwgwpDbQxKFUSZdXCSpTgFUAOxdcYHOgcpmtlDMoTzKCyBfHlirgFqawrieCLVTBVTgufLiqMIknjNkV",
		@"tYXjRWbnRMXDjElnhzI": @"JMUeYYjBUMKAHYaYGIIpOGtuGhVoDPeHqRSXtBcquhJHYqOsqxYDkallKDubwSANgjtCmqamQyOuRRiDzDHIIMVIehoQYEuCwbmpKURZqHBvLwsJFHrWTjCgCRWWsxXGPqQNImGOIjTofXzePjNdv",
		@"WzEbFVAsKxrqMFz": @"dXyHSwwfaDzFNAfjQFaMLNgLhyPTCqZLUlkmwKbBqhWFfEHsVyptnnqcElceWFEtdXTqPMikSYwUNIUJtVrQkTUzzFsWdiaejuYIXKsnEXEOEvXOLTMSiyQfoUssU",
		@"TTMiYpvXWtjFJWk": @"PTNgLdcKefXczelRbafGwfeHcSmFPeHRtnNtfHsXZXRLPFecaXnAOvfxVbbWWHibRNEBhZJwUmKMGFJCopANXvTRvLtOgkllJAtqXGCMaZwgFiToJrfDaTqBjsFhdEIviKVcCXKUrvNcGKt",
		@"zByhJcfCRbUaHgWw": @"cfyfzbstQAfFUJnBUaunShBFLRUjvyYkJUqwSkiDfwPrSZfesqOhxlKYemnZdigmvqdCmUzpoHEfvleckuYzzoTCtUYPEMrxSZqoQFnjQlkBV",
		@"PFUMQxtYnlqmYPaotMK": @"WVyUnBtJAoBcSHFDZNpxNQLcowFUAXSOBrPmDKFXgIoUiQJeEIMNFcHVgEvYLWixkGXjwAWnajQBwhfsuZukMVRhksrmLbaXuTBEHBfxGrQmOh",
		@"gVWixxSnzxu": @"EBgTIEiXMRUevefUKeFBPbFqMQSUWSmnyWqyEMqYXvPiDUJdAzpiWecJcgXJkCaLlGDapZgRDtXFkiBTZVmeEhaLMadXkatcEruQRdaedEVIKvfrUJweqhDNNqVXTuMdVsqXUExJHjUIUuXMjOfvV",
		@"cIwzGdTGgaeCL": @"egySidwEiUReRugYWohVVTdJLgtAxZLcvwaaRKfWLZlIeoqREmqLhOtzQEVfrcTUPDWHUsNFoMbdKHZpJbWejJpOTzsWwekbOalOZwHpaQEpAaiBLAkypBYknBn",
		@"IZBkhmfcgAzMXanly": @"ZaWqCBfFuWOXgrWJWuIWwWUFozltHpKTPlxLUlDaKzPEwLXQKIhrvJrAmMlLdxPiITSgxBhkOzYDbDsDKLNiajJYfwYwysWhsbTxXTaVeCP",
		@"VirIKNyRchbbEB": @"KYdeOfgVWsWrChKDzAwPOjDnCNhwkKFoMdJQsbqZtoHTGGCWrhPORRdjOGPGLGkfnjEFpYsELYEuJIuSlMnqggJqUBLjpoFKJrLNqObissSpcLEbwOMVSAvwPJjNPKkwMgSBupXDGjRZRsL",
	};
	return GsJdhsdYtEkemU;
}

+ (nonnull UIImage *)YivZAxEtJf :(nonnull NSDictionary *)FEaSzwIxIVhBxWDq {
	NSData *NeExPIOGBMKHgaJm = [@"JDZgtmriAPdyOrVJCbyccSmLiNUwqmSWOgdZljLBixKbvkDDqFvXqrjDOTmCmkMovhCxkTZERTdBIwpKEOtsaiwfMrQRWKULusQvlBXqOLweLJEyRo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RvrEXcgdyOcrKX = [UIImage imageWithData:NeExPIOGBMKHgaJm];
	RvrEXcgdyOcrKX = [UIImage imageNamed:@"GeRmBPvGonDtJFpffHbQlkrUxZKDnfTRHxDWCTTBQEsVcOMBLQvLztrGllqOhJLkmWIHDdiKnZGUeNwkvBFSwTaFlPmotTEZTUqBdIETLrrtWZYDIFdAONZAwcWTFeQkIRgI"];
	return RvrEXcgdyOcrKX;
}

- (nonnull NSData *)MLikLIEplEORBKQO :(nonnull NSData *)wrQqLyaJSGu {
	NSData *NDVMSudyqwHGuW = [@"iSYyXsTicfaNVsenlabVAzruMImfMjfTCSMKEMjZaBGWUzrQtexRxArHmtuLqToiYVwPoegcPxdLbnJOZoGxxOswyVUZLSSANxiKowXIaMKsorIDwecMTXTJkjotMVAdYfK" dataUsingEncoding:NSUTF8StringEncoding];
	return NDVMSudyqwHGuW;
}

+ (nonnull NSString *)iEaXCiEyrcTtwSaMiUy :(nonnull UIImage *)NiqNHmPxgTUraIIGYvO {
	NSString *NfArGPboZhWVJFRJU = @"aTTNtNUuSZONlWOCNZiJcfSPuVkvpxNjyofmDNDpuOJNwKfxydOgMbYIvlUlQfGzPjwyODgDPaZLYTUjLxiwnCsZdCjbAlbAgfLImHTjtrNGKdqTEUrReWMLE";
	return NfArGPboZhWVJFRJU;
}

+ (nonnull NSArray *)QrKVDIUJpncRpWU :(nonnull NSData *)ccukvPCAtGqkVgGmSd :(nonnull NSDictionary *)snkcTDBluZWaMlHLS :(nonnull NSData *)lwkJJbkDqevDYL {
	NSArray *VlQjqmhZIGmgwJ = @[
		@"bVIZkxsFnwSKzhCdOHXNjJkDzULOkGwEdyIQKsuPPbnUiJDTDXirWjnylMsmGyLhVoQZHNRqYqRdyFNmVcEtTyToueMylrKBeNLMXHfegeXyCyzuCnQkePFpDIRL",
		@"cMDdWtYeCzEsskjLFtdFHSpqRajZBMqpKCuidjdfDMIiBLrTPUYfddokpBedgzacQlghptmILEFDszLgVQxoZRotOLpTiVnFWoOPyQOcZATtTMguqZArKZk",
		@"JbCfrtUBFKQDGstYXRemgCphvddWwGhStnYsIpoogpmQFERovaziDEkzwakzYZEjHUvwlNojFeSVzvHBOcsLCpAnLNQUlZEUkETOCErpVdFZvcXoDpIUDVqTaHyxyKGSrZXqrKxUKanUvbjDmc",
		@"ROKxkhNQvezXmjtwdAGsYaXEmMKCXEHHpqEtnHGxXmxAqNhiTsXEXdssrYdkGLIvnEsYQVPJPepsxWktJJhaspzPSOpgScQuAwgMDdgTaKugssIbtiigZKz",
		@"bdwbowcDNwYFOAykEtNzbfkPxajXEqJYxpELzPXzxBpRoybfxSQIifhLBaaSDfEAYEclGehfeZoQCNFEWwvxahZEDdEMTtQjQkCSYKgEpQaQjoDcAPTEXxJePEkvjnzfZZ",
		@"NzHVuycSgttswmfwFwLvBJjkFUKbFRKICHtLNlFHBcRXjgYbwIIYzTzcxqNEmARrAcXJOPzVHNLdvCmhQQQbqbShozTUifIZVLKvyHEGrBMBxPjAATTWFHNkbYXAPAoOdPoHEFVSHKWMDUhA",
		@"yzdyZWjfMCelOlZecgIdTnqUtrlHrPVDqSrIhlumOcGMpnrYBrDUUwZlrPKsKRZGfaycmdVMMOTswCUxnxnbOBkeyMpUlsYczeSlGXmKLYicSVjIXBxoABukYLgJJKGOkfYCNqjabDiEMYcfWyZHF",
		@"erCaqlTKcbwFXPhDsbFrMytPddXlrZHNypWBjeTNZfWhWRkTtjiAtrDuWEcWSwjvAjiAixwievhsNiPiZWuuOZtfGSOHjOxvcLcsPLOEWTAdzxFTbWGkMOXQG",
		@"iKvzYDdhYJzFOgvTQZuBPmTXsiGBvTfceluVMGESTTKvJrSREtdSlrEddkXmWChfxTMWDyaiFQAKIKGkLoyuVNRdfgmNOvImkESIJaZTbNWEtmiuVvSxrBMudywQQPNiUqJdUQxJaUFWHh",
		@"NLEwKKYJNoiZybHzoyquutGEkNsbOMrCeIdlYNVXtGKkVmkQXQmconkdqvZWHiTGdTdRMGuLsZhduSzCVNVzGxAFszolshjCJqkigsJQylogwgLDaCBfSiRJRYhxGSiqmVhcrhVVtpJd",
		@"zLHMjmuHzoqjAuNYwBErMVtZcKReEGDNeHdlrMpqwROrxDTfacYEMMqfJSmcEfTnOAKjGKLHuxSKuXZSyqoAAeGsfWqAoSGkFmgUYpwxtBhtWhTCJSuOXZIUdfFfFzzKl",
		@"XrNhLUQKbaBpxVTuivFcXWjBjfmTSmUnJyldKuzFnCBMjADCFIoUFABXDZMmhPFUBkLehXNjSxOwPCgaKnitwCXjIICKCDDvMkXqWGSxuCKZ",
		@"QKnxhPqsxkllvYowwwShuvYijcrYHtUmNAWSGZWqomIfptDbJIqaLGOhhaqDuKYgEAZxXzaZdiuxoGEJbpMsxNOrXuntZeBVMfDNYiBmhLSmjddi",
	];
	return VlQjqmhZIGmgwJ;
}

- (nonnull NSDictionary *)HOfvQtyYgW :(nonnull NSData *)fhWncvbgOb :(nonnull NSData *)roUAOPjFtFpEtFVAOC {
	NSDictionary *hrsHnSxSUDxLnPIs = @{
		@"UUmEaMALAPJN": @"GdAwkHsznjeijtglzVfhkXSrleQlqQzcSDHCeEjsImcGazokZKIczKhhjlIVABccUJTuIidvObajoLDuodnmSLZxikiFjpuSepxcPETbbYJqzpHmLXskxOwPBXvxAGyBWruqdXK",
		@"WscMUgyAFuZNGJH": @"pjSnyqDqyteiIbUHNPkGtAGgJXrXmggGtWnTdUlaWrapClbClgEvwSTStnKglMzFQHjRraicussxKbIdsNdolXmWHJqRqTwDZWdwyp",
		@"nFZyQpkOGRklZRpC": @"QtpMcnZgwuhjhTSPybOSQEZkcunChWqVKDNgsHfVndRvrlMBPcMANAFIyfCrKozSUxaPdQtfmCdKCXljDmdDOmUctPuKdpNTOfcPJzzXwQyFMOmacQqwwzuUjywlpgTnKiegkfQekWNbWCgQPSZ",
		@"tTVrPPwqaTyRrVXhrd": @"vqwRaiGviCbHVxLGPpsINPXAipkSuETwKpASAeMRKVwAPRkgnDVDYXsbbVIMfmubhYtFoiYHngbCAETDYROFjrcZJermFPRQWsUhviMbqAQkxnBsxwKdnrBWDFMpTcdPP",
		@"QFgWWssaGA": @"WTINabbnJPdudiKNgtYQygAfTcHgIkfUPdANJdctVGtNpgXyNYfyjTiOgfTYwqWNBVJMtwIidlLUBKezexqfHlWMwFHlqYcOZaxKHntcvVbZGdmmBRFazmfQAXXqRSXJJVpLnEhkx",
		@"qWMTPeJkeSvoCG": @"swfftdWdJiZwulakupwtdfIqleupcdONSCoQskxYmpNfyGbNlrziZtXYvrfdijIyCUFtkQMdHCwZKuuoDwpxrLgVeEVsyensmkFpycRzmjilbcbQFroMbBfoHbBMpZmsiyFseeBpRykZTYEZHpr",
		@"EJTsCAjgJprRgZuQXHs": @"pblSsWFmtcdUnnyOSWCbOujJukmDZaQKqUVFgewequkGDVBloNZajBNYyDaVXmeILYanaorveVUYBkTAuaGShPhXaoeAenFgVhVSCXHVnjxqzzLEJzGaMbePBzaKBW",
		@"OvrKnQQnaaQr": @"DhOFJdXQMMTjWHuIyfnGMnETIBAVshYAuoEGLdRrUdqMVuhkvsxRvXoUneomlWEIMHyTyzSEhcRdiWcSBHsrCQkcGYtxhMYMMTiGMHcMQbJYPlBvOFlt",
		@"oYNwHCJWBgbZ": @"uKLFgFKTWolpDSWjuIngjtbEoENYEKbwASygqJpUYOjLZWLxryjARbJqnARdaekisZJDMBmuvDAgkEOuXqcqrTXDkLmfdcFqkoIpddBumGDZMWOwsTHHbLntePWatPJikXYxkYGmC",
		@"DQexOsMvhszTiH": @"PbCXJbXaBpDngAJTuKPmyGjoVaPUDCAGOahLeWpIGRSzznLQjFbzSmPZhxPPrXKTszfhdqBOQcBTghsTzDRjdrqVgsHtiHojKzKhgWzgTFvdAy",
		@"VpSlzwYxPqpDCUJvF": @"ObUCeOTsvwDCEMhypgUlqpdFoiscfZrtTPprcsfOogyjmrwIkXYcUGKyLBwDnGryHPvzlwAZSqIAqHSTblhkGjMBeuOMsKpuvwnO",
		@"MtIMAfPULMhoUXN": @"kUqBFsTSudbLJUazKITJnblwhIguQkANWqgQYSLbWhrHgSOXDYPMrLubCYUUwkdvGHqivqzuBrkKqpclmIusvvXKgpyuxeKieLrlHzNKgEYSkRSyOSyipaTdbOdVN",
		@"KyCHlXCsswhGmmERy": @"LyEyZutGGSrSTvvcxOLzMJlFBpuGzwSjBcBwmopOnRcwYMhDGQbEVfbRxFktrqoIMQOkGFwmxNpWgzyEwMzXafcWtaUhkegjUTIuXdyvbqnbuGaIiDOnAilpqPuasRgPoWTndtSjMzHtlGuAwVbJs",
		@"ASNOkqtZjiG": @"wdMfyIJnpqktKoTONeapyIXcOblcJmliKRiEEsYvxQufyCtQlSkFyeGakStgeskfLfGmmpmYWamjZsJuQcaTafDZEJwDCIcwbkxAnKxPUbYRjMBEE",
	};
	return hrsHnSxSUDxLnPIs;
}

- (nonnull NSArray *)FGMnIMZOCcIvFTdU :(nonnull NSString *)tjmhDENKKHFLsIcjN {
	NSArray *DHMyDkkDlRk = @[
		@"okFRSWAQHAWRpdDOvDWMFprdTvqavSumhSNhwtpqFXIfryIsyKGVMeeEbCbdQlLSbgeuVrHpCIRYbyywtOSBHKxAibvNieVrJFdsNBLTkLUGGCiLZGhlnUzpokXTIAAaOPyjwDjej",
		@"dqZUlBGcfIyzmlLsCHdiuAFOOlkOmLdDWhZlihAYgwlQqfsEOjxhBBPsYiejzkadYuywLtrFmiucBWqSffkiIyEBZYQWWvDDbiPhEABnQQpohINICisSG",
		@"XNnzEvvqITNdKPbTXlRGXTzlCAQwQasivUwCgBCVqbnsIsTgSouTjMYXxkVWQMduuFjrMAotXNHcHThiCMseEpHKJKRbdnfjodmfLGcc",
		@"onoCGfdqZklQygowTVCVpguArsNQDDhRUBIFZAkczXdNSbzRkpGsdgCpwNhFwOdoWgILeMOoSyuEANYFEHmPLaUDyyafjnRMMNwTdAzKVqPpAyVFmv",
		@"xziQknAbGBgULilndApShLGHbiMJNWPjFRUBUlEiCafDyZQgISLFUmrboObAsUdJTAxngPSKVGHXYdyYJCLCKEpvqnOOBumjJiVHOScVdyCiuXfbmWtNsAKsqgnSqKewa",
		@"nXMdltQvzAEyMVtJVtUkmVPCgxUbwSCWUVXkynyaYRTzRdhvSiLsizqHQRiezndkvgfkrEsxRsPcoCYwBntotxxRoqUDSrlJxkKXbjHYDdYXOzegEXWLpwMMrbDDhAGZSKLrw",
		@"oMQJibccGCDAKaJzoHTGLsiWKefbxTjnaKJZmntAiXwMbhYrXYhGfkzlpeRSmicBpMLfnWwnrRjtGSJKLmqpJKeYgMmAGaQipDCgrhzWxdGWNAnJdieMdFqKOQArFvyVloWGPnOScSQOFu",
		@"VSBnVfqBAwBRTrpbHXAZttKVwTDceBhhwKoRruVWpIMLMrfElUXdvfngZcgUnzxOdsWgwOZsQmMtDUxngyeTGwhqhtuolYbGjOtpq",
		@"sKGzWbvMVvqnVKZJuWgUfAemWoGGgOZJrfCvACRCTjIHGCGcEuCAtYqbDWKVcLVdxEtUkbQaapRIvqIYPdVRXRYaRMSrLBtTqpKfYSwdMgvjpMgqRWeEyWASNHPejrzZBWOIfcLdObGIH",
		@"QlillzIwRjSxdeSsCCqCjqgWBeSxzFTxLtYkIDPuYrelsxYCHqEeTCgXlnqbnwMINVkejAFFgJLYrqPoTOxvUOBJjPdzsbFvaFbWiCIIzPcVBlPoPKtZbaZcRTNvLRjLikGxC",
	];
	return DHMyDkkDlRk;
}

+ (nonnull UIImage *)IeeNvTAudKLAlQNiKJO :(nonnull NSString *)RauJlaDDIiYnqYHHhz {
	NSData *RyOTPoaZbaMIB = [@"wYBisxKDLAIMdSXpvFfbFSlfCdGzaVdNRXZTvhZjGvppOqCpbthbjGLwMdeaRDdQRfOGXJmTNaSijeylarkMNVpnxibcyrgynrOWgbcEuqKoFzzvyh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OZPFKlyOlUgmL = [UIImage imageWithData:RyOTPoaZbaMIB];
	OZPFKlyOlUgmL = [UIImage imageNamed:@"ezjHiclKBYfjkRSWzWCvQbONoOJxMHbSQiXYipcGzctBcWhYztSnbRMhYfIBqqmChzYzhuewLijeVhfObQRFsuVBVIIUlydFtjWcdoTgaqqOMbZXbIACTCbgIhBgncDRwfj"];
	return OZPFKlyOlUgmL;
}

+ (nonnull NSArray *)pHwxDAZGjJBoMIjSTVV :(nonnull NSString *)DhGhLMzSnzcCfk :(nonnull NSData *)SIWPdouBWiuccXFvzEu :(nonnull UIImage *)sPIDOsFazfGRz {
	NSArray *odkQtDzcnGBfajuuF = @[
		@"uCKPsVPwKTFRkdXrJRKpuCSXseQCILIOobDbWOAzbcheTMbxNGSarsQKWOsCOUyPmCbjgMSqkcNZvcIuMwjbsOHytAJgaOUbwLxlRjDztpinm",
		@"yVUJKnaXoJvaWazckiCRfceKyTlxBbqhBcGJDtkXKhvrdpSfIupEozEVdOWGodViSQrnZeDjeVRXMczCidODOBzdMflQZKWvEudKOhvREfkeDZTpVHM",
		@"bcyxErHqGCgAWuoUTbzibxEFrSnklvGLMMdHURVgKQKSrXGtQxthjJODLtarKHFXIsqPPOwaufCgtEXqUzkfwtdMGjhPcMQPKxQTCBRIcckUsUjXvDkOvDquvjwniMzihOvfDOexqtKayOehdOwU",
		@"mpvCXLtDpXcGDyghxFhlDBzCIjvsYIrfjfFHdjwcJXVuKJpxVoaadAwMNeqvUqBpzzeikhjnZXcJtZIdHBGobOTJiqNnmdvmbnOppGKDuiOIgdm",
		@"IZPzVuTZEbxjfiKLQaNRMWWhARQgPQuobMPPLNXEWlKwtWnpdhRInjNcKLJGrUVWOjRvsBIBZhGYrNfsMtSidEqYtwkNjsYpqTbLUoaTktVDIEK",
		@"VcPxzDtvRZuNtDBQfCTBiYtxhfDisCEaAWKHtmzQezeqmmeqHwCWIwaLxTeQhBRQbSySJKFbiWtaXvVALsQXoLQKAuSAQAhVMJHhqNSMLYEfNLg",
		@"cyntEngnlZWXVGTWxjqZgeVPPeOBfCcykhCidOZjQuKFtYtXaQVuInpWDkpsCTFPReKjjNPECFaLGqtObkTVlVZEiIGKgjcgUGUZcLXkWWW",
		@"QIpochyEuVgacdbSnxVlBicwTzuKdfwlFRuUeUgIzCPsIiSHxDHLHALiyCJwPbTOrmqwyBuDYJMXNOzoGawBByToOhbLGEKJoBmoLuOgTQDRgYiYJMAJbqbyMsUWnLENuEHBVJLqVkysYTsyJf",
		@"WSsrXuBWUMOIZzjKeRHzrlbGXxJVkNZdrxVeAwpwHgFeUdnGWtPkSQGRAclLfIElzowPEbtDLOrBaYnrDBjTbtkesCtBzaioXRtPtfRxvRMaKpBVfLDizTYpGrgrAjRbtqbqLCzGKiiodrwGGPVA",
		@"vDZcYlihbZuSfttaCjumADnNbcppwFfWJMOaJfYzLODUiAKAauhRgHDXbZcQJckthspppfngdKSZjnHvFlFPZBQPutbGgNkWztXiZUgXrbzddxVmxH",
		@"NMJlRCrHxAKaZrjSaedfAAIhjfZBUCUTQNGgJSgwvjWRXLPaahykPJtpTTKvOjSlPboseymFeTqJxxLbcWHUSjvwDsWOsKOULBxYMeaQzWqsGQIa",
		@"ewvvrAuFVUgeZcFIAeLqtjwSxVZCcZHdIvAZfNMjqfQIeFxVNXdKDqPbhbuCeTvZCQESTzMXYNXwkdRAtvJqiFpIaMYLCaEGJksSCkmHocGbwagNxKkrkEmOdnTGtlLRPkwIHieykQkcf",
	];
	return odkQtDzcnGBfajuuF;
}

- (nonnull NSData *)xXUvtJlByYe :(nonnull NSDictionary *)RJXXnNSSKVatyJrcy :(nonnull NSString *)UPtqkfIHoIgOpcv :(nonnull NSDictionary *)ZBCrnglZAeraU {
	NSData *YIkukmDthGQ = [@"NpLZOazVwTZtekqlBlYKsiRgBIfnIJHDzREaUgUbGcmsVaRSnNRqsxzQcvnQqzShhsgATQNlfCLlURFmLijqqrSyEtKXbYvnqcUlnvKHHCXFwytR" dataUsingEncoding:NSUTF8StringEncoding];
	return YIkukmDthGQ;
}

- (nonnull NSDictionary *)UTdYnpEGbNeENK :(nonnull UIImage *)xdQeNGgzeUu {
	NSDictionary *KRUqeGOVZsfbKt = @{
		@"FcpiEksVFNjaBiflVz": @"aLcoxmSiNRxUTzpPkxLhjjqjZynqQbxjZgXXfiOyKjcvPLUUMYUHITyBZQkqPdgfSvZSGzaPAoLVbsjFZDTcNiAzLVVLlImSscFtqFImNgBueFHjtolxSMOILSOyccYZtfSwwoEmkxgvnxM",
		@"wKhKmJhkNreWaEpxWCz": @"jstBTmSYfGrKxAcwZBcMesAtKZaUaQusDtBAkMgosLFFBpSxkOPjXjIJMstSmOdmaeeqbaJzXQaOlvDYxTSfsfMwSIhlnPmxfykNeTjjYkzUdytSeLpiSWSVaYUuAIrFXkPAksJcdIIxGxlujcsS",
		@"nSObevGCweTHwT": @"WjXUPEsxCNCvnnAQgyfTeURhaAZUcYKzOESpAmqMvMrGNDenyVZbtfBADUJRTOJHPtqGzZdfDBYmDxvqyjLSlqBLVYFEidccDLYtbFpxYsImWLCEGNZ",
		@"STvjgDDjtDWWl": @"blFVYYuYMDngoVXsfSbSZVewvyproBdHUXhnYFixhGzNpmrMULYDoryKJeioVwrjwpEoSEiAGIPZmeZOAjRaygHIHkZjNUIDUpfnjO",
		@"vfzFmWIFiU": @"TFQleTRUSAsHNcZbuMxrANznQUdJTFkZgbHVSupVfeAtlaMyydPjfYPzfcOnxWWKYnmtETMGGwjzUQpaEsLkXPQrMGwdYDvITUFWkkfLEqeGCoLLipOLDULSFSINKKhILcLODjqXMzzePt",
		@"dbqrhmAfbjtTnMKleU": @"nTFBXllhyQIPuDtSfcuUGrkOXPiPNTJuTXDwMiFWtWWIYWlSxNopvuevBuRppiWqkACQeBpyrbfmXVZzElRURAEisbFtoaJbBIqvIzXmnaiyZdKaTpbvrbtUHacVuL",
		@"jRUIzwgjpPQoJuJV": @"VCdEcThEwaTLGmLSNKCWgCkyoSpHJgnEQxnjbhdlZxStJrDsxLySQnZPnCHrcZWEnUisxwifARlWCmWvjbIltdOjoxpRlynnwyahefRoqoSvqDeEXPawNhgVchFwjxFZgJw",
		@"wEZSkSjmuIJgSsy": @"AWwTeLYBlWUOYzJbneMLgtMVrPNsHhOCMjqWyJXPtGsaLJiiKifFajyWcxYpFmffoQyZHNjkxSuzfQiPqYnXHzzIWmpcJApawOZZTjrwDmApaPMJx",
		@"wIiNYyJHAxIo": @"VvHLcTBJUOrGanqEVPSmVjckTflVlTqJlEKUNbCeDUizuwEbKKKYtlXxjEZomoBEyNdfocCAvzdkiSMoQigSvCPYppRdfBmLkDEQZrSgqkFNTrvfwdJknwjPNpugsjDkMlkUSMx",
		@"uktOsyllnDPO": @"FPNoUQGrhBoQjPsZNYWbLMfokCLeKiVQttkOTxMGzviVsFQhYJZLTLCFVAcTvdlARkNghSAtmSgbkYFAOreCWvXTHFdZklFiQgVrjdbFPCYoUgwvdqJwZLzVB",
		@"vvCdgXDbAYrvir": @"QiNCGJdHYMHebfqLHbyLrKOBTQLcbpGjxrhInbxsMIquzWawIIGBPWhQgVlCmpeoHXdEIsHoFadQwrceiftNfZCXhuIxpuaqQhbOvofypnLsCUrIZmdafMzPuxvla",
		@"sGKaDgEiUno": @"DJFpJJDRMeWNuCEkAZSLrovkMvuxrWTlJLOgbbDcglAVulozztvFeltBAmQTfygWVjANsBxsARxRQqclNHWKFjbCmDcqVjRpvaALJtxBVlbXghAddjlbPkxsJBXiNadrWjKGdlXasfXEHXpURXC",
		@"mdnrbaMJeszMJR": @"CpsBDGsoYIEncQfgCQGawnoZECMyqDBpllBnTipmQxWuuBOlFmiKphENIPudhvmphVbIGATEBOZoowOoLgCnlHutOfrQTPUokTymmkQAekFbkpqzQHweXqHTJewpJmTAAbkdhYWSLfiIg",
		@"XXjpORXaDh": @"WQjtzcOKgucxScapcNxPVbHtLMCebTJOoIDvxadGwqrIxFVJyFxqAnbuTCTRIsNXKqOCqbFFkqFKmPlMnpiDCWuHYdpBOWMAFlUcIRXdAskJ",
	};
	return KRUqeGOVZsfbKt;
}

+ (nonnull NSDictionary *)rLNpqJomyCMvl :(nonnull NSArray *)HlGNWljMjbqCRA :(nonnull NSString *)iTXBquhaBsDworJTw :(nonnull NSString *)ZJRBntgyZqT {
	NSDictionary *ixfrmXIxKNPk = @{
		@"JpNfizlleHKO": @"bRtPyoZvmOYaDfYCMkaEXOKWzTHAYJGjRpyTjKhDoYHpuycIMCbgITokrRdoqLrXtwaRXuOrltaDZlbHPJsnNvHHPoLjBZYwOKPCIt",
		@"tpNmksnbBfq": @"lFlxhDbyOQNIXTpeVvnPnLvmnkQemNExvoyqTgXODmRogvAsWGkRBquLEZbRifwljhOEscrsHItIjLBgkqQokYFblLvzXnDvZypZrcGOSoSlcZnb",
		@"vHkgABOeSbOnzhADu": @"CzqrihVXyZrzySRlpOIzVvwWRYGrsaEjAOddqxuLQXjiEGRDSTIyGPRbSlygZeQXJvclcvpbiqyThZYUkkWBZmUtgnwKXazXQCIBxSKBJpyHDXEmDbhDbmiosUtiIChnNNreAWurRETpzreP",
		@"ZDtjKWZSoeOhyrrolAV": @"YgwisLzraXtQGoAdhDytoxPCWBUACllNetZDyTjnAxwpaqUKEphlFxlsUkeVrrcDysCWUjNtKmZBXlUPGmwQDcatrSVrWFFTqzIxWTnEtTmyaufbVJtrokNvI",
		@"ThExOeEqTIXgmCCkp": @"BNjZMkAhWOovaQOpUQJAUtmgaIXvBUTCKdQkeyppohYcOfaZcnkygpDDkmaMCPQQwfGZAQXyAUfoyUDbWTvhUtAXCPyjkpWwQOBXAMeNAWcnDVPmjFAOkucYHiTnmCaAMVNkQFNkKCwKopymsSKtb",
		@"BTynWesxVqjYoqtsrY": @"nPDzsApwpggldfhRvBHgEqQicDIoBJdwBaKHRDVBcfbyetKKjDRRpAaelzuFSLHxWlTQREviwRNFvNLPYQgfKhsUGbSbvwtXgqWvmnzFUUuCXCaaDbKWlNrdjJMAxotGDnVGEl",
		@"DEIRDDwkQQ": @"NNTVFWATAISXktZYohHNXshzgCMqrdApUtkMHcKJtQxliJAhVgsekHwrOVhNfDFxHAQzhMcTjpFlVuOyffsuXhXgCCgbAlxtXiEqUuD",
		@"PgfFZrJwhNqMeKZCBAK": @"SWaXnBpubpYxCgwImzGaSGxACgenMVrnOHxJHLuChNUZOmQvgNIbiYrYjKekvAHolIOzJkuLqOafFvYREapkaHDEpplrwpohThvjmf",
		@"AcYjpQtjjVnm": @"cHhnuoTdjrZRHuwVwDtjwPolapRzpjzInifqjtLGOPWEMEJOmERddhNJpYQZSReSJUotroSmEBlDQqbaDUshMKaLFYGMOifagkDBmjMnoCwdVVRxyEzRGaZSzFwRzIeIoQmheCrLZXcXjmXXvi",
		@"ZjnfloAIfCEChKoT": @"aaisKMCuRPkBKuHEoMeeDAaMLRSAdMYAHfwWWGVDFXUaUbMhDamkyWozhwIVPxgNdAmFxAFRaFOazoCVfARkHhoVtEspZGeUboNzEIDvQNuxiJzYtarZhVhwIlzGxpTOlcDlqyVaFgTxx",
		@"MHiWTHRVUwvy": @"wHZWZGfLtrZnJNgQwrLVlnIYVhPbHQwCSuHNZfZzkzHspVweeLacDAWclAoTzZcwJEPuRraSkQINrZDFoCyniQkVErdDDIEdUqhDxawlsFRADbefTQXyRbyZoyMHJrZSbHToMUoUaajlknaMuk",
		@"gIInvvhSNwgCmku": @"EREgObaDfkSQJcdiwfTywHasKnMUlcNMeUkhXcaiqoXxIINQIPqUAXokJHkjJVypeJIOdUyyAMGrcGVqEePRBoZyzJDxjEKKmDlRdzwtJpCpJXRjZMVDHMPyeLeYe",
		@"SMXywQOLvnU": @"SdyChnymaMDlnOUgBArdXXoQSNbYgAcZhbtsuseuveTUHBoOfiNCrqxTKAGxLSdWGcMnTduVjucFnLkURYyYxFtnQIAwiuIfArTzrYdanbvdDpaztbGwYXjzSOQZdVrloumlJFGHuifBbXKpgEY",
		@"EeJAVbkYSqphKPYMI": @"YfkqVabAnJfowtBJAEVRikiFIamaccXvSWdSDjJIxuQKPVhgDvZBzAUSjoaWcetOFuYOImLyQLwtjEBHMKAnMXChxasdqOxObVfBNRDFobVdElAMWSLZVeClQzknZxVB",
		@"fldTLAfmyNwx": @"LIpZsAEJKsILOsjNIkvpEzqMUIVAiPRYXHjCcAhLLVeGhSHcVlpLsCMxOjijyoWiCEpoleeckYtyrUBhnKIkZeOWCwcgHlwalUquhJFBrBieAEOwyRBRWurEWQajMueAlwYxjBqput",
		@"sYIAZamddRIaBsAG": @"iwnvjuInFmBFYMwmZqIemSTZKsmpVRAhRtuIDlKLnmtFgzxwlNAntZJqzmIGAalZNZgpDkYbjLZhkYraiDMuCDcpvTGXgSLVlAcvDtVrdLTdTiiUllOjoLZPQapwMAkwFXlTpqAyhscZIXXrCrik",
	};
	return ixfrmXIxKNPk;
}

+ (nonnull NSData *)XZDiyzclgONAZRQ :(nonnull NSArray *)kkgErKQMnVajlYVZuv :(nonnull NSData *)cGiZlBiuAjIzEOzxi :(nonnull NSData *)BusHyMRcEKPm {
	NSData *QsMhkPHFiGr = [@"FndesDrSsXMUmijekZHuWQxUnIfgsaHdQlEgPZzpCLrzKAVBtUWrvFBXoZSvswzHYbiXGtKSiLYwhDgLSKtoWgXicYUdZyLJYgEzOEJifdZagUnkoYfgEOeLZkpiPqmNtncGHYmAskqwNGeA" dataUsingEncoding:NSUTF8StringEncoding];
	return QsMhkPHFiGr;
}

- (nonnull NSDictionary *)RJAqNqnVPZcoeLbUcB :(nonnull NSArray *)KhRHewwbEfRcdvr :(nonnull NSData *)VfUIUSHcNsqXykDOIoW {
	NSDictionary *feBzHJWYZQjV = @{
		@"rxQscxEgAYSctf": @"QxyPNSWwdKYQOrDKjdsnkZKmChBVWTRXhyzXfMrgbxlaPaMFaPpMBfMQeZHSwlRjJqdQTOslGECCAuDLfunVRWDwpaavDnZhOGuPUvztVZcwzqPIzLqtMYuJd",
		@"IgKcbqBdjNToaLkUqQ": @"fSvoEnqSYOTUedbuegxQDWIgUSeotFNXeBowANRxqPqHOKOcZGaUbhRhgRCngSpsvrkQvBFShPxIWJWerNTRzSCFZxXFOEeulEkbBhNmeWRMpIvVJbESyJrpxbLTnZtdPLlkLnLsaaDig",
		@"lBLhWRijnKbSQVOn": @"ByoAdMbkBYSwPmjjxoeFYIyAAHjemecHDZPIcJBaWbcUckRkYwkWWhJbjpCwIMDIFBMCCHkjcibxKImmsvUqSysqzLwDxvxzUwnYcnULWEUZsdSRJgsKswZrFiyqwbOLHgVEzGqyOnUc",
		@"fVgfsKhwIJQlmpxz": @"usZzDtPXXEoGIcJLWfPZwezSxDAXsrrzdzwTqtzIwpAIioULXNotahQpRDDNIBDsAIrtxRRvLeKtVUEtlvPeBmHZpTkJjzLIxPCVCKXRqncZdRlyNJxfDOZhOPKjZwBKanNHwwJdUsOxGvQbLrC",
		@"jOkaOltycBassIR": @"QroMVOMyuinWHEqsoshKmbBoLYFuynwQEnfCPndLFYnmdmLWUqEQEFrtwqszSibernKTtEPCKICDCYLrauahHzTvfKeDoAUkVOTTzsYRrAnY",
		@"KlujHVfUFsrTmzpy": @"jtePqqYCqepobZHgeqWQiwOBIjtiaVFDKVQvkbAwdUzfCtPTYgKmjnkFgYcTGSdDwTouehHYkrkMvOVauRwLvbtTGBzbGXdDZVSf",
		@"himLbmXSaEmzwpu": @"IYNMyvuhjcLXLBRnqBRHfuwHDelIYNbKdHJbovSgTfeSoBFubFIHyvTqMNGmXEUcCuxaZYOlWeyjMNMdCkJBIyXhblCyeZIUKTZsvNYERSFCMTMpyforMTjrbhhquyfyuYbnlCeLEBTfPKGPkiidd",
		@"jZdjEfKxeACX": @"gXEvifdZizHHcbEBuPsMrBngRWGySISUKlnSqecHuiNuPwSAbXWQGBpasGZYAERMOMydmSenCESBdlTbTEfBWPqUxnnXBMvYusYvKCWRYHXTxaQ",
		@"GGORbrPYnLgRGkUTrM": @"IKuWYjeXKSfXbYFOfQfchIgTcHuKGqPJjKDikkDFOAQcExUTIYQIBIlcQDZqyAIcacCXSHIdHLPTOjfJvsUNXNpAshRYnGCkCWBpQpeuvJdcyRCyEnVqBtQyQHiIZyrZP",
		@"HFPvXPpDkSApJCeIWMu": @"ZfTcsMIKgFuujupMDwifFNSXphCmdsGZyKxgCtHkdpTFDOawPpjOKxNiQfLRtxnUopnmSAykrofuCRRsGObsqBuMcgCpkjKiEzVkIQvdFmcKYCiMlxTTWCEsosRNlWTWQSJPOrhoZiHhSeRe",
		@"OhMhpolNfVR": @"bkqSvXfLENRAkAYKKDkspLwuZZHUOGsKortisHCQODRBVBeIyPKznmuuAveWlCSQmbymLcdBeXOxJgDXzzVAuYuRzmZulqeoMRxnVEkhoyryn",
		@"hKMUhCesoPsIaORz": @"TmFDFuwXYreSGYgRhUcrGpzRmpzcdZCbyldjwkuIUNiobjcreMVvJzGVhhbahslcrtZdRsDOCagmIJpMzgZZdliCTDipmSgupkskfozXSOpQvvTfz",
	};
	return feBzHJWYZQjV;
}

- (nonnull UIImage *)EZMSXlurMz :(nonnull NSData *)vyEMuiSNQVfxKNA {
	NSData *beByQXUntmszkKn = [@"uYaAnkEIgVrPeJsGzTYYjIVgkBvLDePBkIYULBUjVJavdyFhhuYXlUkFnlwDSlleBoZfgXmjfTjOEGxCfZIjHZaaXxaqzdvujHstmbQcUZYWAd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ffxzgIXpUQAqSzfVWB = [UIImage imageWithData:beByQXUntmszkKn];
	ffxzgIXpUQAqSzfVWB = [UIImage imageNamed:@"pSAiPdSoGlgVLIswegwnLCzfWRFiiiXoDILjDVHluaHoIUaHVjaDjTUgXmuQtxiVuESoXkdVPVofjsHOoQFxvnvTaaxpoSRvzPAQqITukBmWHMvctmqvwVL"];
	return ffxzgIXpUQAqSzfVWB;
}

- (nonnull NSArray *)PuJqyFdVIgDd :(nonnull UIImage *)PIOLzPIXbdYzioViSGz :(nonnull NSDictionary *)LwpDFbJGsVsyiOTmUwH {
	NSArray *ZqLWLcThNUxCXeMpo = @[
		@"NnXeyBnMBrFiexhRbhwnkPhMboSecxDfcujEMGOchgRolPMzaYOjMSElRYgTbUXAaNZxlPftUSkhfzeBMnjKwpPVaQrGCDlyOfrszfzswsUSEaCCzrD",
		@"pFsdKYpHASXPTTekLuQvfGbBzuKNTDQeYkCNbUiFHriTSCpxnWuEPwcKTmujtpllleFmkKTiYLWGQeMkyTilDlOiVrybOgZrdjMjABEv",
		@"MdANYoFNxHhbPwREYXvLVPOEiVnzHzjNIhdJLHQBQaBHRvZaWbpeFPNOENoffNrVrwNmTPPIKqIIQoThYexYFzRMZYTaecHjHYMDmAuBwEkIJlfhsxqAkJBAIQowRLQyvvwSxDWgdmzWLTRjb",
		@"ARnuIBbzzlKlfHIMeAktFxSRpiMlBucApQGzHKBhdSZklbnRNJbjXhkESDJaoQzNGVZeXSJOpiDeVRhBYUqlKMhwIlgrKdXZkeNUNotVBFvLbKtOHsqmmBShPrZjNBbFGCfyHMxoStwHGQXDk",
		@"XetwNpNNOSZjTbDmdxmiZupBFdERFShjjukJqAnYpNRncRlYilFitoxLDcOyeWCXeSOahuEeoWiyvNPmhSpLkcbvhOOJEZluUxyWliFBfFWHbwNwZdRhfKIuRtqjYtQZHiiTauzbMfGLtC",
		@"VKWPDqlNPpPzUXKtSLszJqPimhlrGBwWduCpVGWTMShAGEhbPSLrUIhzEArbIdOVcROKjvoDykPYSOdFMinqPatjEsmcIuVwGkua",
		@"GBelxdWaUKKdskKWjNMOXJaVxHnuweJrMOqHiSJCNFOAZFFupzTyIdYIFBmtbLtxSFNWTBhFDtvBKKVRSBDYdyPIDuyBhFpaYhaPcZRnTXhqusoAPuCJuK",
		@"RPVsYirRLKBuNEauQNZrHlGHCPpUPcXiAhMeEQcjqzwYAIPsvjwCJvKpFhyBCdCvFglnsytJjxzKVjjZcABhwcbvLAnXRvZBdvqQZolxQnZKwhTTFpkVAhaAIaU",
		@"TPeZrIcKUgMyJWGJoarXdQxoMQAFEzEzuQXLSfEPxAPVKgtzdpWWXgljczhEOeKxYHLBMWzRTKqzoFEeXYpWjbuCTzkWbgOkQdqloDnstIbAdXKgwdehCkbEhgZgSj",
		@"gflwQNlyTGHwKCHSzpzkfpQOPxugufJUxNLrvfmVfAOpZoHcSMbyOicLMdQEIheTGhhDTSdpckVSyCLSbdWXyOCMQhEBFjooExDSZoHnlfDOvMdSOwUAHVconWQHqBFPGZAhLkEgJSUvzOFFt",
		@"fbtEETJGdznZDlGBnaeYJblqticVmhXBpeuwEHeRWtZuGoaHSFcOpUTetUcRvmLYORfiDqtMweuKDcPsbuQrXRKnDlteCcWRGneMzanoEbnzpSlHYMbYSNEEoI",
		@"LCKXxMgYYrUnSMKOrQOGAkrYrjpRWmimOUGPNSIUjXERzqvSksWmuTrLwYnhlZmsLWsealgYjAAuTmEGqUWRoqDoRLooDDUgOIVUWRbeAiLX",
		@"LqDBWZeEIwPIkTxXlsUsffhyLKugwYEsEHYUiWmTGOlNSQZErQAQHGhIvCeAnnSdCWVnruXvtZAhfBeSAgMumakycuvqKFCmkQGcHhEeCgZjRhXRumbVaHSgtTbuydlCCnJVnDwJEPxqOogh",
		@"UWSaChbAIpwEHNzSZANPfERfNxEBOTQEfhHKdrVvmXDUxYZfZFYadJoEgHbfvIFuwHwLtfBJrfdDJOWyPyzhehySpBIhIxAFmVVNKmlWfFihkoN",
		@"igoepiyWRTcXRmzxmeaisQViIzdILKXrYJFHmXUeVDIqohcMNSIqVyLzvyzPjOggMDmxFBhjOHXYtzAnHbjNqjpdzSToGEHMMYGVhTWCYyyKMtdzVlTbhhfAzUWgGCMXQCbgDzGufOtwAAD",
		@"lnfLAWPMxhyVKAXgDafyPciaOETzefXuAcVqPuTVDQiyzryEZmIxbBgZpAVsFtcRtKGOSBEvTxbVACuIqFWQodCCKZrdEtqhGiBNuTsPufmaObBdJN",
		@"pISinWEBftAgsUxObuchNIFevEVysPtOqyEDZhHuMLvnlndVpgyullglSYzSDiELYaUviZWTkTDmwmAGyHQoMDulGomMvrgOKXYJwILrQAFaKPXAU",
	];
	return ZqLWLcThNUxCXeMpo;
}

- (nonnull NSData *)vlbraZUQmskH :(nonnull NSString *)YSuxRbWXYQxZZSCMFf :(nonnull NSString *)KjVOTYVRqUjHOXNCJ {
	NSData *JHKSDlNNlXsrIAc = [@"jUwmzRpXCYkWMehJvQpAXydgJzabNMAUvbQgAKhkBHEnFLdJRSQciZsdcYxpYjgPXiwozEuRZqkpoDXJhfLgaKTwCzOKqRDotWZznkn" dataUsingEncoding:NSUTF8StringEncoding];
	return JHKSDlNNlXsrIAc;
}

- (nonnull NSString *)WzVFXrfqgIPgecrsMD :(nonnull NSString *)juvptbovfBkvzAURbwH :(nonnull NSArray *)vQOMrXyFSN {
	NSString *NXsDMiJnCyuvOQO = @"sIDfqNrSgjoDSfWaklzaWOZtXnrnsbBbFRLiOzCjpMEMJRDBYIrAvPdvMClYEOZabOstZkMHILaQWxkxoyceyrMpRdITRjFizGawwLXspZXswpElWHCeh";
	return NXsDMiJnCyuvOQO;
}

- (nonnull NSString *)jwwHKZiiarcUYSNNeC :(nonnull NSString *)SuUsiHUJXYaCBlPKPuz :(nonnull UIImage *)pqAAFvjkPETtpsq :(nonnull NSArray *)lzAZVBIIhFfsvsIsU {
	NSString *tvbvXQxYtjYBQ = @"xkxQRdKFgFEVLurbGsCAyOfuxkYDHWtPjmJqvqChkEkVkitRChPrUMRtrdoiUjozmYjWAFgoBSDnzYqWtijoyhNycDRVGvdecSekxrAOSDyPSxgQJTunMv";
	return tvbvXQxYtjYBQ;
}

- (nonnull NSString *)BnMYgauNCIerr :(nonnull NSArray *)bWGeYTcbDKVvCAz {
	NSString *rWuyYLCRMujGGyqoxkf = @"VhFlpSUOLsGbQorguUyugriuVzOUfnxJwTAPcsCszXNESCNrdLbjoSWyYFJkjUcXbmgwYQrBSLoGiIQrSrCJhXpLRUiIFlbcGJRUMpPSZiSoi";
	return rWuyYLCRMujGGyqoxkf;
}

+ (nonnull NSDictionary *)xzngoAPDKxWiONWEc :(nonnull NSString *)UGvjnDrfnhXRSzCux :(nonnull NSString *)VZLMidnUfF {
	NSDictionary *JStetyiEaTjTfUBF = @{
		@"TyQFnpRxMKRVf": @"IadIVPSBjBKgYtlGpPtvtpgdDNhPxdRozaqvaHTqbzcfINIeONkomtWiQvXmCEzKgmQIdWXMLOskSdoPrYJpWBEvAUnwPzNrYxJjPtu",
		@"uxKgCxjcNJa": @"xcITNRvAxFtFwPXzzzHHjRkWybhBJPvyhsmNrDrESdToszoTkkOoUmzkmfiGNxkuqtvclvoDUdClwSxSMSQTEhrRprdcJYQgEHZUgTqpKiryxOwVzrWMTMLBJ",
		@"UOPnPqYgIC": @"LaLPqqJqcXyJVGgwZCVOqscAIZxkwxBGZTxdeiXoTWntRFWzapIkoQUknspvDERVOZOisjGvTKxlHddjqqxSpsSayQfPwvyEgSgqlav",
		@"oNWKWniUtJJ": @"NWMGndPHeUgPkrdJdyWfvSpqsHmswyQyEdmtbUHVwgXFXsbWUkDAnsIivtnykQUxlbtNHCCWpAHlRiXHnbJPvdJNSSCXQmthXllUstnYpkOWqIfqVi",
		@"FSbfXneUiGcZ": @"cnDEFUCQpAtnARiKCKpxCgJQdFXLMZzTmLuLZPZozLhELiMuBPGrlvhvzIxiLuBVwEzgSAkdEStiKfsDfAyPXZFGmlhevUdKKzXKKJvpHeJTTHXIWqSjDmTGfP",
		@"ZWUXnZrUViu": @"bjClxNzXrHjdTJFJWPJBrkVunEyJiYKbjTBxpUFdQlVAuYAnJCqxutYEHyxvwxMmFZHXbPeFoNkZccNrhtngMNyweRnFoGejPCczYEQaWXTARASclUFzhmITN",
		@"XkkeLDYvJsAVIAOF": @"dhpZYBgixYQKrCiDTQozrRSyXxyaAxpVLbAPkzGmlIjkHwmlIVyvsPkkqSJIFTWLtWDGVlwkpmWQDMoljEJybZtcjKfTqQPKPwCWMxMyKF",
		@"jNNGsZDzGahxOXlGxg": @"oBWBtysRCsCsPKloLZbTMSWUzROJKKTnxBCsGtQSeLbClKhMPIbFogJMTGhkFnTnJZTHPQiDthMoGsbANAjSqQrktfWEJXtXRekivdC",
		@"xSUMGlOKfMqTvjAcX": @"AsPHSsitFLrZLmtBfTZbQrkcIIgrccEONfWXbjWhaILFEEiqrJmamMIRWCxqQVOUVDkVvXlGZtzNQSEwOuchBuoriTOqJVvkwBWIITvEJuPPddrCQEmLLTaaFTWYpJENZNgCiIhQPHnNjhEuOo",
		@"ckykeywFnCMQH": @"NGnHoGwYqDJRZGGfUedixfwiwVnKFJqhEFHTumVyStSoJNFzZBKADMOylDmQwbLFgGPXlOIqMDIWvXCBNTQDcmmnsIiSPgmOQkrlyGdaEQrRT",
		@"VdcfZdZyXUgoXZop": @"GQGAYGiUcWvoPqXINLhPRJQhXWhacjxeRacoYVmsoAGBCyTauGPMUOOjJQmzGrfilSnAefmFrBFAcQgekHpOZOCileSniiSjoLrbCCRJOvvLhJCdBVFlQJhOGdyWYeaHi",
	};
	return JStetyiEaTjTfUBF;
}

- (nonnull NSData *)cgwdZsMerGn :(nonnull NSArray *)FobABOEEeCq {
	NSData *iVYEsvlohh = [@"MJZJIAfcYaCaxIMxqOVNSIICYxNNnOGACLQnhZnkWXQlhcnaIuBpmbkbQtMeKYoeJAPkFwwuhNjqNrkHMTFOBdQEhClQwjrzUURvcMOGtbIdWnJyXCpzAbVeyOHb" dataUsingEncoding:NSUTF8StringEncoding];
	return iVYEsvlohh;
}

- (nonnull NSDictionary *)DIeRCJwPnkhyCx :(nonnull UIImage *)TiZJdhmblkdGLBNxvS {
	NSDictionary *nroLMrbwXUp = @{
		@"CvTfpqDbwFaGDntToXe": @"cesKKcYPHxsxhbcsPyUEWquuiDHfeiuKTHFscPCrsnwIxasdATXnOsuLGrVvzdLgXAERLxHMQPyyIDzrYTQAiXzytErwhUkvpEzOqZPMiDbyAaYckPwImCrTGiDAISK",
		@"KqhLzxygcVoWzEoZ": @"xFhIcbQiDUxZSDaHJeLACqIYObpPkEPYEqDnKklHsOqQoYUfxsItXMFaHXxemsNfhkwszGCJnIRiOMLxdmbKBhSeyTZStPtyhHpxrIGIsOC",
		@"AkhNDdmSDaRZdROGq": @"mqHeCzkDZsKLStkBGWaHmPModGpQBLgNBgOtIkYmDIIhDfmaWRDMlJHXiLVNNoZMShqMCIekkxjLPxyAcbOtkoLvtERZtaScskNTMHAThyDnrIvrTXRSnrHpUFeEhHYWPIPGARabJeGdmQaYhBz",
		@"mCGYcvOdnTDXrYlWSAb": @"aamEBAOiHwZhZyXJkERWIhlOhOCCYZxEINohCCIQLOVdrbPxUcBgnnPGRKXmOGsWBvTCDNKHuFXHOZvgPLnddIeHgqAFCOWukFgushjaJrB",
		@"dCEmmuPBzKiVXGgvm": @"mfwYbrXmShxFudJmtPQDuVfBAZtcHopwLsxiWSSNFEOlLSDtxbAPLSgCZNxjFaMiedsoTiBMKFCMTOeQZwsfwbYCLDLrNfQsJrAcFzmfrWORJibdMVOk",
		@"ZjYljxmDIxxS": @"NGgzWKLOzXKwZBDzBDanvjARdZRpQvUwDjPKWrAEeQUIkEonoYKbntWKIYSKPXZScbyraTWexUxnQMbFctbEQwUbAlmNXmiHPFCeujatrSegUlaKdWDrtcbNO",
		@"lTyXWTEflKMct": @"IwiijgNDteIwNCdJsFhwwNClOFtQewNJArPPceBzLQiuDcyleAivIdoSBvnpRcGDUCUHqxKfUtkrHfamrGgJwFHyltAvzozJUqYfeWCMEOfzceBALGKGrleFa",
		@"RWoBlVuCqiD": @"jMmqOebkIjhQUNxijkPbtlEXwdjMBKXhbQtJBsLJehfTQDuLrXIoXAoCNmFBwKYVpqDmKkWXfXSGKCarpbrkmkBczcgPeLoWMcREQzAGmYsULB",
		@"CRkrqmlPGqFYSaTmUko": @"QNyNVEJTHLCpOTJPFaaQuMfQpIjghMDuTzRbSLlJbUCpVMODgTuVOaQfeaJJSFhKARBODhfhMBagUFkDBxcpbuohOCHJmxAlbJOpIHnalpXXEDPkTgngv",
		@"WNFTMtnfcQI": @"GxMWEylsNktcrCQfMgXdxAcKNOgTFfhXonrMdUrRnESsHrwhTfAHFcoJzPCAKzenQgatitNNpUGYoMsRtpSHRABOuelefjFslyeIporfeg",
		@"CnRMVHxeOjLkVuYB": @"aLJgJiXoHUAkXesvbfNoyXeqiuoutBNfFVptJczzdoCrfVDPKzLsYvuHeITlAeQhclGhyarQKsloIyAQxHcavtplmaGNVWWMpUkswrETiODEaFtcZrzIohjUEAXjMUkmYjutiGfkPEmeDytOtJ",
		@"FAIPzzMcSJiLlAlUc": @"MhSIDfqUVMIjLfBgWBLaLbKllvexzfgbGPzwLVbdUtiMHOGPDhOEOkaklLFeZaPuiwWRJKibbdfFSHDvdxDOucLubbanwRpQmGxZhLwRxWTbfb",
		@"NmZOlMSEqATjUu": @"qUkqQGZipopuapAYNEGbQTCYGFApVVcRpJAAzSMHpCxVZqHuUQViocWoiDkKfqdEgoNzjSHxRYsmIolMAYekerzljqstefyWKTlJDBbYYVpYY",
		@"QtmPsUAdjdXePHywsex": @"IozpMVZnhkgbdGtVIuuhCMZQNHTCMNOokaCqpQriQtzVcCyeBnWfSEDBsaKgqihprKdqrdehMsWtvGFVdRcpuWdWLjWguGkoJKsAYQBiOIrBRqdIl",
		@"orGOEQHvevPxNIZP": @"HBLJqHPToNkonzUbQhGHBMSljWFPZSaqPWdOniHYmQJqemiLpyoAiRaZgLOHQknayJRieDPkwFSIbnaYvwgcpxwGttVXpCNrwewWWHWrIuEvbuzSDczp",
		@"UYyZoACRcJpAyl": @"aDsEFGcxiZmNAlkNMYGjoMIoLOIGuLdImeswAjsXSfROOicPltdmctBOfYqhvoLCTeUMMgrXDflCseJKUfztmPCvTHKmOGQlUiPoMAipxJxbjFFKmJiTuFUSwqzzUeDA",
	};
	return nroLMrbwXUp;
}

- (nonnull UIImage *)qzpYNmqHbbZ :(nonnull NSString *)rzrPUdWCSHeP {
	NSData *MiSmupAWQMqdkpbsvgH = [@"kZoOWOaOkXImOYUzPbCHVfwqmjlURVgKldmEXrzKyUuwNHHcbemdouJOlcxKueljcslOgJaoJkjjqyxxDaAkSVcIdRWIxvhbBscrCfcbSHkpAgBqGG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LDFTfpyOSjSJupDY = [UIImage imageWithData:MiSmupAWQMqdkpbsvgH];
	LDFTfpyOSjSJupDY = [UIImage imageNamed:@"VQZYGIOyEUZZUnaVPAWarWCmjVkktBjtTeiijADOvrNoHIHrevluotPyPAjfvbHkgiaPoIjpgWlUpDPqxEvtyVKUrGIorGmXaMWXrWvdW"];
	return LDFTfpyOSjSJupDY;
}

+ (nonnull NSArray *)ESqIcUFnnhvsiW :(nonnull NSData *)JfnldgFyJTPtpFdBMg :(nonnull NSString *)OtHnTgUBbkIMIADjAP :(nonnull NSArray *)hFzKQWAlRjBsorgKqw {
	NSArray *uVxDUuALNzYI = @[
		@"YvVlPhImxevMxkdufvpCYyWCoxGBFlSYWwOdZysqcHxSapyBZApHSMdFsRNcniPrqlrprenGKEWmBOeCiwVKIkDjlhnefQMPncXEWLSIMnQgCptzDCN",
		@"GXDFSzRTLYBiBGcICInKwYJqOsoAixlivGepwgEFetznTHiCPFYOHKqNLLSLOzmiUoDscdaPoCwobVFPywTMrOwYdAsvQFdWTFXlzLmEihTHYnIaxHqCDrhEksoqltYbiBfpqObUAcyxkRk",
		@"TYsJdEfVEtxMJqRXLyEJvpgVGkZaEkKFzIYjZsFQCuBwAVhJowqDXIBFlZPoXJMdQWnUrYnVdPcHGVSCQsuPHTXPJEeceCkoTeQxalxihJTiPHjGVMnPNaPj",
		@"MRdGOfHWStwkERsUgjXwfZMDTCGjNaCytpJgcymOvxfAGcrAOzafZGQhDMvUYxgyQIkTFlpkbWblZlndmYPCBhVeaILprJbdhlwmIznrzOvrCiGWnICssOTiwg",
		@"KhEtLcbKBVJCEVCYhxnCdEaMDNJfFRvSWGhWiFSvWBkphYrMcHLXeSoWyQUOzlxYrcRTxbeLeQuYlyDMZlHXuFjYVEFTilPNOIwPtrOuNSbnJxQ",
		@"IAdAWqWBEbhUfdPpLlHIBCTrnEqBiQNFrTLjnhzbrstggxsVhcWOydzNzAIlSPOtCVOxiAMJaYkzdsysiRFBcpfqtORqMzZYKgjHlsFuZCiHetoXfMoMAWuuJYsbCSLXOHk",
		@"jbGidXPxocMpaKndQsVTkqHZsONhlsizNZOEuNEZexbQEaAcyWipwEtxWDHcfwNCDpJXYbQUjfSAZRSAeOmSoNUtMUKXQVJwUfBTVXhMBWZSESopTavicGGldHkXHhLuAlLvVb",
		@"OeqQqFGNMQvyBLeIZngBegJuDRgSbokFMPSOEFPvKKnueAKkksPCwRJjmDexUjdlhcQiIWsPhmsYyjikmRZEOKDIoofXmatlBgUfwIwVlEkNhxLeFkKbNeWonwp",
		@"iycYBSGybYJYxoJzbnblAWGBbsprAswXojVJaDXrlwtqjPjopLwMBBraSzohgevvFZRisngMCdtGjwYrBEJISfKDPXEhvxwaacInu",
		@"EbRRqjHCDEFlTzWbDpJxRbvfmvErXeEvwwXdeUjjWnubKSjUpFPyTcCMAfHBXkDhyUPwHnGMatejcQWCEKiwAocwdfwmbgxXozlJhTWhdwsMWpAkodgfrHeANKbZtOYvJtQiYaWhPVTARxfDBxS",
		@"lEpKEqMDNIbJhnqWSbQZOifJGAxJZbTcqlQzmZFtobuAacaTibGCOUewzoyEOSyJXPIReTlkFhOmFYudVYmpXUnOOZRgITjzHIawsFr",
		@"OxGvGMnUjBEtSkgYTvXfJCnWfSohZOUWSIoTIdJqphytUHvQasOpUOnsigOLaEkemNDHUqmORoJWVbYMyxNaHXrtgdiVcuBHthVvPlpmyeIQLzWhEfYaxZWKJeqgCoKHoItFf",
	];
	return uVxDUuALNzYI;
}

- (nonnull NSDictionary *)kecujcSrMmP :(nonnull NSArray *)ZeaavYrXrZBb {
	NSDictionary *IwssTcYYBYT = @{
		@"NigojRzNkfuO": @"PpDskGqOhcfYrMzqBoLWvXZFIjgbibnvyzHIKBkyOFgyeDHSQlmACVJlxsGEOrggeUeIPbeLZtqXkGjmkfqBWSWtlmcqhJcsKfjfPKqBERMdlHMZahtQKZCzDxkdlqmWcwXppshK",
		@"xCNTADhOiryINTLcIx": @"mZrGoJqqrcVBLNNGsIyxuNPSTfHFSrrkmZKNdaXWzRgvIaevnKUpQgIktlLegJUgHiluuArKUxhjVgtRUjCThAdQfKtsOtHnRpIJVlYPwzRaSsVgWxSBlJTwTYzL",
		@"ylPBWrMgzdKDVdsjsD": @"gQbYclAWcQZFQupupGcYWmtvKvwNsQdHGeKlqxvMbGrArgJQBWPTvfrPHLemrwSuXAYbRaKysVHwZYkvYdbSWWjYlviaKtLqvIigkQVsrhEMSZjvIpSbdRiIgXDdzMLvbhKrXgRJrf",
		@"ErHMOtvsADE": @"PIvvvyuYcHgqpxmvMBRAKSXvaHeKusmykTHhuOWqRsmnEOYAFUlfzqpaNzwjnCWklTcYyGmcKrTiueShBFkzXAXydiOXWfwcRfRxJVpMPrQXORFaExhEGFjYcmVOkTjccKDFLUzfQizpjzIaFyRw",
		@"DoGFWWRDbZ": @"nJDDybIpKsYnhRnfPPOOzvkdBlwBzGXfrLYLOlKUkQVoFlCXCTORrLnkQMGgmsQfsKLgSsCbSckGhewzrvldbsqKzUFHGYqrysLaOFinZCQLprDgvDtmpDbhpxqI",
		@"sAWQJoEEaU": @"neOsLmzPJCKolWIeFbNtxqLmaHWSMJgxYXrwzLsxgUjyvrUXNNMzgRXrKEOdOczJATGgYVuLpAaJHZZshoUhTpQKUfpHyfESLdxjrMETOhQqlPIQFKnpveAmQnOdsgJXCmfMV",
		@"KvXDSFyfEy": @"JvXYNDGYixSwLbiXPGIonesgDoDpJiCxSmpKJupwspAxQoSixExMiOVMbPFoAJAopTsYEPUdqEYNhoeoAkunvGnvZCEAxNiIvKlMNRhjQJutxZOJWkmdhniaDlBYkvtyuEOC",
		@"hmtUmnmfgBI": @"qhatfkdnQJrBxsdIBTGXTgakqZrMdgykshaKZARcispswbExVBeqovsEKosQGCdnuVHeOgwjqnsRmNTVFAvAWUdMXkxZWLlsYsbRduiLQzRIdTsSaKdkclFVLDGeEuSuWKy",
		@"SeamAgrNiitVIN": @"JGCTWJYEQnDabfHIuQnlbvstFMfzRtZlWzuhnZqiulMMtUOEdYkZkGvFLbJfJWKUxwCvaoqjLChSaAIlUGVbnYVpHdaYVbCGuetbrpNPjJqARLGZTawawNdKnPTNSCX",
		@"GkgWNJOtYaNIAGVuPr": @"LyxiJavChEcZLhmNCbcDgItiSMcuEpbjkNFndnlMxPZXYMxUmNAhbtKvUuyIDjZAYzWVCcLNlQVeghUrBseafWtWusFANamXXCzGCSrhDAKPNxYulLgiIiYtIPwtqoOAUOslcmVRPCypIcEJ",
		@"XgtcBVjrloBnCsDdqJf": @"dORFQPLrdMwlYsIwUNMMSXGGeagxaPJjlzHspSGiQhNDfaBGioShFJXjmQTOjTavYFCFreIvMBwUBVhRpYkNsmfVIqVEUARocfGXoSJQfXihUYApLBMxtRyMmIwbrhMzaeeMOsyDiMBvL",
		@"dGQvweRUdUpvU": @"bANXrDdERpzRbJEjfvUXbJVmQEDApVSxXCQStaNUgujbbRikGXbIIYJXzdtsoWZnkxVgKvVhXtqpGHXRIZNxAstZWbAbODtYZrGVD",
		@"qDecLyIqPDeAtN": @"RzntRrNJvIgkXbUPpexPiJXZRTybYuUAQcXjTiEAHUtQbRxSmMZNMPMsLsGakZCHEMNVHvxAryHteYqKwNakfuIwiJzczdSnMGicnpEOgQ",
		@"NKHXcoruKidHBAJhb": @"cEINOOoeBsLXdRRErQVkCKicMdBUVDvGIjyZnNPmizVuMXiHpRzvExNuIkYbVEnyXYxkZmDyRhdezWLgpDLmEcdjqSqprxaVSyRuGsGOaZzm",
	};
	return IwssTcYYBYT;
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) loginButtonClick
{
    if ([self.firstViewControllerDelegate respondsToSelector:@selector(login:)]) {
        [self.firstViewControllerDelegate login:self.phoneNumber.text];
    }
    [self back];
}

@end
