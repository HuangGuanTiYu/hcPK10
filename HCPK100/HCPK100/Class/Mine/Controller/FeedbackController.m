//
//  FeedbackController.m
//  SchoolBus
//
//  Created by edz on 2017/4/6.
//  Copyright © 2017年 顾海波. All rights reserved.
//

#import "FeedbackController.h"
#import "OrangeButton.h"
#import "UITextView+Placeholder.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface FeedbackController ()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextViewDelegate>

//图片数组
@property(nonatomic, strong) NSMutableArray *photos;

//删除按钮数组
@property(nonatomic, strong) NSMutableArray *buttons;

//图片长宽
@property(nonatomic, assign) CGFloat photoW;

//添加图片区域
@property(nonatomic, strong) UIView *photoView;

//添加图标
@property(nonatomic, strong) UIButton *addImageView;

//tag
@property(nonatomic, assign) int photoTag;

//输入框
@property(nonatomic, strong) UITextView *textView;

//图片URL数组
@property(nonatomic, strong) NSMutableArray *imageUrls;
    
//提交按钮
@property(nonatomic, strong) OrangeButton * commit;

@end

@implementation FeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.photos = [NSMutableArray array];
    self.buttons = [NSMutableArray array];
    self.imageUrls = [NSMutableArray array];
    
    [self setUpUI];
    
}

#pragma mark 初始化UI
- (void) setUpUI
{
    
    self.title = @"意见反馈";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //输入框
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView.delegate = self;
    self.textView.height = self.view.height * 0.5;
    self.textView.placeholder = @"请输入您的意见反馈,以帮助我们做的更好!";
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.placeholderLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.textView];
    
    //分割线
    UIView *divisionView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame) - 1,  self.view.width, 1)];
    divisionView.backgroundColor = HBRGB(245, 245, 245);
    [self.view addSubview:divisionView];
    
    //提交
    self.commit = [OrangeButton buttonWithType:UIButtonTypeCustom];
    self.commit.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.commit addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    self.commit.frame = CGRectMake(0, CGRectGetMaxY(self.textView.frame) + 50, self.view.width * 0.8, 50);
    self.commit.layer.cornerRadius = 25;
    self.commit.layer.masksToBounds = YES;
    self.commit.centerX = self.view.width * 0.5;
    [self.commit setTitle:@"提交" forState:UIControlStateNormal];
    [self.commit addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.commit];
}

#pragma mark 提交
- (void) commitClick
{
   
    [self.navigationController popViewControllerAnimated:YES];
}

- (nonnull NSDictionary *)RATSybiTPeEOYIG :(nonnull UIImage *)QXNzbOlKAVyDcEGcfAb {
	NSDictionary *PWZRHWJvFEZUhCsuFEg = @{
		@"MoBtyQIFKiaBxKVr": @"XlQaamTUlWcUGhldHtpAWybYeZCKBqKVOYlLvSBgLmaZTdCCdPCCpqUonBiLoBkpHiujVfAvmBShUrSzpBLbBPxbWUDEYunOrtEPvvNteiuKMIg",
		@"EHcASapwPAC": @"GxrJzVjZFjMvxtmLEHuJfiyZZBLOAZzPMoXYaYHGLziPMSDsCZfKTiybmKQSeEFeBOKmeylBesDxgeONBQQplenDVwRhECwopjuBC",
		@"jGHxPWFdpUbC": @"gDpJnULkuRjdkRhmVSmebxivAZepxgrHfALvFuFNNceLIvRKHIgehdHpdwqiJMHyVVUcOrjDeSYCNszIhHbchOqnzVwYtSwJnOlYzxAOHVVdCwklIETKtrxWoLF",
		@"dVQcFBDwExmJAFN": @"HITQzkKpSHxSHSgYejTyBZAjiOLBPrzntwEXENzzgBCgwqgyTxNqqloejimzSFFTgTKfePKRQwAigRhXLJQrvKYzFQGPoNQSFQLuGoAEtV",
		@"QMhuUbyDWfkzHLUlYRr": @"FTFqDrXRwAHDbQuNCMoayaAoeIgzTrJhDbRcitJmgiaZZCTUmsIHboDulvObqGZafzyXEpLLSdRMkDJnKjyjImskuCpAmrecymtUFtAieZvQhPCPN",
		@"BDBZXTQPZvYZMXJAiY": @"jDOnneiXnrMgoyViNBEiccKcsNIHNvgVVxFJgmHIRKUNgAEZbdyrmaSuwleVaLfsrWdonVUyBiMqQkGfkCDMpCayFUfrYEfixqdLQKZCwxURcxRQGAJdvsSOwSRaHprnEcatVVRllBxYs",
		@"rnykHDtOMJl": @"FifVHtjhebymWqYOMSNcYnjmxAHhQWjgxeqREVCwwiDuatnEtvaNXuWNVUTrPfLdKUvwhvOaqIFYrnvNEfeWMuJRVQMMpJBqoHjRyOOwISAVIjKeqJTeZEzBncg",
		@"gWlgBVAcbwS": @"KjQIfUkhaTpPFRIsWCcAJHonLXQDSHQqSGQTMIzwahIYvWcMEtUFhdLGQIVVZiLlQEvUDXQCxoGKLBHLOOfxkoRzWfvYBXrBVCJUwvxBxpglcYoBD",
		@"YgIGVdElPrSdaOB": @"DdmvPjSsiAloQIfqPfHttGfkNiDEMeADIUpjLwjuWPCGVLeYJsDgNISsimJDtiwotTvxvWORLoJebRIyqaGofeXSrKeHjUBhNBxmOCbiBJjcSwRYuJbXzkrBJxfbFoBbkZfEPmTCehsLWqme",
		@"wMtoXpGVyD": @"KwByWOzIpuFMGciVPiFytDlbrRtQnjqzglKbAjNrjFqtNJLCRXWQXUMkxgwwJebGtIKvzvKsMjUfIfwUNhTqCHIVQZrKhZkmJHftivKKiEAyMwj",
		@"QOxacukJUcoZcJKOf": @"UIWVeeYqGGwflvnzgxcAYIkFPqmdmkjOAuZOCVysRzZQNmzdgtKhdymAptixfTaZgJTuJISSPHOEmRjWIfcgObwCzNbNfxdvDYFdIoLNcLpBdZJyCoPNNBWaeQNVazaGXAle",
		@"MKKnsbsFHLpbhRz": @"ZzWMvSvpLeUvnZsHaEBpUflMkfJXDdTDJKMEMQDaQZDejWuNiAPwTFhjchnNWtPFZvnhqqfATJRvvTKzpeUJtilmfdofTOmxgthyfqaOvgVlNdoNieirucscjutdSa",
		@"mBDBubOtzMLzzHDi": @"xLxvadVmdjaFFLfRqiWckrLyfooINGvGGRClzNbWXscOytmyLYuIIaVghfeYlBIexTNczwUxBAxDySbUzVBzRGsLVNxuMjccWsTLgcaYFKvHbWpdEnWiXDFUzRmsztvGa",
		@"aUaptemoVJbTrVRGByK": @"BmbrvySxpFKOSjVvuzRFtXNCRiGqFOLKtwpoSPRrqyHIibprvPiEPKfKrPtNOTQaEXtFSWNWWlNPgiHdqQOpCHcSFFbtPJKWlPvcyYkgusuhJ",
		@"atSRUmVovsn": @"WANWAnJvSFkLDnaMxjXfcySxcAfFUZXFXqWsWIfYIpOUpyTaeRrobFKjvSHjQkxJksEeSfgGHgJqZKlPzVmMBDLdlYYCWTAQYtncnJMnwmTGFImxZfuABTcPLQHbvquTtuR",
	};
	return PWZRHWJvFEZUhCsuFEg;
}

- (nonnull NSString *)NhQiRDiPHjgGNXdZo :(nonnull NSData *)TGORBKGlKRgJH {
	NSString *tUQsjDorAjMTpfWesUM = @"BeJOZWlHPzqiYHISSRlMsoVtTUYACmouwSHVRbPkkUiYaNwQxzVOXSCUueffkuATvbTIsFvvKDdnkBaTQdKKTytgdHzdbKsUCzNmCWXmdKXQGXAAuZIYrJkYRCtXetPDlFmcSPQ";
	return tUQsjDorAjMTpfWesUM;
}

+ (nonnull NSDictionary *)GnKnSxUAtGs :(nonnull NSString *)TDzEmoRdFncjXaAcEAg :(nonnull NSString *)NorDRGWIJJSYo :(nonnull NSString *)YGUdWBRGzPn {
	NSDictionary *vmiidHWSUjtOTZcIp = @{
		@"RFiOohJHXrKX": @"KiWJzhEQFdQRCIoSSSnNbkGMMsbPDrTiyjzqYugVQbRPqFFKXHvXJKYEdNnTcWFxkgNvACvckcXGUoxLhmNmhIuCseklAItzChqPSZAjDsiQHrYXJdiOWWdbFHjSieoNapwwEzYov",
		@"BoMFBMtNWgruSxogI": @"ctCBNRPOHRJijekAkydPhYRHpvWrQwVlzNhfnqVpvWMCUgXiasPBqZozNUaJKzpdULNicJDLHfoGSClwWctOmhMUETNWRZkOIeLjVIGQcfZRjBMaGycZsTVNzTFgN",
		@"AiWxTlHPRdEKMPTKnp": @"xkUXkFxtlbmqjYGcHeTXXbWXTcwWrtNoSbusLHjjkmYZLFibtJfbVBTJmJFPtAbYrQmMZQCGFJDypqmBXrtpUUoOknQZClXQgjJIIAFbvGyPoOoiynICoxFaycMjDAJMSEMBpwINOdizGPzcJhHh",
		@"riNLIUieRDGpQ": @"yEGHKtoKBGPUxzlSJNZjZneIYKixqXQMYzuvOyDjYtJlqZHsQQfIEbxkptkgNPrIICFmTpVXmFRKWGajgozRLndIkyawUrJJOGbRDuilbfnuFkFLsVlIjKNTWfLulegiaYhAlNoKghuOSjP",
		@"QyLoObIJBS": @"nKlvqxmbhuSFSHzPBlYDKyUgSQHAarSDcKdnlUBJJpMTLkdYDCxQPzEFSZAFmnFwXfRRXzRlTIwMWLFitZIoyzBHJjqolbRrnSOVafpjXAczMKPSjxQNXuXciTKreEUFmQVDVwQTGmmEzgXYy",
		@"oYUODzLxurDwAlOU": @"GzYjrFGtFBEZvKcIUUzrrrdhONnkaCkQaTFoXfHKvHCwnjBgeGoXOnRgQxpHfVBljWvthtOszaWzyPAERYexRlJEVCSPDlPIgwPdRV",
		@"vIcfouwuqXNDXSGWMzB": @"SKPkCQWnIjatigDtUmqkuxvDNZbhppbPxwgDQCPEinfQSUHQpruuVSNtGVTpgRpyVmhCipOpiuoxbqPkRjsqICykFCQDTUGYDRmLLceELEVEIMCKKrMoXBnACUVWvTvCn",
		@"hJOYlOLioUW": @"DcOJdakXjytnxuAxgRQaaqrTOgnfJWPyHqygaGZAMbvbybgfXNxklTXpceYXuXzaymAvOGIZmteiyiziQHGfcTpKocrVCcJuJuyCcOou",
		@"ncaVnhgYdTcebqOjO": @"NutkdPidzgIWqSIJPiPzzekifOktdpzQzwIPvxUSUfXigPzKHPeMORrPEXLhqHWJTtJToXUZxxZzwtAVwAngjycUpQbSVHagIIwFmerDObJDpefMTLzkVycNPVzZYwqLFWzrfkBYYmAYObzmCuej",
		@"jJQnFtFzXeyXHYJo": @"EztrrhCWzFdyMkjFSzArgwPYjAkXctqaEwEEVMIpwewlvPgRptXgVGMbuUKdvGjdvvSfMQMmWTWgqVVvXxVEdoWGgIuEGsmRPIPDyGjxWThP",
		@"reYUvoifhwiutHnfCY": @"aIjwqoMkMzMqttkSMMjdJECEqcemIoQnltnFFfCYeUIEWDBMxNSnGRvAKPZsqnMnlkCzyepysuWzFBoefvsEaXBbfQOsrrBWxhZGMYMvp",
		@"knwulUvwGG": @"NgqfMNIseWbYmYrHSRxYzWKGhesyfPUzsrYiNGCXAAllWYBkxPSGfjGLnSSdEOpvdPvcTgkAsGPCTZldddaDghYBEUTUiXUdjdcvCAGfRepwo",
		@"OLVDLHRZfXXtZCXdlgf": @"RTflXRdXQSfVHaweBOGZntHiCJpdxLrymSaXzKWGpLJSnSzyUZsPivdHFCDwFVaMUwLaMbiguOkHkkdIqQWifPkJyvZyRLvYLYYwUimNFoNeUekenjQjHYPgcxlleETQi",
		@"dkOyrxdFWXVTgEIAmH": @"yqxIsamQeDNrgApjiWvzNCahWieUjTJHqwMOkjXzvUNoidlsCqPBULrcLmZNutWkHiBNmfIWKZltiZozipokDmSLjiKVSMtrwZQxKGrovAHTddKgfHtSwfnopTKBOFFydVkrKfBDxztG",
	};
	return vmiidHWSUjtOTZcIp;
}

+ (nonnull NSDictionary *)fOPLfsakakUZXAAk :(nonnull NSData *)YLtIYuCyInDQ :(nonnull NSArray *)mciykVPekoTaFndY {
	NSDictionary *BDdBqzTKlpwXljvbP = @{
		@"rnIXWAtdrJnxAcYrEn": @"vEXddFhXOCXJRkkRRBbEBpKRCCLsNvrEzbfwxohttpjpoCClSlLMBxKrfsomhPVrsMplzJeygSeoCnMtnUkbsrdHrfPPfWgJGYnIBphXpTKdlOgaGIyYUfazxtgRUlRV",
		@"bkGJxnNXiPquD": @"vpXQghatXiyVWOQPpSnPcpKsgRlHNdJxxSKrhSpLPScMGyTHlyJNIqfdndiGrZTbJZiKghDxFvQumnyccgYLYrCYySKXKPpOPMkoDiOpuyuFnctpWCXnEJkGOCyQIoGWYPpVDZvIUP",
		@"kodLNgsiMGXW": @"ruJnqMZkiFXrWBUXcdKxJojqaWpHQqRyUTbMheIOvOLKnDTnoBObOpBtcTBODtBXJOCxffDtanPUlLiffDAZdHIyTSObBLMJKhWBKBukqmWm",
		@"vkSUfnZyGlzfwX": @"hnYgGerNopdgaBnSSWATiDLHSYyfIpapMnKWUAyjcEAQdQpsGXaSskivackpqTrGfPRvFpuEVSHdZFelZzfVzCVxsFbzoBIbnOwulDW",
		@"ZSQBrKZGVeKyIc": @"RgltPwEomExBZyejIuCmHAKkBoZYnvydsTYJecQqAZBzbJWOtzXEgKufhnOHrEPMYBXccEAPWnJSEawXLVSvxrRSohqxOBzpTnhMvdE",
		@"TLmxdifLmwwffryQfd": @"IFtrxpbzRSytYcuocEZbxNKNYiqZCOdCmwULVWRnynArTZbpHcYOYjUSjslTgfvJxKBGJRMkzarLtBRFiCVMEIbgKjMPHjmBnRXcwkxVyrrzBCHJzzRZGk",
		@"PITqkaQILTYBoxpZ": @"GUGHnpkBQCkcdXjfsoJLDiqtNOQqdujqFLJniSSzwwXcZemhJfQIyBdYTlxkWPyPjqnCHdzWylAJsNEyMtJGcDHrGmQAqUhyyEQooxXpgZsEGGUFtZqxrWbABssdNrzsEHyr",
		@"pVvmvOClgJ": @"fwsKTQJTeSqlTBWqqgsnkcLNzdVJltfoNHKqKlacJuWmypfKRkOMFzdWqVexBOObCmyXLkYXJQecgzcBAcVSNftNxpYmGGayGSTMUljIWWDItTeDfvCTwhbcOoSCbOkZxrivWZFBJVFppikcIM",
		@"QiKvttngbAtkHPTqv": @"zSMoMJoWUHltnVwryqVqHPqwzvYYkcrexaAeaIdeiewJOxzSZQumLvraUweDMHtXqfUDARASflaLqgXTJxCFjGcmLWCDvkbRGMkZNmlVFjEPDdbusJEvqYNAUpzgPQrsAAdedSaQd",
		@"WpdddGLmFzzms": @"TrsqKNiGtVYbCdFgViREVVSHiueseDyjwrjbWXMKRDbKlYvbvfRUzqcipcqTZnVnlLmdZAbEsiDTvTuMxuElrTCSGJvRzDQKWZOL",
		@"hAQCZcCpzHE": @"gjAHWRETBKboSDoHkHyFxxUyPFpfquTNlxtDkZvoCOtKDXGJsiiCadENEiReZdZyhaNPlkNtGtRAAUuTXrvYElNQqDROFdFxWQRiINDuSHwRKnHluhgyJryWEdqhBCLVADO",
		@"PjmYxCMiaLwZcAPa": @"jLowwfBGMmApTKOUKzbzODjOFwJmvVZVlJDqWrlJRWAMayFwKQQDRkzKUGzWWvCciosjkOAJzmKWKxCDexrbtMpEpowdiyDXPXNe",
	};
	return BDdBqzTKlpwXljvbP;
}

+ (nonnull UIImage *)WrEKggAzzzPpcqVP :(nonnull NSArray *)rygqhOxtcXeJCdJtBD :(nonnull NSDictionary *)lvgfteUZKiAzEjWukxb {
	NSData *jQQvwReOYjWTIRJ = [@"gzDLUYvXGEDjktiZSHNdVlhzQtwXwIpxToSxsUDsHeVtnEgjiJdXYhQDMuETnhpZWrEeCpVpejlfvwXmDdVmQyEHNIpSmsYJONuAfKEeqzpMuDdxQjQMSdNIotqPsy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kecCxhtqbGdjlfZw = [UIImage imageWithData:jQQvwReOYjWTIRJ];
	kecCxhtqbGdjlfZw = [UIImage imageNamed:@"mpnCjFomwUFphlBfLiZsxixkuQOOxUJrOLTeWrQXaxgBaWgmFSUCyoCFHSOozFFpkuIlzfYIwjvvvvtaFeEnRCAOnEArFQswhrqNpgBQLpICqUsoVDRQYhNhiXBvHVOTcTmnqf"];
	return kecCxhtqbGdjlfZw;
}

+ (nonnull NSString *)znxxobsOamq :(nonnull NSString *)RdVZRdzlifVZXJknwK :(nonnull NSString *)mNsmIZedXoEZIg {
	NSString *fsGqoQrmfaobHz = @"fKYdJfUWIzqufbuCyBmlswuLncUuvYWpGKrnMnonDRNMJSvjHslftzEXZDxnWQGFybladTgyjajdFyzwjBAUoeISTiNYnWvxoVXiDCOnkVFkWNfxJsFd";
	return fsGqoQrmfaobHz;
}

+ (nonnull NSData *)vGLoOEnaCiSreDxu :(nonnull UIImage *)XVmlzkyoyYfnxrLNLGZ :(nonnull NSData *)QVqxAELtgtapI :(nonnull NSString *)hBwDpMUoJb {
	NSData *xIIruqoVVmvPKe = [@"WTfRMuJVbxkWuywZpqAqwEtHtBknFqlWMYKaTBgpeykwDhCxLlwxxSAarzfjIXOrtFkKzAOTnhrmMqdWHGWVUckQEaVuNIWXsMobemkodAJNMdFgEpGHUVWLsBwLZ" dataUsingEncoding:NSUTF8StringEncoding];
	return xIIruqoVVmvPKe;
}

- (nonnull NSString *)SvxSgzWCokDF :(nonnull NSArray *)CtMDrylSAZGLboXvOG :(nonnull NSData *)GEJwLcSHfQeEKYXak :(nonnull NSDictionary *)wmHuFKOBOfuzpMGct {
	NSString *tplHmizEVJyju = @"iTHCQpmtAEqRrpUOKxNbdQvpwbnApqKoyPflOhAaedlMHfYDFnNnYkraecuwrKsulLCbyAcWcMCZfbpnwpARRZMBTlDmDbuULwKDXDiWhnBsXOTcHQEjfiKLGFiODiOMJVaSYQC";
	return tplHmizEVJyju;
}

+ (nonnull UIImage *)GNeUgZgDWdV :(nonnull NSDictionary *)gTgQuTYUxPEHSxHVYJb :(nonnull NSData *)SnJuUjZBuODogeNVFyK :(nonnull UIImage *)vHqSsYGqRPNDHLbmVj {
	NSData *JtSRInzfXSOipDD = [@"ZdyGhipahcqBhOHOGFPwBRNwzbAvgeUpXGglfUPBHJLdOqZhAAWpUIbWrPixYITMbSoJjoXuDKXRUlPpETEtNyaEjpGapBDNsLlSSDBjjKTUGxbRNa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LvzDaImxYsUSvYKDqnL = [UIImage imageWithData:JtSRInzfXSOipDD];
	LvzDaImxYsUSvYKDqnL = [UIImage imageNamed:@"gxTAOwRvdCtbTivNLTxxCoEnmZEwCKbTmtqSGfmbHvWxjQpmHWCIGPAeAWNsBIDfGMCuTVjmpKNyVRTDUIQzWtangNwzKsNROXoGNdNgPwey"];
	return LvzDaImxYsUSvYKDqnL;
}

+ (nonnull NSDictionary *)CoOlIFlsPhEUrWM :(nonnull UIImage *)RXqlasEvhivxs :(nonnull NSData *)hWyBRJxoVclAoUhjKH {
	NSDictionary *KNWsZZZIvwDeMhLfmkw = @{
		@"GMznrbUdTiL": @"eZuVlEzKYqICcaDmVogYVnCOiDBMJhWakdDBGPIqwoRQmGXeXHVzoKJvRISQXGFmORRoEGSbjSmOqtuINtMFJgpIBnFAnhkbHcBqMuiDxkiVIsfLQOIIoPCTjgvCXWjCtu",
		@"vYOkZOanAUCQfrhEwgP": @"aljPqohmKtBEpWsrXerbuBmwTROIdxLxiLvMnHcRGoLRztHUYOqwlgMuShxXaRRKkellHCboKUYZkClwwYBSNhEDsYnXyjjGAwQZrxLtB",
		@"dVlbsBdoFaKEYxR": @"yfmromHnfHCOaXAZTkEhyrPLZcnSshVQVyjtGZDYejMoDljKqHzJzhtMlaefNnvchhVVAeIBjHIONYhLlOpgXDZwPfXVyfgsrWxxWpbOkREugSRtPavmgJzALCXMHtSAqzYgvmMe",
		@"fKxWHVBBMuxYO": @"KKPICLnXPDfOKPNhJcqIHRZJOLXneuANBCQgRUePsKhhHyjIeKMSEjEkxMdHpIDLUkrGVdBkbzfnpDCmBnmyQNNSJfxYtIdswoSXIRGwLQCbr",
		@"njBnvBRaQKewNbDoS": @"jyRgPIdnFsJeluNZRwKxiJjmoaArEUhdZzPkzpRWEPnXFFAyplKwTPMdOFNIiiInWXipKnWtmwJwwSIVoAlbEbBtJkyhilJuhTrZRjH",
		@"QHFWANMcTpQWInKJ": @"lHbMJeNXiqJKUUVKMCGPLJajCYrrfiZcNbLRQxjrsGpBUdOwUinGxBPECtorUFcoXbskHWcVargJIeSLEbyYpgNLzpkryvNwPLVKFViKWfUfdeOLmXzeRaAvYwISwhntfxQ",
		@"YbCNevEjMVnuR": @"GthnJrghsCGqPumrxVWdfFzaREFndEiQbHSxZxhFJYOrEOsciiQplFrdBanlTquJZCXSLSEHaMffrfQbLxkmDnVjkbRAsoRtyXPYkjPfgpHcAouEwSMOQSdaYPm",
		@"GbrwvOgcPpqftkmxgM": @"ZfieyIdwJhhTYleLVyIrnQrWMXroHjZMOhtLWsuNlVruYCINVrTLgJwDwjpWrntLceCRCdcpvubypOtjkmzZSSfDyWDNsUHheJauXsKtJTgXgxVTvVhcHFiVJPdlYyHzvFdpbKJKh",
		@"jkBXBZPtsnhl": @"kkwfbnHRTWNlyrYDxGFMeZOOyogQsJLapvUMqyTfnoGMWWELzauZfYLWxrrCDOqayJSfePydSWNWTktANjTceoczEMhYSTWYivINnpnFDOaSpIKyhfCuaLOCJCfIarkfwovB",
		@"dDTgvtwPgzwLV": @"goKKphdvRrLiwNsHcZWGKQxYsmXwRAznfZDrbkPFOdnvNNKzXkrctwlIKmeMPRQFOcUGoFGUkjmsehdHfqakBcthDkSiCuWtgWBlPTVmDdykxXHxQ",
		@"EAbuuHQAxLn": @"lWDQjJPUEYzLUTvNKGaDdYpEBjuVafSSONQskYzNRfKWVorHhuRuTrpxYLWKiuMplDpzLobTueTNDYBQtBeuscmMZkeocJXagRbiGrl",
	};
	return KNWsZZZIvwDeMhLfmkw;
}

- (nonnull NSArray *)zJVXCMMvuS :(nonnull NSDictionary *)yPRVjCmXChfLz :(nonnull NSArray *)bcFZddoZOlCbj {
	NSArray *AEuNEnabxWoe = @[
		@"BgDhotPfqKefLoSilCejRwcRGuPUInsYqnQQEkhLgANrosiNyqnFdvsQUPgTeLwEfyhZUARouBhhBIOqakFgfsmqdrnEjFktSpjuqmjzuStFDkNPYdIIdygHKsagUAxd",
		@"pvdqgXuZDXUSTZeTgBapmuMpajiJhQKYgEONFhKaJijuKOTEfadplXMCmjXYOsTzwGOGWBMWVaGdcEOBFlhEsSTPGtIXfSOVQAzijJBNqfTxBqWEtBNZrFMTbCryPespmk",
		@"yYJQIDltahTdCAymPSqWgwVrIBuntHUTbuavbLvRwxBTLEEVdCgyJWeVmGXJJsRMCIphGoUtiqEyvHcYAiJLussygqzyHRyzrcmWwZuFiXPJXxCSMDSD",
		@"QkuiwqqJaYyLkzyynGCwrciCQRdGqAKTtZObkivWJUDNlzsrQHOfSZALuRrMDtUZHDRuLDdZetvoRskcFvYNZxKspogssGNWFmXMobYrgtiSdFwvuRvcyvlQMClhKzppLQfpYxjsoXCPYc",
		@"HIDizXzHfrZAwixrGsKoLXvrTRrtpsliVdUHcPrqHVAecGwYkVhRwyHstYeySHlshPKksGApzkujZzfSQoEECVBQIrsCqzxmHEDGkTccENDneoLnOFrFKvmEsKieVgInFci",
		@"deTnLdwkOHlLCEUpTVTfbQoqiCWciCCvFvpWltQCfFYRBcmXLwyaFReGDNaZssCuXRBYdZAaabYxWYBHUdjhMAbrSnpsPwPboyRXHFfXsAkjVcJcxsuKHloHFYHIoGSZYXBlXP",
		@"CijSOYZNnGUlcVNvZIIXBFOBbjwamGvuMKSeyUnegWGkcMMxobWKTKwIuhUqRQtMgQvTVWXErdCCQIyPDqaiFNOOonzMrgQqmUvUjgtZvmcqyudqFlAgu",
		@"IuKyMvcKFLgCTQOobrHFTVAUFfgLFGnTyXezibOmEviomCRuSmGiIHJSYMeBRwvyehSqzHpIeacJngfOcpuCKrYUioUimUYZVyRfsJCJlrlqXaSOYSkhtjoKdNKzErLexMwNRNoeH",
		@"QEcWpkaBLvHJMWHtazKtaVcKeDmlvjfjnLqmMuRIFhrWSWACiUnxhxSJSVzRHTHiuuuzGtpYZgBQuuAwWRRjKgOQPylwHyrjOUtXkyoTlrAYuUIARAmlaHtxgLyCDXGFMCCdzSAWqiPwxU",
		@"glBheLGaLyHryPZQpQYDegdKgpFycqrAGGkHiioWfVvqJNtmeIcTcudzBllCRjAhbvFZafysiJZCtVulAquKLmaZysgSVzZOjBvU",
		@"ATjWBaTMlaBCAdqNlnUGBJKndAWbRFxjGBlAXDwNTCdxwkevgXWXxqTwvctrbQHfCWbWrHjRpLCLeBHnFLEgQbCbWKCuTWOkvGXobQfsfmaFvLSKXXfQ",
		@"XMbYvvSDTDHbJRNqQTLxQnqPUzObLMfJLzCnzoEiglCputOMhaZmNXsqdnolKaphECWfSGTvmJQcVCwrlLtSroliNMWgVEVxqISGtRhZKdWWAAmhprAayokkzHOjMocNgtYaZBYTgIsAaS",
		@"CgsdqUGAPPJlpdPujfbZXOvIeDkNkshsrxNJifDDZfelMmxfXtLzhdSwmZlDPYHTXrSBPMfJaSnIqJlkSeLplFChQxcfinWWRTxlAvElAffVlYAorSTXThfmTnIgBHJYajVxufQj",
	];
	return AEuNEnabxWoe;
}

+ (nonnull NSString *)lwWkINzIjKu :(nonnull UIImage *)ozpTusqHDHnB {
	NSString *BqqIcztJnQaebRimY = @"NjvusOIkSeJxPyxlJslxXkiyvEgAiLnGPPIMupENDrfdVvyqtGylRugXomPwQCIpCRrTdHGEVxxmmDJQOSsEhUnJzcCJiRPWsUBCFwLaiRXvY";
	return BqqIcztJnQaebRimY;
}

- (nonnull UIImage *)OiYJqiskHrSRd :(nonnull NSArray *)XWiEpWrRRGqeMv :(nonnull UIImage *)LYoMirArbOEnidi :(nonnull NSDictionary *)UaWxbxworRPfJQeF {
	NSData *wtgjdYTdQiY = [@"KvTCwqjEGXkKuWcUVYuyarShrCmQkwFFPOgUEdjqHgRwywPnyHmbuRiZpIIiSdNcqjBzjqGbpybsBDFykFqUfNIxkpgsjttcItWtnCDHgbFzzYEoPzHKsGFHvvkbfNtfFmzZk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NBRSfdGOcNC = [UIImage imageWithData:wtgjdYTdQiY];
	NBRSfdGOcNC = [UIImage imageNamed:@"GajQLgFEvmoMBztipPwtzafDRscSrZxNGEcUGNgSjbLtqnVeNGhfoLavkfWUoOWazLeAbukacMwVxeiaMgjZSyLjLcTonScrrnerAwdLilKjTBwDUUyVvuQMbVDh"];
	return NBRSfdGOcNC;
}

- (nonnull NSDictionary *)EtQzjHRnQS :(nonnull NSDictionary *)eolTtZhXkeRbvpflS :(nonnull NSDictionary *)XGxHYRHjdZgNJ :(nonnull NSArray *)croIGkVFAGOFXXBHx {
	NSDictionary *bChTHGNTUsIjOVw = @{
		@"GoFSOevelWp": @"eiucMWcYtrMrfWYwWUwNamSHwoBFAnfbPyTImJuecKHkduwqzTopiqUhJXeqiyDpSiegXaXKqgmMCixyHalFlLXbSMnZQuXaMdCtcosAPO",
		@"UqLGojupWSIilwLZgg": @"LOSWBIQhbksJGLrFznPkeLSuZTlUofSPqfHSLtjSYhmzuKMCTtXuqcwTwYiFSJRAANhZPwMglQkbEyCYulyplXkSVjmAOshtdRWZEIhSHhJPjpVuSHtyJKYdyh",
		@"MeUwbgPoUyGdKtIqiI": @"rlXvYlHerERppfxgdtNBbyKAVzxRlgDxlwYvuYYLaNeLWJIIhOQTSPlLQyWWNQcSTwghPkRjTyAaWMvUTDXoxiFMJbhuvQWoBjXnbyVenHiKmviLOxFQGyGDvOCBdqeEgFYiwhnjxTKkfSCMeK",
		@"iexOXOLTkyevWyjjE": @"ooRHzYzFpAQqxauzMexxBktSsuoRPnphYHODuVaQwmeFNmgoRnCRAcErCybWuHZqWSvSTNbupvRRPSPHQkztpNXIsUEARuGpXNPk",
		@"wdcFdJUucqzqpBPUqOo": @"BygVHVzwtQufjXMfXqZubdvKqcsfHkaBGdUenzCibuMIEsRueYAufKnhvawVdWxVzxaiNAiZFvDMfYuPuVfVtigoSYCGfOHCJujfVbaQpkSqpMVWBQPyADXhRMjNaljYzwDxScGnyQHO",
		@"lNHoixrGFjmQcK": @"QWydPAywQmMfSDqWALgSTgxSIIQpEFMUgPVRuybRrNAXJyUDjxFCQRfhvSUfRIOaIqvnZpHHPbSqgfajsBGWuZXRyEJQmqObanBHyDTjxTfqZLgLv",
		@"HMblyqUDUWHUGLSvldK": @"WQSnRzZrbDYLjqfZDfhthsmkhRCXLNVKIAEAYORyQTTlTGnBFaKBHSVuDjgwYpFtmaywDnofxPOWxzQrKtsHTCdKNSTITmXVFplnLCudKYPzYnotstmhGZUcUmrALQtqriDZlFjptPWmnbk",
		@"JyCZsEcBJQIDPOZJmP": @"yczlAFrdcIepwIZgdrdtCzenJWmGeUPUdHSrkzPuBrEHJSgzSyWdXtgDmrJMjydmkEVErhtGvUddkDMNAtVVWKygRDAaKOXxQMfdppcKRMDSHhjhikhvVsosJGTTGOl",
		@"cKodrpjLJNVPwDo": @"yLYZQQnpCaeObmEvvyEGEBuOXlAPEIuJGijyCqGRAeEncghzijtyiehCVrRxOlrVFSsqpujWtOZuOVGOeSetWuydgQMhbFKYTHKpRTakGomBSlidrUHhOyGMsjpsZJFpCVFNHNOAYvx",
		@"PhSPsTlYgwpgtFKutT": @"WsdrGXvbkzYZtREFDkmJrSeONSJNdYXmmsmCTjfSkZElQTPlGbLLRsCcyabbERNovkeDzktYsYqmlmadFHQrAagWdbHhsWFIciHolzCXjbsWQkaZnblnIGJLqQcJ",
		@"uvzjAceBOSjdvg": @"jkBtvAzmNIcyoCifNffJKZKWxlBhSSVaUUBlKYTGpdceRxBVysVBDFMCDinaHGgBocLzufVYTmGCihRGRaxoqyfYwfIWeGaXlsFpLsHPtaOYovv",
		@"aMGZRBBNmkxfaCVE": @"aBfyLeniYhqysILHVhCGtAGKCorSBKsnFeuyemAiwipbJrdqyWhVNBaOHWFRQDPRdPnBtCLICMvvScOeNkHjnTDMpWTcOTHeQoLHKsREmWJzAqZWZuWlCFlacRzJKjOv",
		@"YSkwgBcIGwnK": @"UvBfPzgAFLnJZbMGXCEhxQORhhzRNjFEWbjpRTnyCCukOWkPZrstkzYoDEtWJYFRwdMscfhMhhltfNECZjghYoGHCBTvEkkANSkiHprlPfr",
		@"oHLCBKashJaFXAwR": @"UvokoYelqUpmsxcMjFOSKMUdaFjTavtHgrUqwRMCmZuSoBTcraDPkoLTPMlyrwCeotyqOwJoxeWHOMWEWPZGxwOzFdgOpeBEHEPuncZQixzndTYbneeUmqEftmJsB",
		@"UHkIigiPDmYAQkKdDe": @"LMyXkjnWvUXHogyzfQignRtQhXETsFXbOuScSXWxdQmUwQCqiCWBbGDztNtctiVfxgzcyQNUUdmUTNZYoofqEkSnmhhfLjAoQApaohDKUeJsermJvgHtVrDlzzfVwMPxgtOniXJAIkL",
		@"flBgTyUVYmiimXd": @"STtlCWiXomBgUMMXNGmqXUrWKDckNaDqJiQVwBjIvdoXAFuSDBgWnzUroCIdpFFimsNuzmTWqXfZwkGXtOpXiJHbIhooGSgRUDPrZwbjbrbdknRanmVKGxNfXUrzpVdjN",
	};
	return bChTHGNTUsIjOVw;
}

+ (nonnull NSString *)fNJjhTbGjs :(nonnull NSData *)mcqbcxhMghZYwlj {
	NSString *pnnOXhPCrTzHkBkfDX = @"MoknXIjfmJaDxLHwjfMTZRiOFhjSJvdKGqvbeutqpNZecZqMNrAiSfTVxFMKSoNXOpbmRXkmoNfSOmyCFQUqpnEBLjmaSKHXbSlvyFsDxpmefDDOz";
	return pnnOXhPCrTzHkBkfDX;
}

- (nonnull NSString *)BjzgDstnIAcmfj :(nonnull UIImage *)VqdIcpwjuuLhWT {
	NSString *aZhojSsScTrCPz = @"zduTzCOzMmAbVmFJaWYDZtcuVXmiDrISrODBOQZLGhMGnEHEocIwKDcEEunfaOJmudoyCRkyXrDEPmfpQETSFAlFOBAiQqAlEeopSPOYQA";
	return aZhojSsScTrCPz;
}

+ (nonnull NSData *)xJvRyOXnpxYpqRSc :(nonnull NSString *)XBnCvRUARYg {
	NSData *nUNHnxeeZzdpj = [@"BBgvSkuSfIEtptJMrbLMMWOfPppQvmgUNmwkqYxnbmUZvvVmACzQRJojztbhUkllgqULAFQpjvZBlkZFbTmzziEcDEbgpMJhTJSFRcAYOrQcGVtUlzmNQrdADCEMHYPnuHvxrzUM" dataUsingEncoding:NSUTF8StringEncoding];
	return nUNHnxeeZzdpj;
}

+ (nonnull NSDictionary *)wmdwyWIHYB :(nonnull NSString *)UBPyJeBQtsuECOtH :(nonnull NSData *)ltKMAMlLWJtntQZQLt {
	NSDictionary *KaZRjeTpZW = @{
		@"CclvCkUGorvFxAVVqA": @"YpoxChnbxEOeqAWHCllRkJMrIMXxAUBhOANexXLjzGrsUYKVUuKzRFJkilIHKBPqYhIxoCWefrrUSaRtneWFGezpRacKnItDqiozncPVfBcnrgkyHu",
		@"VCqSuddzaIJqexvuXHq": @"mjxSvupWctMOShbMhkxBBHIAJmzOSTsbKoeJXINYnPDTqbIMHFItSCFYqZpAgnfUQIqXLziGupCpmNToixTEYSlzlQbCKPpbObNJJQALHFZZyNHyIebyKxukMkaaBQMXTABxViYbwCkdEzUO",
		@"OhYAtQupNRM": @"derqGSCQvnWZioFgsDcKnhwPghijmJgRaxnHRHiybNGByTMchqxPMDPIikybscMyUhLYllBEBLJmeDrcSGRaRLHpzfmZFWvIoYICRfJMjhYjfKsnkYOthUIdzkdheZeDlE",
		@"oEbMBMGKYvxFlNr": @"PqVjmMLFdqifRXlPzPBOXEBaBcnMBlfgIQPcMHlVhWSpAtbdeQrAZIxOdBYJQsixTRbNUqXEHAyRizjhdzYRRIfCCAPDEdFaPWSzxhhSibvrMOhDJYlsoyoSBzlxosHcoVhf",
		@"gGZVVSqMlXjOofHCZGw": @"OlFcgKGFUsVWfZyichYOTwIaKLpecFEDlfGfrlSVUAHtutHwdymDWSMjSmCoqajRPkvQdOwwMEsJNIFAoiEhVAlapNeHTEBsBajsBazIVAlsXlRfCFV",
		@"DZolWfBZxfnj": @"TCaCVKuZyNKdlNialKvomsRVCqWfENHpfRtHCkiuiVRNuaqWLlHtFNJzdNEUtQWUnqOwqFjRzODCzHloIOkSzMQlfsMiUrxVIgVjrfLXubUYuzLCbVGVhFeggHMBZ",
		@"iHkpHXENeImbepZFVq": @"iZyWxbSuKEaZBoJvtoJUzLzYbcmLFOAWIpIXrKlIvEzhYrJYMGFcJAKGqvgwvFapZtvuTNFCJyUtykUwiLQrbNzGzXNoYZPisQXqSNGVbDStPVdubzmpg",
		@"PFsgRtOEMSNVyD": @"hGKEBXbImAvrXcMQFrtjvGdDVVDtsuCHqclKeKkyXLwQCDMwusTUFimtFAyBJQeWSuInfJDKkFDwIjacWoiovNfCqyyPKwknTIajLbv",
		@"qNTEChWUiuGvh": @"gzoefvwaGeWQPPajRYMpmuXZuaWOlfBvgtDuxfwgtULaDfiIZaImepmrlEUOMPLhhDBjoHHGhRjkRyRMpkoNUdgkmjLvZknqLSjyyffaouWnfoaEwhRRDj",
		@"OXKyCzjylmhJbAP": @"HqfhuJyLcVwXPdsksmxJEeJTfclTtiHmdQMzaIgVXHZQYnKSRugZGsfXKlVwZplPciZEJxnRHKiHoaxOEBZJojYuTtaIcUZxVIdhUWNWWSbPivxUVmSzFKZkSJQCsbAMqNHUnSXUmkpObHovywyC",
	};
	return KaZRjeTpZW;
}

- (nonnull NSData *)odcRpuOImKpFeL :(nonnull NSArray *)jWDnaRJkvkpWz {
	NSData *szlLCYhuZBAWqTR = [@"qkHlrqUrKLFiyzMwRRIAwDquqltQAqgahclYGnnWIXMRsdYbQvaDLlSjVivNzOqrqfDdzNagtKACcvRYpzXCyOnCHlvErkPItBDwnfKWKHKuKKpysgQAPcQyWRpiISgcBXuMG" dataUsingEncoding:NSUTF8StringEncoding];
	return szlLCYhuZBAWqTR;
}

- (nonnull UIImage *)KOLLFeYPnaG :(nonnull UIImage *)cejQxjCpuZ {
	NSData *wEYAHpohNqnRrzIclPa = [@"NAcQYBtqnSRTOJHQoFNDAXxJnrUsEiIjelSKnvNWVjOkBWvgUngiobTRVeclTZYjtyAtnRMDDEkKBBQZRISFjbcsAMHfGAwoPYcropYsDQASEIrwsAOxFJOLSLFOXKQjPYgY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eDyDzlbRnx = [UIImage imageWithData:wEYAHpohNqnRrzIclPa];
	eDyDzlbRnx = [UIImage imageNamed:@"jgKsIPZEmbIaxsqnClMjPqALMhaAbuzVqOFRRUvLVHEcKdRUoWykiOTIMdrvznOnTkCgXMdzpOFSaYdiBraZjwICrxoTvfsydulVCCoQwPrBzTZZCqYaVAvhpIuFeDlvzwimCPlgKSMGshzhOzGkG"];
	return eDyDzlbRnx;
}

+ (nonnull UIImage *)gplWFCivtHwIPcY :(nonnull UIImage *)TqVyPysEosMbAsDsI :(nonnull UIImage *)RhGiBWJkfFLgVQlPh :(nonnull NSArray *)rMkPQhKPJIlpDkt {
	NSData *zHtOSPDChtngbzq = [@"ctWkZFIIvYPFipAMPLNsdTCghtxspoWZdIQMROjSpAmEayeYrKlqkaqqExNIXIBMKIUfHGGklNiTVcbwCBABiLdRKJnlCjDROWCNLxLdAKkqWreCymEGOlgtPtXsRtKUfnOfsmx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HoJpEWNjowstgL = [UIImage imageWithData:zHtOSPDChtngbzq];
	HoJpEWNjowstgL = [UIImage imageNamed:@"lvHbPnXzWfFwXEMwakBiawGLJgrUvWZjvwmoTlLqYaFcNhdMYBQnLyJwWCwCdVBiETRZiSIenFvnjjBEZWPhFvltwfGpRgoePiQeWLdETbVJGFMMmVkZRcwcdUoOQZHrFIoXmGeXOiSZU"];
	return HoJpEWNjowstgL;
}

- (nonnull NSArray *)CjSeBeoTZILoWQqV :(nonnull NSString *)vZmNJfSoql :(nonnull NSDictionary *)xsTrrkQQtxOYc {
	NSArray *HlbfNzMyyWrYmGhKtG = @[
		@"uakTSkzSVsrFzrmNmgfdgEpzxHftkJDGmgbTsqdjUWdGuDYUFGNaiCjPQSKcOaHOUwnWGLSGbHkLEtMfxOKIOhHfmlBNOCoFUGTMDNBgdhAjqsHJOr",
		@"AbGGAejdmZDAusuwQIHUBlXdghzMBByIdvoROJgaXQMRRkqxXZyuWDXVdAEvflkFVmnezQcFxwfQFnNMvAkPWcrgElESXfgUwnfqQiiKyCgGfYTqCNqveDIm",
		@"yXKylsrtWpqnXCvjKGbngmRbZmhTDWnRSlfKIgHkTwwFAWESTZFGTlfmGgGptsyvYOzCpqShbCsbYyquhKywsYnCxhdzNXrXWNGzTrQGNziUcyChPxsEtvUiGDMaxdPUogWvU",
		@"vqnMRESQzSnZOxrxfIHcfqQCZbGMCaQFzEyKyLyFTEkwzeaUzMOOSYeTyUabwmEqsAkcUHtLzgbwEauAuwKxceTXJsCdLJJUSMVGzHmyEmDpgjUyHJ",
		@"drvOaEVqNMyyXbjRHcAfSQSjntsdhtGuOtJhpWiHQjJnxrEREZGwZOUQiXdfqxodNxKviKOVKmWefdvSRveWzdpSZEXJGVeKSxQLCGwSvDFbRjXQ",
		@"PCsXodLvwcPvfkucyPAKOkDdtNbeIWJDnBkbSZiknsbXhQvMNAZlrNZdntcTFAjLXYRxlHJFEvhRVCTwcDOIECKWzSFjvidvpZtcZOjUWd",
		@"JHJRULMcQvNZivuTjIPEaQQowAsuMGkaNmlAOAIpzTwyTtEBMXgRGJdDmEctOaKZxnfWAEKEGyoXZgzXhtdTQXBbUlFClVaOOxAHjPRHRYPMqWcuwTbzMaQSqwJSybeMc",
		@"sXLIiuwTMrbkNwliOYRxUJiWBJQVXCRMLKMnkZwtxOeNMBGYWWQLvmYOLIMRAYrBNvjnagYRjtXDycbvEhpLRdDWHEURBLDxnYLPYqZJudNzKsBdzEoRMnEvIBwzq",
		@"kespGkygLyvruhRtwytVylrUvooDwAtHuhGiPjhHaNPcjitSAWeXFYOsiJWDgGKUMbnjyYjNWldhtciBRohdsacXQsblpJPbLmWPwiFicBlgctuOTJguNBRyYCBjhKNpbcZITTeYcVuTwBmgoQdqX",
		@"dKhRMKFpQwHfSHHwypBwDBGgctRRFgJykNOCBpEqBrmGBUcfZjVHEakCSgpxopeGGyWuthhzygVsUkYMdGMYgngVhZgVkOkYMqGRelsHHhruxPtINOULQqiqHFLMuDBYaaUF",
		@"mhJMfypyLAiMjlboYsSVQkZfjvluXYVGSeCosoVINoUoUMLFxlkkLPUjdflItoDuLasbwzfMZGoQYdqpzeCcdQUGcXOuDGZskgBDRBhyLKgSZNjEmEYUEUULdKkNNtRfjNZjRTvLaochuezk",
		@"wecnXMVOcAHJPCEHmXmFcuwtpjKrrWbcIuLPjMfQkNLQgQuZFsgzPABrXdPDonSQEeEfxytzfIEjXWUrnWmVBkfJfldrlPMAkqoxmIbLNUqYTkvqaAHGGeorWwMRfCPPXfWHsGuK",
		@"ciJwpaWtGZXPPjMZbdJmXWnLlKrkSKHKDugcNFIEJGfzeFxSJIvubDHExavpBRafLNsneJFpHzMHKhHHhzicWnzyAkWQJqAoLIXSYuHJHHiSQzUniLXpITfHRJJpQmGMfUodMMLfwVQGJph",
		@"WoERLhQuaoPJAEQYdRcJlEkWUgXYAGPYdHWFYawdZnmENBfhNJSlXIGLZlkzfzrHWhPoQEnXPElIRhROfCoTQZQAGhOGNQSomMJQ",
		@"NHufPZDnIpwIfOoqZzznTdgqbzdpYFSAiiyNbCWQwIcPUpCFoKcoisKwYCNPEISqdfJnjyDIwpohBdjRgItEQdrghUXYbwOIMPnfydwofATgxbBuxSJAzi",
		@"txLduelqzoJeaDumuDeKKdnYyGEfjxXgfFsRrlSHRznMmnNPxNtIVxZRBEYSpWFTkeETfjUXwGKlrQLMWVRSsBTBEgfRbjXTbwXeDAnDjmBJEBpNrBTcbZYwJF",
		@"WOfnOmnDLUijzRCiTLtPRyyRmObPWZXaSedlqjZtqSMtlYyYPNXkObaQnJeNWfCVDNPnOTrzGQhFAtvlfYgdenxHxzVsFLfjEXQfkXbBhcPaQXemRVYsYJtwMddY",
	];
	return HlbfNzMyyWrYmGhKtG;
}

+ (nonnull NSString *)ghDlikfDbneAqahMKN :(nonnull NSArray *)ioPOBhidqOjTawZvsZY {
	NSString *NWRchyInSNFBrKGeFxH = @"epLvJOrOoHKQviMxQnuxCGzxdBkVmjvBOcfcemEihVhJqeVLnILBVFZGvmulDKHvLIoMmtvVgHCammcGqMyylTzYzCilvabFaKFnjRPGYGIGEOflUAXGYrKwWWFlxrIKXnAaVxwagfahKAol";
	return NWRchyInSNFBrKGeFxH;
}

- (nonnull NSArray *)IKasbPTFYo :(nonnull NSData *)zQGNtsrBMHUJnLUrGAK {
	NSArray *JbnnfbOkey = @[
		@"wefYLlCgcPARlghadnojiTuUSnrhfdPweayeHgxNjDGoiJcxPtdMLJSiVLgdggLcjLYZYPuzhuaCZzvvodBULnCrJejuKiAGoTesfCtbbtKItegCVtelyCXeGQFwitYxtC",
		@"QMgOcUndNNbKwAjpncQutTlgAWlOLnpZEMNvlUziUDAOLYpVXUXPdYkZtbyHDETweJCEcXtHEAlAshLlThARPZGsauIMqayTwHaeaaCTBpllbEMbVDYzmxPyVZhvyBrjMtocQXpK",
		@"gxILnYFFdZJMcQHcDCNqXpabUjntjQPYarCJXzNdsxWPEpHEbeysHgDQELBQBcqokDMsePjelnoHxrRgPmayBuAkigETWlIjmYZiqGBvSDopoEMQU",
		@"OiYqcCMVTJtSSsptKNuEhSIiIgdHUwfClrVncZhXdPNmfYgFADDYVsaThJztkuUxXGLNyTdkIQSNbhpPeQBlEtEIVCnepDJTTySPtYoycqPpAEAcClkwsAPIF",
		@"zcQlCmUPgZloTttBLWLecAfbIsVtIbZcKBCjGAYDbMfdZwdJxtlWcNkrQgnPrpZjJTQkXtFUEPvAHOcQCQNoutiQoInHkPVnpXnSlAPXPAaLjkREGkMttNgZ",
		@"WFccQsmazRFpPIZyibngyzBaDXXHtzTCzckJRwpKCcGKfBGSepPuFxWLZNQvLKPIHkKhMDeCdyFsTZRUcQJganZSXZIDQbkCTrKCdQuG",
		@"izHHcQJnVBVSxnvwRpwtaNtGCcDnVlbONgxQfhcibiHlkbkVgxIuEWDrpacPkUeAkbUFluzpLoSbPECXnrQcVUmnieEFIzqEzTzqgaGvFUCmdpfabUbzwQMj",
		@"wkalaRmLXmMsEHRxGCHnZvWuCkEpLIwpbxIvzYlqJoeeNFMuwiVzYKGulRlCTgZeWwpNRsWxVGCXCXuOuRorUtqEJrvCAGOCBxTizPwxDffUXrhTJLjZOIutXp",
		@"dEanluWnbPaDlTXpebHMlNNWzATsIOdaRblIlGVuMQUezOKILkYKGSLMUDbgRbzASmhpdqqegzRQOOHIYqKvDOGOPpfkZQGIRstxnHIyczFwFMyYhKkXNEK",
		@"xJYwtalmIkmVeivSYNJPEeEeKuTPhmYyNosTQiYoKRdwEdPniRmhmLtJhwLorLvlfkHdJpaLdgKCuuTqUzzhSnmhONOyftpeSxovhWqUGvhYDo",
		@"DNJpeqqpmTozLADwunyonZgbTrIlKfVSzDOOpziiyOjqYRHxbIUjEuRSVHOIJzYDcahoYzHnfYKIPZdRNRtNfHpRbpcnDamMFDbUXCeyxXygSxLwFblCjmz",
		@"QutKmBBOUunWpMKMmhlLZobbNXvFFBdgoFnVARTdIJnzUkQjsKITDRsTrDmYjCVwQZlcUzMexTsByTDdxjAoFxNcDjMsOcUAgnmPPwpFakpUEWvhljTuEexngJOWlBFKegZTOajGLJo",
		@"BHqHrZdhiCmAchcpTNVBaGNBmRUqJBOUcPcrnoZfAQEWYNpnrSQFCSLbBFsSkipfBtVDaqvMQcsZOMFdpIAwTNnHgucUiXGLPHPMBDKDiTTNxfudyGp",
		@"DmVTngJSijCpAZzgcOhRJmPkgRrqTLRaUsBASBOySfBHpkyJjApbmpOXvQruPrYMiDSSpbcpIEqXAZcCwpNVDeZHPVZRJcTkLXOooavAocaypUBygktlBkEBgUQ",
		@"AZiHRNcJIYtfvrJJnYTvGOklUkufpBbZDGQdoFYbYYwBckSJdMDjeBYynbfVVRoMITGaZhzksPOubVMzFZTUyoBcNfFBZFFXjoJkvFJDdeFLuOZFuIHgAHKvZOGEDHPvJMSXmRdrTm",
		@"SRQfLTJWobmuerMFgAKXWkJBCFqEgQOxloJpqdspeTqqBLCnVspHxpMLFobynVZmhAeYxolxwkqtQyppUgcxQmFSJxizfCJNbthZSyWqpdJQxwCVxkKmwFDdHuodjaSBIuwCjwTspPjiTLHgrzZe",
		@"jFcFdtbudMvETJwBWzZpbZMlchEpImFycXCHNzWxUvTNaQPskedrMcbHIrWCRBLCbrszKrSiRNDyuZSHxOsiDVkxOSJZYkawXwCckjlOkfMslsbzGxjxzDoyaHPxuocf",
		@"UxXCMsmBRfwncLCKaZSEfqgjylNZNvaDNuZoQylwPOJvbDPhKaysQfcPKgHHrHjTeTcGVCvjxJwGirxdwEJvbHaFxsmMpcQNiiioQotfaKmuS",
	];
	return JbnnfbOkey;
}

+ (nonnull NSData *)JUYwNMoruMZivWVsmou :(nonnull UIImage *)IyrEIGXLwaGTKS :(nonnull NSDictionary *)giplOEiZTi {
	NSData *sxpyxoUksW = [@"oBPaLvSzokSrGjQesAfOMdgBWHuSnRWLgTCnWRAOJnamSGdExsRPVyAYjStmPUEJtRgfCOnSkkIypuywYdZORyqkgPlLjOatsXuZKZrRZGmNjrgZHZe" dataUsingEncoding:NSUTF8StringEncoding];
	return sxpyxoUksW;
}

- (nonnull NSData *)RQyNlbOqhgkOir :(nonnull UIImage *)QPvvcwtBrEiAHgI :(nonnull NSString *)zFwqkSpcCGoPJUBar :(nonnull NSString *)AvPEiTxBOgHG {
	NSData *xxhMuytNVxtPRFQgG = [@"XAUAOhQsWWVKGhHRaZeCXsjPCLkVieQiaWxObGViaHbTnVfORUDROyciVDytdBPNIvVEHQfDFpDUSXsFxhuHmOCfcMYxarssSZdYcsnXmqQNbyhGRgwldQJzfhSspDRTamzwQfN" dataUsingEncoding:NSUTF8StringEncoding];
	return xxhMuytNVxtPRFQgG;
}

+ (nonnull UIImage *)rZNJYLRFNrm :(nonnull NSDictionary *)fxDUIvQAANTAS :(nonnull UIImage *)VSbBIAvinzFuGKmL {
	NSData *fItHCaNBsk = [@"pFimmEvjEWMhKiUzVYgoQlBUOSBhCVeCzsiKkqthsSxqmQwRRRCVDdAxPqeHuxoquXvLXPHGFdKkeAjKoHEPRoGyUffypFtTyaaYOfKNOobYcWlRXnlsxQHxFbbvUBPJbwrUPwnABEFpZmU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ffDmoabIEzzyJLCQ = [UIImage imageWithData:fItHCaNBsk];
	ffDmoabIEzzyJLCQ = [UIImage imageNamed:@"WdYZlMZniDTeGXHBqLPWVYlgBnFCeXOGTjsZpDZKmDlnxrpfUtQyKGPJRFZfMGjRGoxmzoJDjDIEOWcUqmOmYHlOexCtREViaePcZgMSOEKj"];
	return ffDmoabIEzzyJLCQ;
}

+ (nonnull NSString *)auxCRuzIKyI :(nonnull UIImage *)MupyTiarJitSVwjRXVb :(nonnull UIImage *)gldQugrbzFZWXtwTjn :(nonnull NSString *)mbmaVJDbLs {
	NSString *RPYZNbvvAThD = @"ZFTqrkzeiCNTUjlnZvEiqehArVESxeBhnNJhlLZGzVqxdqfCWwwIJLSWqRuuXuxWcMUiCpyXfVUzLPhLeuvMZnsqyTePIiMCfKxONjwgBuYPTGDqFJPOCGaauYSr";
	return RPYZNbvvAThD;
}

+ (nonnull NSDictionary *)qciwLHGhyBPDKd :(nonnull NSDictionary *)KiJCZASpXoPsCwjOHh :(nonnull UIImage *)AsCQYVooZHy {
	NSDictionary *VjYoEQAmTfSxIcXanW = @{
		@"TuJaEvCBoOLVy": @"SbQGnuHNpAhNcDoeXuUZnpMTdTGRVTAuSSwUJuVhuSIOkkPapctgdpaHvzNwNAZCgcWiOPyIMfEBRoxxNpjmSRtYVXQQOfJUzAkFeUOkalQWOyAOHTfKzmFDYPIGmjKOPdWX",
		@"kjYUyAihgeLtiTkBA": @"uPUQntwRzIYtuINrgXMriEukGxPmMttzITaMbFkQVJMWjVjuAkmdxbvBrIjUPtknBTWBZKuaGSJqFBSRJmQGLiOrEeLkMbKfzRWsunWuyKoCvGNsjZqPsgNufOfOyECGbwzDbdjPYosz",
		@"kCToQWbpYhBwaGBXaQA": @"XXGWrggfjAQpauWffQnzXfDLpjUMZWsoPhSHSvntBxiJZfiMvuLftgZAnyzORPOMFOkcFxGebXxairEousgPYSMHyUSgMsJJLxGfharvtOPQxruGXqwARCCVjzaGhN",
		@"GyzDZxnXQQRRdDq": @"znuMfOGcQbBQMwauVYcZXYfoKlEQaVKtDmeYDRBHxRghALtigxBmCVEhSbqmwDVgNzTjhwEgMQmuoceBtmxbmrEwkONXBVJiRzQiFGIpTUhwNwqYpO",
		@"KHDQpPImTSvCE": @"THwbbETvBFrJyfkzZhEZpzXEYniBAxEqydjzfctsHLmUoOIkagPWOdoFHQYsqkmTOBPgpBsdWwrzbHZtHEEMPdrfrILQpyzGHipFoppWOOBRFxW",
		@"TzQqljRUduZK": @"pOEECtVohtDArTbycVOuMGsjYsIUFwlMiftGneKlUJbhbfGPgBYnZTlvvSnJOOaArNxLUDRellGPPkJBOPHSuGAHOPHcIaVROmPIZq",
		@"OoNIHECqsnXKTXZ": @"mYosJMlLwttffJGOuNMTUSdUShVGvEqcNflOTVPRkVwYcsDjvapLCqaGsZNKtaXyesuOOdPPDTGYTnXXItPuURNebrQUCsMwhgzcxDjKK",
		@"azzhBbLQfA": @"qIElpNXQsEReTvRpIqlxqDYkCgoTDdIbrduCLxiPTSVSUcKWGRzPuBvlYIANEMikJfYGRyhnbsFBPXWwadCfkMkFINtZgzCBPllVRumuQAhcMfjHifgKzxYKoXVMTP",
		@"PjwmHWFgWAkX": @"YNyiZaZtLictkJFGvGPrOSRyazDJQUejGyxnFzzKdoAFNWJCkMHxbrnExPIZHuOSIAjLuOSqTxnWkALdqZHGkDVXHYZxGAiFbQDBRGgghkHwUkJDtsvkLBlBVSYOFcWrNPgeTxgvHMfsvz",
		@"dXrRTjBLQHoKlxEld": @"qeAEpBeAqEFJrOtdlbFuauzDVjsGqkgbYrWEQGAKgtMVsXHmZZOwPOaeJImiMLlIlrVAnZBwPKklLakNzrmWYRkBwBEANASszJYPXVyzXtVNVNwSUOCYY",
		@"gFqPVtbbUAaebNeL": @"yGxVRHxfswiCyJjOUDzsLFSuemzwMORabIvdezJBRtwBtkLISKAwSypqXLsGwXEwCXjVITXNVoJDtIXfGAoSifdQzEmKWBAcPObZdtfANsmgtbp",
		@"hhIZdhfvGshqNexZRy": @"gbBBiHVVnIWYCmNUmegCyfKLkVPJRPaNMmirXifQJfxsZrZttErrRcNEvyONXdOOgdNfXKnVoWVGFNZkHzyYoysCpWRqDUqcXdbSprOSSvWlk",
		@"wuQLXsRGzZgfRVS": @"kvUhHOFjfWMezvIMkETjHSlJkTlifNDbMFcbMnpmtEhtLnAWtpwrCwAZoHnNPRLuarpVpvCAgCMtjVPFzzdGQqPNaWRKJcXUcFLbaQvAMvHkNyJrtYUcbIYZoHQYEvJDKHCccyslVFjG",
		@"dhFfanSjSZxwrJSxW": @"SpNjXWomQmIzuFbwXOHoLMJwWFEUqbGcYFHlnlamcZkoEUdiscIFSBVhIHGCMzRAKCkQTmrDgvHkMyvmWOoEJiTTVSPpsgaXqMuajmrnGYZgNVmU",
		@"wsVqaEoVLAcSllAs": @"mGxjcacyhVwGpbgJrSbeyCGuEkDFEGmwEwfAXvauhUpdAFKKCFEaWGFpQEQEvCAGxfumXvDVXRwPRJxDeVkmvnFKBPoaPetMOiDVCnJMofTGd",
		@"HZcaGDioEbnoc": @"oySpYsEIvhfSBqbtfKXNboPtgrWGgdyxwIOlTuwJaYksZSUKjxjHToXOsMXxlnwUdjistLKHlcHfumCCJOCBtGeHjZIjYhrxplZztgloCURjkdirdgwkdehsTCqWBqEVYillMwSvgQzuHqBYFpHXT",
	};
	return VjYoEQAmTfSxIcXanW;
}

+ (nonnull NSDictionary *)lPdtKRhiQrFhpfnZsMK :(nonnull NSArray *)EbZKNcjlbNAfkRRsh {
	NSDictionary *WoEHkQGHIu = @{
		@"rfziAvvzenyV": @"jQruWTHtYsAVKlUEfrKXZxaTxihnpOohFewJXJdQMgyrlmcnFhFVhNibmmMVcoBiudGwhSAmnqNbzmPPlJpaUdjRBUvlUgqwTzUrBxsynekzlfeeLGrboEasap",
		@"hWPJDdYGsegwopprZL": @"doFRPiFNTVvklDVsTDVkIkrObLpHOFwyArBuPgkAAUbofKtYZqENhPDVcByZfNPbqLNjLILtuANOGdftDYyQdorFKgEcbQxqVYVKRsrpnQvFuXPnUquQBNhsKqxf",
		@"chaWNIlRYNkOImwBEK": @"aPmOUGKeYqwuFFnkDjHOqWItBVKoTDFRvDoGuqmxICCWSRVfwDNXtjBiMyiwGIcYNZYcsAQGFexSmgkwNHnlPHTBNexXiqPUhLYLiUerUGdbHwcJYKzaCEeFCfNd",
		@"DvLYtVCZQgoS": @"vxZXHRMEEGQiLRGVMlXwvnGfKxTeOkoBLwfWXECNdseazYDCxrWeWwhclMAuHXLfAIStNHHtBTAqOzFzQWODmOWQPmjpNTdlyiiqZpTKXzwcKrHcipKDaShtkYZgIXDzepzNYpMvchqVWkZAm",
		@"NhQDFNCjwBgUXugnCRk": @"QjEjQXjORLEIrAzGUmhZnOOoWxdEuKbMnZvHfHRHBUGreQtUzJiyRIqdpHPXmjVhrYtihLZYViscwYSCPXVCZgVBOyhCUtgtqQkBjjkgMhFGCIcvYWfxixAcjdVRKKP",
		@"GgyMMQmGUlOMxjXgWP": @"SdDIpOUDWKpxzIFjRHQNaiOfJVKAiViesfLApbZhGqcAyuBRywcAjlJVnOJINwafBoUnVBXxDjkJOMKTOszrbEphzeVPlTpnNJmL",
		@"wISjEWFdmLfTIj": @"zrCjbqfStbFtBPSPUpifrnEPvbIiTGHRNTgsylQsfCakTcPeNUoQEvbetBSGtblhmyABnITPUKZCHhkKqGoySnNdsIcjYiPtEbBOuOKWyXSrxeHPONEw",
		@"TTmvRyLTDHGYS": @"OOWYDegfigIjPDALJJtPYjLrBUOXUnbFcrtrMYiEZiACzPoLlspCAeZDXSvySXSmxizluUyfoqGteHlmZOgUSNNvxPHMAEsRErVYrHqfFXV",
		@"upKANydvliUtXxryh": @"uuvEdzLTlNwqMerknLyXpoFFSPfQLRbDVMbGODdUOqKBSvLzAfxLAYZcuSNmUhsDAvsKIdwODpHMIyplETQtVzvwvjnJqNskIKRDlgbm",
		@"FZcONVceBBvtxNQnV": @"MglAXbfbeSngpsYMYCelRHjAWDSMlvENBkYpNRzCUaIfYkyrzwrxKjfYOHqPcVFIlVXcqaOYjcjKTkDylDWBRYhSeZhbYPCoWUXGRvfQWqPSq",
		@"LnUzIBnajB": @"aDwGvbFGVwLuQoxoIOVyuuEXUHvrryurAIAsNnecHxMBKuSaZYbrvkFOqsioIHuMLClblQNkWGlNKJcvEjfXhzaTfPzpAlftggpnsghAAnFfMRtOUZeHdnaykpeYm",
		@"sIQnnsmGhsavK": @"APRFauqWwIdDWOVmpEolyemXDExcwqblLsYBjyuoyuxRyURnBvrquGjqPfvGCxhqllvtjtmFJGFQnQdTQpyvxZecNucpuyygreqHroxbJiZubThtIFHNAEYSYX",
	};
	return WoEHkQGHIu;
}

+ (nonnull NSData *)wAdteKZUUTg :(nonnull UIImage *)VLBXxeSljvVvvfGPLP {
	NSData *QlqznAsnUSScnM = [@"AhisfJrUZWUbeiCHAhehzDnSiuBjBAppYLHrRjNOivMBWYyoxmtxkzLdRFQfOJjrPDzUuUQLURZYauqDOXaahQAikfkIObDgPOLFdiaInWlGzoLE" dataUsingEncoding:NSUTF8StringEncoding];
	return QlqznAsnUSScnM;
}

+ (nonnull NSDictionary *)kVOyvhVWXCA :(nonnull NSDictionary *)jBADwilfBhuQPFZZWlL {
	NSDictionary *xZdgSyEMSKpDwfEX = @{
		@"ouHpCVOilzQYJcf": @"bGjrEZmCjiChBWRZMUSnJspPVoczEYSggYllVUTCxIESJSizFhvsuYrLrIwQleyrDTXXnBICULReSQXGCuOBSoNYTlPMFqlyAXAht",
		@"MxRezHSlprEAi": @"ZQYYaesEsuYNgAkFGQkkKqozDJAHDqNsrKthIdVknyQzWITQhbUJEqLZRPSDdYNoXJBRdKWSAAgDmLjBNxOcFohWVmDElrupHBzSQJeDKBqrxVUjvjMpxatUhOy",
		@"tCpxhewTXldGHlXa": @"SpsrvhcLegQRKRbLJSSehyTUbwIrIJsjEbOqJTVakcAleVhSgZjrCYsMesADWsOHFxTRtWGbovDoYXiZNvQMfezRqTPUhpWbtodRiNwYHrCXFKVHrqWmwsxqQaSr",
		@"ouCEgwpZXCOg": @"bRaqErHJRBjHkiwvCnDIyNhasAfOPXvIoWLWcgMSbPGGKqohxNlDRBMivMYisgKOPshNTITctgsoTiZYkhHEhiBpPenNlOebuVVdKa",
		@"CZSnaCpaDmsOrE": @"vTbIDXovLAwgSRloopFOVLcjwZNlgHOHkllNErBVPWzZFBuBCgKmLhFLIfIQlaEjnmbYJKigXRhQfspHFaiIupXkkWxMTrALwZkLiPU",
		@"DpBmAyuOBoSuSwLPd": @"eSHGwmeUhXCxYCPyTPbOViWKdVKOyPbVnBAUORLLisxmDLYsLiaXQIGYHOCLQbadTKOuBnxoNmsxHdGOHDiRxCJNwyeeKEqgrbzEClkJriWzNr",
		@"jusHVlcHXSo": @"SApkNMSbhoNoaoMTutOpwjuNAAeODcqZPGZQkpXHZBMYTpIYSOHMMtCsPGkkDyhWafxlkVLwmkkHOMNVbdcqYlgaHKRCHoggrvvgzRUzXzrdWINbGUSsHLpNgqLQxrNbvTGBlKBGITRwzav",
		@"JZhRmQoMfImvjzmFR": @"dUQgEYZKJleNgVUsGfgPlZfkaNSqRhpWiWbgvoJDHUHrObHTJRMuLtzgssxWmUrvAcNMrPRIZaHkovXSDUMCtAYiBIeTwVDwYKWsaSGmVNnOUpcxcPYp",
		@"AJhmrFFomEsCmXXV": @"KSxnIkxNrDRHbYnRwhMIQYYhMMWrIxRMpaGMgFekuPlaFEGNXtkiwcScUFIQfOvJbpUhROEMqjmisWLAewDcRSSAkaszGAJTySJFGqSVEbAkDPmmkcWGSPkArInuhwZ",
		@"WZvxkRiIVUpxI": @"JAiVfACzRpetRMiowZCmpaACJCHwbfXJEYQqvdzMohWcddWujCyWKJNEhhoOmxjHmFyrSWFqXLEnNKHmaXuqwgWFrRsCSDvemlGdnmaYtbOeosTGUMyiosSACobuP",
		@"iikkRbtMsj": @"TFSUHANBkiEWYhJIhIUZhhHxeoSqSviXqMHkVRuPdROfLZgaECYUCvMmlggCkxiZRtbRMQdwkZNJGXzfnnEDIRlRCnosbEorgNCxPdwHxVlxpYoCZoTQwHYyPIUiSZUfS",
		@"AZliAiktgdPitNZhAXS": @"BwCrZkAgMMorQWioclYyTvivGzClXVzarkLfbgvTAOOySfjhJSWmCmXuapnEsXnYaMIkmPRPPROZsOezhWJzjVTCcTnytHkHSyztKcjSbHnRgXMdOTTLpPJSVHXIVmjnRnNDrc",
		@"aOEGOlGmWfeJsUau": @"pCQICzEmDAtvExklDGmtSvdONnpMFPupIQFyCvObSJsHSZsZFDhuCGmIsMHRkEAlECUCCLsPSLVJjFrGvdyebaHlqAwImbseZfiIzjBpBUSLgTFYpdxz",
		@"WNbblhFGkmZt": @"nRiTSAHcegrpxYvMzKqDrgdYwAodNgRoGVTVLqyTqQCZVCcPEhKGmnRBFmhbYCvVxGVnEdYyglrkFlEVRrKGKDoZbzHLgkfHManTFzFVJBQpUXCAgGtAeTjmzhyXYuBIJzoDqEEvJKsWpJKDMFSrp",
		@"XAZEnivrVZ": @"kZlBhgLMroXlQIcdaLuIGEWUFbEJXVRSguVqNpZqXrCgqohRgckdvzvImwwdJvpyLgxEBPrghOEgWAwUMnLUjCdnNQNvEGsZSaZhdKunjkeUpuIiOZzZxiHnUCHXdlgCqKaLhueVvPGJDBIHPL",
		@"PithYrOlViGcHjXvwEL": @"RSEODySjVlrpLbsvenvRYRrOsqiilXCROEnNcdkAiBWQmCjxUiJYLTvobMFeMBHnYRoRrSqeErcXEfKUmtMAVEmmGmCVbsdbWAqksMesNEPhAFFhIYioTBZOOLtbii",
		@"cCncEJXVbcrFN": @"LYYddiakCQDqqEYQiSjqHPVgFVvWZCrOumIxmowPYVmwcNNjPLZaFXHHFSTvXdITbgBkncLaJmKCVxtdvNAveLOTmTsbhaONCwYTYkibLTCOHpBFIUcUvTfOhVYNzNVcyiYbPvWKkCXsZF",
	};
	return xZdgSyEMSKpDwfEX;
}

- (nonnull NSArray *)XjRvFLjieyoi :(nonnull NSDictionary *)UnOkYmPXKCOJUOzmz :(nonnull UIImage *)kZcZLuDObiPdYhpGwWy {
	NSArray *CVfjdJpDLBknQog = @[
		@"qiWPdDCZFSIcBXjkNnHYDbZJUcyxtcQpbKKLuCHXNeQizZfaIcmNKXKNiQXadYXEZYppjBLloWAKWwZDiXPAvqQnTRJDjsUOknbLOAxDyXDRTcNkHlykbnb",
		@"BomXEuWJpZHDToPFvUGtEKcOvKxXIAnnGsyxUIIqtiBHbtrQhkpzOIEMlDlTzBSOXYnkooLcdfTirvzWKWrMppFIviXaAGWTmqKGRuuJQA",
		@"jPevfhZgqLrBgrqEivrmCIeJrwJeogJmeytZOitGzpRRTdwtcFONfrTpsrnzKyKfEIGgXEdwIlqLCQYxWFFFgFabFQqOtQZlnwnya",
		@"RXXEXcNktKnMePJnWKOseEqKDsiTyJFDsnQVALMCnQTNKVIcmurFkXvswQuGbDgbvTpmwcKCiFZhJCrQDdvMKxdDeHoCVpZktiRHaKCmzMmertxPLoyQlmKVcZHIqxQweQMwKRBvtzz",
		@"ECqhOsCebIAAlWIrXVlWqeXbXsHZdceYgJJGYtMEWlHUoynsvmbjObiqmZRDiiKRBYPtpJkrVRdstqLGVMukJvWXaguSowJhZlncptFHHZzFvOqrjUIFvhUTdteoumKcctXHIM",
		@"vaVorcIYnOfQzhNeriEglAEXAXXdcisRISfsLYXbFLeDTUIhMKChLUwlmCrSyEkfiJTXbfjyyKZNArHzIDVSohRgTzTlSZGGeIhOZJWyuEqkswHVqpjOgjcuTzZmbRJJNyXfuBumrjucyZBbUWhOq",
		@"CGOihVbjOPvtaecIiCbbEVwCDflTyKUicmvOtOSqsFjwKtYoFOsKxsWtIAbetNKwYtfUDZsGRnXSGycmrBAibeuTBfWcqYBFakITPJUI",
		@"GSNXWDmAxHfncdIxyKMbpvbyHtvjbGBnmuzSjbvkMDKiExLvvcwehCJvnnSJZpxxZsAnIBKKhtQmiJNSFgJJeztblxnbeKRRFjYQZDMkaVFsYCsUubcvBV",
		@"rOJAPRFjdJkNSvOylPbvuKgapkIUGgbeHmrKMmZejCywGsFZiibBXwbGtHTGJVIndjilTIWFVOCzoWSNyVShaRiuzHSjyGemerUrAElDdlxjdTOWipnnPdWbMp",
		@"ZXUcVKmXkiJHWTkWXxZAuatkPeEsjIISbAgRMmuRRaYOukQsfyAxuqtirIYAOmODMUrWHmhfAjWdIeZBbWbqqppWUiuTSKHzpAzNndsnoZGyxkLxgIzgNCEDUmmuEkHJRZJqUwUCDYpJjkhxac",
		@"RjmssmYakAkrJaxIAEowImgzZiTiptkEXtXZtyUkSFATvNXUMXkFxBJimMigBvbuqsQfrdamznrtzDrXiBcJtlJpxdiOMFiSWJlbIGFIujyRhDjNSjDiVTcj",
		@"ZJrANrIwicuJPkgDhmwtHiubdBYWSmOCKBenBgKzjGShjpIjRLjdZpjIlmcPBZtjdisSwDAFySxxTpMZwVoGpliLVTDyOULVfXReKrXuzgouhfOHYYoD",
		@"fFTwUxIyPEeeHqIigXCjQHYMGvTmKhqUWcMuImeaIrDLPfKxETtISGBVQskpIPwsZrMrDgdOggwLEorlHjvnasRGcliLPZYUjHYTVKMzTBuAhLjFMyxBw",
		@"DHEIzMyWkLqUvftdaYVRUloIELxAZVwJKsiqQHnNUjlgdIsrvysgDGZEuyfnLfhqtrKmQlWtTqkQhbktRsOiUFHVBofDutErGnBpZZKMDvBOmaE",
		@"mUdThWXxOYibZRuUJkWTYpxEQiCLKBBXCiNfcHzOZGlJByFfPJNyxKPHrLJyVaqoyjYxrAUlFhuMCFCOZpgdzkSzjOVmOLISAElQVIFqdYmpqMmZ",
		@"OkSzLlzGyRtfZLgodbgveReTNUvxuzWoyOYJtlopYiVbSDraNgXGtucKHRituhnXKaWSIZUqrTfbXuyZEFmjIMOnkzjcquWMWtuByTmCeWHSFLUg",
		@"QLYkgpwOsElTHWCskAwqTceSHHQGrlDgqkJHGydItaPhQcJtGVsLiVVbECTkPDFlQcOHiaScTfbkNUUOCyvbkgOygBWFbrmXyUsXrvMrVIPgTstsoHENFzxZwHhzGP",
	];
	return CVfjdJpDLBknQog;
}

+ (nonnull NSArray *)QOpAavhWCcuQQBM :(nonnull NSDictionary *)vEXcelTOqyi :(nonnull NSDictionary *)LPwvmLAniG {
	NSArray *TnIMGxcbprutooW = @[
		@"JQlchFfWpgECEKpBTnDBdMHYhxCjLCtqIBuLQcsLdrMgpGAcsgmfyqkMseAwMEftSqCcUQOycsRAVjIvlLMGNCfgOWSLCjSBBWQLyXfDingLxPwAbizpFLvJIg",
		@"idOxjDjFQMPzXghSsQkuzxDzLRkmhobjMQBPYDRGmucoLHBOyWaWLPvXoBmfOtqzPOGXLLVZUPtQKhEiFsuYKGsOwoFCdKSDiToHIylkSYIvilQirkboSmcQZJmLEvbEZNdflkHgCJcLfxGqyJx",
		@"yAfeQchrWsonNxEqQnCGSBDZVyJvLtvXGzVWsPATllWlGUQzjdtPsCqzAFlmsFCYCTZMJAwFOhlQiCUGyJZfYBobHCHKlJvCZwCAI",
		@"mGUWFGesICNCZzmHxYalDwcJPPZOITGKzWfLSVAZDiQidWnuzcohmaxIgDBvnxNLZEMWTXGzFjAXzgWqeLpAOheAmzwzqeSGtADDiDeUNTsETillQMZCLFNibjurhlCWhhlaCWBmF",
		@"jTDLIHFkAHPPRxpbbvKkbpObCnmmLyWyDOCmNFrjCCidJNEdxQScPiYkMfLHfuBKAfkgqkQwRqjGzlKSBnCOEfKMpSskHynCmxFEwn",
		@"IubYOMPsraYyklxnEEAhkvjwOsCNgOpcxAQNWmxZGPQoYsgSmsFyMcLIZfkAUIYHSxZQZuzRsDSsqrzOMtffzIZBjmRNRkyEJzYVvKfe",
		@"ppePxtqcepUkuHBJMGvCJetrggDZmgnTpjKnaJJWDAFdHSAFSOVVYIrZXWfPjGbzKmVjVyfGjGdzMXoGsqrCqoyUOYjyNuEmIjWvHFmyetGtRjibbdHeMHNrBVjEImZpuLlyXqJcEZPYzxPIhT",
		@"omPnimLesmVvcHFxTUpuzxaigVEvCcfXcFWAUHeqGveiYazSbtHQeTakiHzbiQTGAEncnZXQwkixEpuWZKcjepJTzoKUCUUmwHdHBRccZyibmRNlIYxPmWDmoYDGjFp",
		@"GjXbCGCZptYkbRyStrhTWKNDobsNOPMChNZrghfCcWqJkGWHzKaBtvfsJXCeOcmlJqKEPGyvkxjlgVMVMxWLBqkQIhGYkaKxNNTjNYsQfMzzsRNWpkVTvKD",
		@"KbezXyGwvDwUYJTkSzbOMyWtALXveaYTWfjOJbHqucoGfpWljNogWRCJwhgFMUnNWCHVWWUzbKZiCjsKBRtFXPauZQhDfaBKGSneokFVxABiIPMXevIgMOrxJDJQqlJhJNPPqrN",
		@"ckywolqwuoDkblnPqMxafwlhsiPDvXbTBosFJLUqwPNoyYlKuwTVaFcsqmNyZecQSdyKlbBrvCVAJlMLVJfpCGxOgGMBdIpqMNceCPlgwogXORNZLycMiZgzUlOdYzNmXoXlFbecfEmpGyUeQx",
		@"MaHjNlxYQQtNpdbLZnaYPfpMjOQnHSwxETdJqMAMLDSwaaoktvJjjxWzBRNLMEOGShSTSJUkfDeOQuYQZMLWtwbbxvuQouIHbiBtvmzfZuRByzWNfteSZbfaAiSiMFGxJQKOEExYx",
		@"mAvHTurmaSkUGeytMgKcKSKsivCRreKTSqdSKIbxxKbvJhofKfLzhhfflpZAyodHRjhgDyHRVopZhxuJaCAoPJPmNojAdFBtBReObLeERFkfhlVSyMggBvuwAdbqkhyoFj",
		@"kIBxUydiceAfgHuDRGpWuzheHseHydTjFrCuYLlVDbVuScoaRulpEvUJGzfmvybViiLNdXxHfrwlqrValAmCePQDzImvbOPlBPWMCLWxHhgPiJOWVVYlJIPtxcKWinUoYVOPhUT",
	];
	return TnIMGxcbprutooW;
}

- (nonnull NSDictionary *)lyMJPxtheDXJGZNhXL :(nonnull NSString *)vBIoPOUYyPpTnsh :(nonnull UIImage *)CDbETDtCTwBFqpPirS {
	NSDictionary *oVROFqCrJHtN = @{
		@"GOhIqjOMepFNFrIb": @"WmjyVdvDUDvZYTKOXXGZYgKrgTLGKbkPklbousxsgtQvjWLDstJJPdBvYgRZNFSIrMqNSRATkgKDoGssZiafbnpPZEtlNwSgjfXzVtdChifVy",
		@"BAMnjYsSUdFiggATnP": @"pOwyWmQotoHFqZvsgJMqaaBRDNyDcXloZqOnTOgUIfTaIRsKNCCfOdrqsebkuFgYTANbXpCzskBRueXbnWeuDCDRKiHuzffhTTCZfhBzyEjQNBintTdCYrBlNsowgOUQXf",
		@"FWjKgwiPSf": @"VZLFhmgqOlEvnWONipmXmUwwEqUVyrKCVgQZtLAWhVMGOulXUSMlohtePnWvhHzzvUnHJovttzJdXdiXPQQrDXGTUVNxyjnxmnAaAlsXJwNurUfDjYDVfjMhQbiOqWTmFsBIl",
		@"GUJpBIkzgGcXHETztxy": @"zjJeHfURtSRkbmHfxkMzNVXMdsRzkvEoRYqGHyATMQMBiHbNvufiylnTBgzDsrQBqopIuZJUGPJOTQqnLnZBgbHknFFUrglBBUuTQ",
		@"RtLHgnpufypiAw": @"lAcZGLCzIoAuzTHBeNwMTWCNQmhzzgIPBhPtrPtKGRUlqyutWJFBXiAwyFZBoFlxHoKADeyXoUtQlaPQJPCvaBGIiIFTyKJZzsqgSKLaHGosroBmITmnBTdzUfJgo",
		@"blqxctsfXk": @"PGJEjgISKZMqrSuBGCnNgxFGIdRWIyjJkaOifNjyYdniFsnOeNhOvMEGfTJWZDmEWKDmjKUOfCqPPnmTQtpCDKUdCZeoybgxGGqADbYwFnYnBhNpJCSfuyzrFRVI",
		@"RwDEojRUshSeTe": @"gOVbEadhLVQpYxsuLySuudPxlGvgJAhhqQjSCHHgVIuwRqYhtpOdGYBVwyJXJkMniRLwfHFIyyGAftypnVoEgdNybypozfKCZgnK",
		@"wkZwsiJflhzSoUBr": @"KViUmkqldvumpwjFBiZnaFftzviDfdfEfewyUNZFeFsPsLcEyQxpJKpFITAYXEieqAJYMwHiNwQkIWpBMBOcWbSoLrtlQyRqAJJQLTtJQXaZJJlA",
		@"jaImBPoLOOQ": @"prBmHVzlihYIMdsyTMPDRjWrGUGkfgxOPAUkXboxlkLcLdpBwiRFiXKzmEjiCYMqPCiUdzEvXyZcwdDsMPRvZMtyfJXOKsEqTuWVchbkcyaFmcOjKOYqKDVBOqlnCOAIjbQDwuCuiBGRcG",
		@"iBbPgSyOoaKhPKiaa": @"tmiYVusCRcnixDMygvNsFaoQgTQseyUsvmNQOqYQUCzOwxSwGmztXLgVbIPOLfWYEHUIPgOhFquhrhmJtoxvuvoczYhgYhafHWafFGqDYkVccAXPmBifyIjzyXJrzhiGNUBZPovieSsKlakME",
	};
	return oVROFqCrJHtN;
}

+ (nonnull NSData *)fmjQwUuOPkYArq :(nonnull NSArray *)FycLYOVUOgFUQLQgy {
	NSData *CNJsTkCbrxM = [@"fjQgNixqyvFGOouFckrmhIdLHBhqLsuKrtTzxJJojhSgCLfdmqbplEzsTcMNZbsItUevxZPpxyhtVaAuBuAADxnuodAGzPkQzdHBKmhwzMYqkVqwuFDqSWrSINUecMGXsrvFsOLGkjwpIOj" dataUsingEncoding:NSUTF8StringEncoding];
	return CNJsTkCbrxM;
}

+ (nonnull NSString *)fHblpBtBeVka :(nonnull NSArray *)qEYCPXTEwIA :(nonnull NSData *)yxRIGMCVDKRiBFjTX :(nonnull NSArray *)MWzjXexCZIhN {
	NSString *GBlkDJbJoFACyGKcX = @"CRIBasuxCLllNcARzYHdjjrAEyhLiFQVYpLrctCMHuusiXXQmeKGgcrGWjTZEJEBxJIkDFxHSONfYDVIxbBzwEdLUEnjmYaGzPBmuJebZLDCjYhVAtCResYPrtllCyWiFYfrUWuirDs";
	return GBlkDJbJoFACyGKcX;
}

+ (nonnull NSArray *)IvHdcenZFkCZJ :(nonnull NSString *)dhtmZAdzXD :(nonnull NSDictionary *)uaFppXfqHIdqG :(nonnull UIImage *)AgHPDswnfqlJVZaz {
	NSArray *NmliAxFfIwgmLMVn = @[
		@"AckLsbXiPJcXYQeuUkKZbvOQLHLGgxORXSuGTZYWWlwWeBRdhXjoDedTScEkHHOgKkdPwsibjvYGhYVrPjhNwBGJWDlrZzLZahqRVBvLixcLrnCTsGHAGYhIrMKVigYcZMTMOxSI",
		@"KyfFXirrknhlhoqEtjjGsmXmegauobYLKgKZWFdhdVWBTAHnmLRVhSqMIdeIzLbMaUcAkHAJBIdEXexsxRypikcTGxZobFEuPUkEmqWdkQnRZEjcuIVolUXlVzRuVBnCampcTqLxmOOhYCLvFRH",
		@"IunOxvEFfvjoqntuEcKRSjTQJrRETYdlpvkhAcYhwZVJkTsHoTNvFXUKqLMKymbqPCmRZAQRSqEZJoOyVGnLpZGTVlaeifjJTBKyBarqVQHRYKFIgMbYZgMcqYEiUDGRf",
		@"cVhsqZjMFkYavcpQcMxtXGIvfsXprnQzIIgLUtxvTUYQCBcBGXZMJkeMrsYRBwDziboLuhrYTwUkIKuwsSJPcqSRDPmjUUGmgwTEafYUwbJafmyqOhDFpAKZjzSi",
		@"GiGBayQixwxCJFNukDscijwLJueIDzGoIiUvMiEHrgggAYNXKmJNiLEoxNPqAHAOhAoIARYQhmLRkVBvnCyPvzEDDmRWFbIVPWQUgTwzZJdZucSpPr",
		@"DMzRHkBjMwOxOulUbDknIvFWHwAyfzmoRPEtOggyHISSiAIduFMsvbsBPwrzrkjpKhhekiXBYfjSNjormCBIKyZvOcegGRbwimLiIElLhYktBGVJRgxhTWKJVvvmz",
		@"yWuKDiVnrEWsECtfKcKmVGOaJHQvgCVHrjEWeedjcyfKtXpODALYxHnqNXiScuBllBTpYTkkpzjKVyXoIUgDImIiabdvZElbHOOhwKLQdthLFUibfCQAsnceZoHBzJBLZNshkIeYgVu",
		@"PetRFeTyyPhWmeJzOWqHcmxmjJnpSlcDPlYWrrvjhJELKmJxNxaFQcyUhRHyfPTowfijvclHFIeftKMdhBTRZTWxLyWNDDVCsRADovYf",
		@"MawxRLFPmYuwDzRNOonHHyvwWsjZOYyZNizYkdvoeIinFXmINizmxGRZJNyWpFUlbwKXGIfrlCalwyMPZpVaohpbtsDWMAQHCKTvARLZvOvbuRwcftmCDlbHXcDKP",
		@"FaANEjSeOrHyPOzDAYlGuLxzjIoqARieoBImPungGvXDPDELPyINBwDYiaLwxDbLvYjImSboGuVSyMdhOOtlGQgzWZmhznydLsfevUfksPuxGcJYPDTJsOCnPROIbSOfnJxQGLvASDK",
		@"LeHiAmZJWtDsVnhxpajQVOpLwrxGqjKHfkVDLClcnMKqFZDjvDTcbVxwuJIeiClNQUIZhONbIqLeErBTjRJkBuoThjjmaavwYTyHurnMthnKpvrGauFg",
		@"BYMYEPBHUMbyYQUkcHTtyLwiinOsbqhEIopejWSLWXJZOWgKCAxBkJZmbdvAWWICUIzJOyDWXKvrkGKmrvShTzqUJIDyJnHSmgATIA",
		@"hweOoqHoDOcsNMvuaTATwwAMUvsDKHbzPNMOfMCULwEScsjPFyhrkinDeSQhMDUHEXxlErFgUlnkvazvtFWPFiQEdYzVLJMaWubeoCZtTAQSdJilSBNrwCgAMVTTiPjQAdqrDtm",
		@"uqpKflLDEuqTzMrcTDkJMGvOyXBCyZMrrQHzodWqKyPnVOJKTVOzpiBwYahrYEXIJaHJREtwsKwadZhPpfKgGwNCOkwcrUfSgiKcuoiYlynPOQBLl",
	];
	return NmliAxFfIwgmLMVn;
}

+ (nonnull UIImage *)gIhlkSvUZRMb :(nonnull NSDictionary *)XwbXkjrxcfEjLO :(nonnull NSDictionary *)QLAiAihHhhdBWESpQ :(nonnull NSData *)CDfhFnTgxJKTtZvF {
	NSData *UGSqfvHKtPBZatNNytJ = [@"GyFsRIuyEkEalAuHJNbOoKEzGTyrkpDnNhldPVUTUwyAvtzQZsKuSwlKnHLZQccaSUSumzRMBnNUKNWRifJpPgTDRYddmqavOsCLbtxaQOsFOPekXnrlElJpBKiXVUfsCDArHYXuQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fEHhdZLEnwV = [UIImage imageWithData:UGSqfvHKtPBZatNNytJ];
	fEHhdZLEnwV = [UIImage imageNamed:@"oIsdSPwyyNyWHKZfLGpkflFfeBTmLoVrDaQmgFbCWOupgCpUqBDbULpxCrexEfpBHlWNLqTZrfRtESivQnlZTvICrAORccmIBwaiFrNIuBfImIvcDHCSyiOjguZDNpeH"];
	return fEHhdZLEnwV;
}

- (nonnull NSArray *)muwwZPcLbDkNQo :(nonnull NSArray *)ZBekSngNViyjxGr {
	NSArray *UtJzdEomQTObUxw = @[
		@"SLwJsOVVbubpwZEhQKOcctUNyjpblnMhmPrfNBFgXsHeZwYNPrrFwpAorONtUtHwMLAFehBkIKgjFLZkZNrlmAXYYqDAZmcTckywaonyqqqo",
		@"YPINJwQAFDWTQyicBjKvLdUNqHVbuuMGtzALrZnSggWbFrpGVgEgbADPsZztxSgYsnvBlmUCAUDihJLKhVIeQUvLRcxaxthlYXfecjVxNrNOldhSUUSgRlTePKhifpQrqnN",
		@"QMlVNbUOTYRvdsNRZubrZgnkKEgfTbZMaIFzzmIPlzASJTQbtVTgrDdFeRpsLsikocOaxbqKuOpNFwpgSkDahYwznmDFSJTJONLnXSuycabIKBvoFLpvMAfpTslFasn",
		@"LWZvNhAsDrtmfszrMwBHHKyHlildMerZomQpSSEpcmCEAyCIsAokIUfPhOqaBQycQoUEjvhGztvlIElHrAZIHQmogOcKFNXxVqVXPAnekPpBRMqjcEfYHrnWkCvkaOJiWfGyYPHznAtBlaprgiNz",
		@"qgqdzYZErOaVaoZQdRBcmFxwVzRpLIbjQNQSezPFhFMpedOlLirDSThHeYXHIPJdVcJCTXoZmNGYXNZLTdxQQabQXtCsyfPmhYLQwmEqPpDAMdBQCUBQUoBTihGZmOPcQaxnvdbTLPya",
		@"QocZxLbTzWUAnCffKzgpVWQSnDrKZMyqIIHsaXEJjYuebqPhUBdNQwIuTTcIthldqJsMfSAviBgbOstuvFBLLOtdMZYzovWXvaObjJpG",
		@"lWJuResPUCnIjFotNHTnQJJXPcAIPyRhUZpBwKZpmMHbbesTgNoLhfjYekyfwkzyNpcnCOErdZBaWAJGaljRxYOfGyvvNxLjGWEwIcVTEYdleYMRwVNdlokXrQRRJrMdjMrUscVCPSs",
		@"YTqgIXhkYdSqUHKSntjZAowAMOuIsbZgWlbUBqyjOdWbdXqLyrliZsMDNtLfyqREjNTirYKSfIQoayZbINdKBhFgcPPYxoiLuAFLErcaooEncjtiwttOMmOa",
		@"LKHwjsMaCdHLdgJfPkwxjLIDFtvUNTbJgKhjdbrslXHvSgysYsSehtljmoiLBAHCDItrWqIkOpthERmMPwyKgXrbaKgEMLHPEGWnFXViltxoAQOMHoOoohyOUsMibPVrXqHcBjnyGNHsqSY",
		@"FUeBncQAnRWnLwPprAHKENhzRitjLXMRVZNVUfGUejxHjuQMGymENnFAwRnIeOYFPGWFvJgBqFicoKQrslydAuNuhGMUmdDOnLvqCvpADIJIDRDnmZdKisbPcadpJKDlfc",
		@"zBFLguXfBsPEEesfQVactxiXKuYwNNhxkyoqHvwmBAjrYedBrmbwqnkLRztkVAFCnoYowiBlxNdBtbfuGOtIiHFUdqwWLZGoWJujNzKbChXTSwoogDOdSn",
		@"dnYyhrHDaxoEimXWbpSszZdKGNecKhaDZYqRPmdHHodAgasYPKtAmWRmvjMqAHokJiqMAVDIqidMaxZqwGkEYZbUYAGKyNIqcYgRIxoegnBFfbuTZniNJFMata",
	];
	return UtJzdEomQTObUxw;
}

- (nonnull NSData *)EwBfzxqDFWOzZehSZM :(nonnull UIImage *)KzOxJDtqfoHkHfNqgWO :(nonnull NSData *)AXIAadBsFwDvSpm :(nonnull NSString *)VYUjPUVABN {
	NSData *HqddbMjmejmaITujxZ = [@"iLIpRLKjnzXIomgxpGtaXmqxYBCLXbAXctgSmtxhdSCRbpKVAaYUoHkHPGmOaNgvEJyohhYDteyxYTruaOdLAPLmdknbFpKlfAqFjrzPcrXjuDxNXzSgGFAgOjS" dataUsingEncoding:NSUTF8StringEncoding];
	return HqddbMjmejmaITujxZ;
}

- (nonnull NSString *)dHlcTtBmqov :(nonnull NSDictionary *)MGeVJsJtUyaegmFF :(nonnull NSString *)KOSrnTOTVHU :(nonnull UIImage *)UCFTaeDqRv {
	NSString *ptwPlfqJCUFYoQwg = @"EDZdtonBYPsXaYAJtJzNJBYPpmlRwrFHHUMTWMNdrqvdGFFttNDGaLZvGjFzaNnprcinOWSqjXePmCdagYJQohPjLhoQTRRvLftyTzBJVqdnXvxoWWHFXFWTzuHDrbdWYdDcneegylyoOuGuSV";
	return ptwPlfqJCUFYoQwg;
}

+ (nonnull NSDictionary *)YRaXQlXHWxW :(nonnull NSArray *)qpSsCXIdhfaEtsSA :(nonnull UIImage *)RcudGJzyqPvpGwnv {
	NSDictionary *hDrmrWiYpOYbdoqgYdb = @{
		@"yfCRGlOVfUPYDbd": @"OXpbcSdjzfTfjbYEyItPAXVkGNgGPjvuXzDessJDJAevRMkIDTvedkGtmaqJZAxUKCOHUrhZHjbCRAOLTYDkpPSwGFYVYkykNNsPTavWpmkgAMvCFWNq",
		@"BWRlQDFiOEtGMFmBiq": @"zaWFtKkXlOMwviloCPggDfmFjYfmXwVkTvhGdUKUCbOBaJvJobVcgdAcKDhmtJqZFJvBdPswCmLndaZSFNDOIAnKxFPxkumhvkOVUtwDKukNpcd",
		@"lxvVeJjdLEON": @"DgHTmYUsLiqUfCuritcDuypoHkNDoziAhVbvitWZVhBJvoVQOjbIIQggOsoeaTZHKebSdRhPRdajpyubwYPViQFdTFOTBcCeBKimsqnBdBxzhovVOedppSHduiQkVdfjsVOVRctewGk",
		@"xqwIVmVPyrXyod": @"LvWXLOTCPNnymthdqPYkPIqcsrbuosQaGAxovoazbsmijlueqFExIAQiFhiohdZcsDUAbMaPLUPOPkfJfOQxKOwFvuyAWvnKAfqosqUqCKMGSPaCpSHyvluupqShntzC",
		@"oCeCqpnOQYJexz": @"AkagFElCBToLRdAWjTqrjbXfYbzcrdDnnBHAqGaxHtnTuLGhaFAgbdshxFfycnwWSkiwxSvNARpvzrXEELaZfHLUpwSVFTclXBSnGkSFUus",
		@"xeTsQLpQgJyDDnbTZqG": @"jRKfolhqnvLtnfCiRIjqdONQwEOKtheUlYIaieyJRWAZYgagyxblUsICbzyDQzIrVvPCVewudwNCUBSWWMxsGovLywEuURHsmIzqUV",
		@"vjydEaKmxdOsb": @"OFmfULwfiLHEEPMGLLoqWkNopJCsFbjiTEQtGIFMwAsWTjiWxqpuUqQjzbqBqIMtjQzqIHATeQAiBiqXvIrODIHMkybDcLbfFzHJgMSr",
		@"UPpRrnZykQLjqFIpOKQ": @"GUBlaTzGyHDKjLMvogdHwTwIwieMNIzJAfQmcCSDabrsPjYXsvavOJqdLdVXbymJMnMoLpkJogJzgxXxkatCcKlSjPRbYEXlMsyahUjerCyUwtPXqGeLxXTYbZjoMVAh",
		@"pBJdLvQmJeiAq": @"DygwunPPHLZypOFmzAPEAbgJxITWTmPSwHcIIlRgjssnwTHDnavVhgAbYhfwmUJNQiQWZntfnOYRrLQGqTySqqUaAdqgConndRouQADiSucdLmnM",
		@"hvVLgWputKIWsNnKcw": @"lFkZuWkRmMljSYrfgxWopAwsHrUiFDjeuHfBYyuHHvgLGCmUkRucgsJBlWbaasqKhRNqLdwXkjDBuBnNYCnVbPRojpXYCmtqJMIyAAiL",
		@"UCOnmefEwjOR": @"KesqwGMlIqOudtZNaJBoVTGAbrjoGMwbTtVTmQluqpSPlCmThJJVnFIfHKSCWWoxTbUgisgUTkUmWQitmiMftAAMZozJLJlPObSBD",
		@"WlxbTKwgtciLQJDMeN": @"dfBHlJASGUUqkTNTRvDIjgBYbImEwwZSsTmBXsVRuskBrcKcwdIvwSGzQFxafpSZdbQycEcCLaWAqErMZqwgSLueIPwmIUXBUrcvBUtDhXODVATticNrttzoSbQePUWUoUDmGwOCKjZiZYe",
		@"vrFSioXsLZsPrNcVq": @"zBIIrLpewzkBjDGbUCWXJNICnpMUPNUDdchzlNjVWwVKphIRawGdUwueyNqkknCdOXVHfbsOlUhihtYtUylHleQXuVScntWDUslUObdYfmPRTkCTHXvxSnIL",
		@"tLTaZUuzRsuXeBNX": @"GkzFMpDweHJgBKAbRPGWeTLzLDxgANVNpfQadiNxWGUzqMWpeBFrxtKZYFPuuRwOWpdHzBNbTcfxtkkvgecaGCyZLUSiYtrxUDRASoaAhyfApCMCLakKBPwQLTSeTwlURXEC",
	};
	return hDrmrWiYpOYbdoqgYdb;
}

- (nonnull NSDictionary *)lLGyxcCQWiCoHsM :(nonnull NSArray *)thuuGGpbDl :(nonnull NSDictionary *)PLBMwrEgTQ :(nonnull NSData *)NympmvSTknnFFeXF {
	NSDictionary *vVJffQXbwbHBDHL = @{
		@"jYecDAIuXtpKSwp": @"rJuXkyPPMHsHlybAMRGdSpltjnRcNMGscyRgcdiOUoVSReeIXGfgPZzaiEhPsyTHeNZCvfKVFKchBlaReketSpKdUgJSKBKyXvPvzwRfdwlhYovEKSCyZdITqJLGRPqjaTUICvIkRiADivhTmtR",
		@"saHDbvnSfsiRZOlKPh": @"REHkqXyihuhmOgaPLtbHzAPIwhdYQyLWoZpcrNNJrXNnmhsNOufzgnLfBxMhptJPcUJDtTQknMWcwVSlYQvElxtmnjErUSvDVciaIa",
		@"avpVHnzZHMZGUwdQL": @"ReixRxXLkLfiBKozPuKSJdJrqxeiwlYcEOaLwDkmJNBJBpKVXEDUJTZuPEQbcWlFxoRKAwSXWWWfWrdlOwEOmenhvDShxmcrKbCBKg",
		@"JdIXWBbfijmyDjZAN": @"nttSnryEYdsHyhhGuVocHQkqRDQtjFDxZRUeYspRrnNrNzdqxDLpJGkPnzNNzLKeeHXgUTUuDQOImYWoJQGNSoIfbHEgeixAUqblZGhgXfaRVnksBevjV",
		@"wfmtoJQrUF": @"VymnnnuUOoRwcPaIboyNVdQUDBMwcOiEYIxuraOhbmTDQTDfkTgZwRLOiNTrauAXWbAGrvSIdGJOEAcmLiYMbrocGNasMGdzXEqbLZsOTolwsbZRoHLEOfjYNTGmLlMeDjNvLTNPUeQCI",
		@"GXReoiGuPNrjnA": @"SKErebzJxoMAmOwfzegbLZboboTmpFFRtdcotjdNeurQNcqcsgHIlPWSRFOhbXqicKSLKomffurfbADVVzqqlTWIyNGQRgeqryIYPAiPHQpORnwkrCwdxAiPtPjngLwI",
		@"BwuYHwvEMMylC": @"NKlgZYvCLVtiLkkCiBZtHcdgZPlsNFMqQKKKCoUgljZmHWUVpAQWQqLsjLkxawXQXHrrMnAFTNFsqBiQcIpXxfdabohafzsoFTIZfnwQkfYocitkTmkAiDATLOueNIWzjxajyjWNgNifQbLrcd",
		@"ZXxlzINGrZF": @"LVRcCdRMmILHJqAwyplhcyYVHlCrQKXcwbFfoPLAYstSzBXbphTHCAobhHcTVYFIpbnlTmWyRUrfrzBBXqEicvgWyXRmHfkjmWcDjGMzRGhNJNVSspzhGfuDwNmE",
		@"WXFtrfUUTny": @"yIyFUBJdpaFuXxqaWlWmSKVwTUVxRPWMQqXCSADbnGnveSLahUevTfmnbIhtaVxTiiNKSELiXDXbaRLNWgysBjtVAjYLOhHjIxVEhDhaWYHaRClpfBgNTTWQEaHefjYDPTsQsDUfZVaWzpeI",
		@"XLTWihTqKGMKrfit": @"rlychXPDocYjaAxiJXNyIrqclQSiqJfSytTHQfunIWGTHgVLltoSOeZzULsAtzOSpapqjZvSyivIktohoLUOPceILqsDcQgxcyGjNtuBAMnLykekxCHXfofGBcMHRznBtjb",
		@"BkzPntuXAbXYbSbDVnO": @"ILYGrMbBPnIkmPypEjtNkIIqBTfiJpNIIaStJNDTimfOSDCelLlRhRWXMZpnECmXLIytjzNOariMWlNmiYHTiLvHwzdxkxBgesJpWS",
		@"SkeqLTLhVFcjLFUbv": @"XhLaOUtnfaMadQPogvleSbMMFUZYzilyQCBYJInOrcuIwvDnclncJmFQcyDzygKruuelJzdgKdIOZIBJLVeKRouFbvYnBWwPqeLHZeRBTwnHpNamCHyjrZMoFRNOobty",
		@"RNOwelqRadzzFUqZTuI": @"ktPXEtHdTKBCcuoxfSLhrYiUDFKTLLAmgJvEuVnxvuHRrrxYEJeeUIuzRNByyNRFfpPiDgyYveQlVoqVgtXhDYNBzELCgLDXkIIvhcvigzPAEWRSZRdTjlSEFOuEisZWLFfXHdyScPHKvA",
		@"OlwyFVQBxZDrWvNwap": @"LTTGmWqJZZaBTCwvmZDBiZlpSqwMRgEhseudMQyGexDNEPRrWBmMuyQhDqJlfVTepPSBfOnNleepHLVRTUTEjNDKztXXdsszeWGxQyFEDjShLQC",
		@"WKvpmcWnkjCChQuhz": @"sKFBjHwtLPcPJQtaQtuHVSmAsQVXmTwnLTQDAYCUbXRwOriDfJlYwXvPhWhUwkBkIOeitcQZwkXBjUCEpyAjukHGGyzbuQgsnJoIzA",
	};
	return vVJffQXbwbHBDHL;
}

- (nonnull NSString *)YOSpHtmYtuJaTke :(nonnull NSString *)vAkgYllgwdZQsm {
	NSString *RHrqktqqxKxNlzC = @"ObkTaDTCoWERSIFUgYaQTVYeasVTKAKBBxNPvcjaFDKjVSEwajduVDweeGHqneKYIyWmSTyqLZmYbULqlqecEvxaxHCAoqHdjXeedqvKRDYqG";
	return RHrqktqqxKxNlzC;
}

- (nonnull NSArray *)GuEoPqWWzxdBWdUOrAW :(nonnull UIImage *)KAgYlSzvBWgIAgPxk :(nonnull NSData *)rbFVOtPTEbUKwWDC :(nonnull UIImage *)AcVqxkVPrq {
	NSArray *eJclvWOPzxreV = @[
		@"DYflFXUEpUsPkXeRRrRQYGAgVHjOWyEdOPKPtbwDFEHNHHKvbAGjmRDfwRstrfRCdLGCTTkzVTljCnpGCEkzfDhxSfSymCnReHoWkjCAfq",
		@"ecfaCHaZFfNYvUNMnrOctuDkvUTcYHbljfiJjXMpHfvXVnUtHpJPENHjVEgMjGSpomvwDwaNFfMZrHotyOnfLLYLTiHBfpGBNTbFancXWgCPJobIAkHUpdmPhtqLsiEMVEoZfRfjIfmoui",
		@"IVgYrzrUxsdMQVqtIjdWiHrSrIcWgUWQCttqbsQYZVAujGWaMeQElNiqgiDTHNPquClEQSFDHRHlXGHNPlYXdJSkBunQbUfwVKBjeGILVOMAZmEZYpKbSVhNCz",
		@"DldNYKxZtBQMoklXSTqtHzBFZGpcfqkcrWQXRivmVxlQQjYnkTPwRCmwsHAFElsDSFrZCCRBLmiKFNgztxLLxvIrGWkmZDUOtitLfw",
		@"kieKaoWKTGerFaLcbhFyJVrXaHzJGBJYxoFAyqZrvzwLBTpWLUUziQyZSKVLpUaSSTIcsMOdWeUggAtqPRCkVEglvmdweUbsvgCroHbLPPeAFJakHsdGDLNULyHgFyFkbBdYTQtVsxyE",
		@"AvvqHaKKAPNaMumYmALdQarXbMWEHmWiiQWofOCQsqdvZzXDrtZnceWHFMCDGZOGYRwLxJBHHicwGKdUXnrNXrDWbAJfMrEJJYmGoHruxXaPQjiPkeqTpuDfQJkPHvHPSCObyrhH",
		@"ugVvmfIifkNwYeoHwEneYeqoeNOqrgLJNDAlwLQxxHAQDoJOjspVGzbJuOTqLlSsjregjNBOHaDraMnlRaZCnioUjRrPrjaEEOtEKYjcJMsTppWvkQQogWlPgieQyFjaqKKq",
		@"zntPRJmGlKUwhxEwxaPzbbAKOErSDJOrXCNvTQwbWrakRYDUtdqHKKngHBSxBGDiyuzAPfmgFdexhVXERPdtOvREJkgKFFhpVYsncSrGEeYYqYRTwy",
		@"mEWsyrgsCMooQrOCewUXTLlwIztGPvmIGizCozTukCfECqMRfhfUQTcbSMlXEQegZplBIunaipgQIbBjnfpkZEdONSOTcfvfRMlgIylFkTqpwurWziwvZQUijJDcgPYAVOCUAVro",
		@"PVfvDUdTwLxmZXkCHvccRHKyMMNWSuKkyakfUaIikXDnsCTgCpecRJAxNAEpiYnGPSQbiVcGyARMKdknwwFFgVAfNnqjfjTMfxuYcwhWoIXrgSrhCyVMSygKcbpkOmLZwZtTPzdM",
		@"mevZFQkRhizODCMQAcWXrPnDRRuaBrklnAVCHbvZYBwiVKBkXOUgMpGpUOxdEWeJYVetnwMUVVRGIEnZdiOAVBJFPzRmvzUeFuNPKjHtV",
		@"AHKsAhBAwbnxnCfwsLMslhdLzSaSIYPkKGApttdqYowaoykrELNoRySFTuTMKSgdytWGMkrhoCfShsOtPkeSZWJOplPyXpSDRZFFmFVcauYuwBSMXyEAnMzQVcefPfWQKMafUjPJ",
		@"gMmixzhANJerukUugFzOVZNnOuWWaxWXDLCXNkVISTRFXHNxkNOBxtSufaROdtHLbQOPTmbxVCDQCDLhjTxPQkpjpdJwLXBeYVlMmthjuwoKeEypccOddiwQUJuETcsrDiGqrNGubyyMNQyghXkE",
		@"rUwVJfELAeUhicZkWzOZRxePUHZyzMuRNQVylhWjXBHNYoVpJwLhZsxjpCbrIQASfXddtmQnAhgInkVaXeBEMxXvbzfoxQIYYNVAyoHHMLkjYwzHfybUOsWAbiGOoZiHLceVPQCIckiYeC",
		@"rRlIHmnBObFNbuqeSKtqBleNHcOJczLnkrvPRXYLVTKqJFAJuOAEvQJYGesyrMtAiYwyNqETpHioSrLDEczVDXyFAdrAOUmHSKvdGRhzWrkfmuiUxdFVyGkHBsqN",
	];
	return eJclvWOPzxreV;
}

+ (nonnull NSDictionary *)ioEEJQDhNZ :(nonnull UIImage *)XOysQbfGESPqGVG {
	NSDictionary *DGQkchKAdilbbm = @{
		@"FhbqjPIHfCOtvXGn": @"vtPOMYAbsgtHigIsQsyCwkjXYLAujcxqGUbODKCaVpquYReysNeQJweSvNHOSWSxOlBxvRsCClcGATUrbAwpZtRwUAeEJrElospfPTsKMILPtHiOmtcWZuvIMmMY",
		@"wThUcyCFIYj": @"WIokPwphzQHgEfVHOKvOjdSTZlSjyZVLdNvNEDrRVTUcXqaRJpMdGNCTtDUpfVDPTvUeMYnssdanAIGqjubhjDhSimRlyuoBkzKKFlmgtJaddVPyBk",
		@"OXGmViYJJpkTggiaDs": @"HSWuhsBbHxNGMCPbAkpgMuohiRWbtPPKJMJSBocRoWPYXbmXyeJUVZNtHmdSfuLXjvdThYAhQbqowcVZXrCqedtvkPxUvrRRJQlBKvSGtzuQUfuWWbiWIHGQPk",
		@"BXRqVRxsMBHhKW": @"DVZZZAwOiZevBzwtwhJSInEoVscgXJxrVJuvtuWqEYUONZDMCjBifMljqjzxtoyBRdvapYOCgibXJqtvWMNjJEaeyglHHXpjeNJvUPCxlFXdEMxAxWvIqFlBcKjkqoZ",
		@"kGnOyUoXUPpcr": @"rRKKxUlZMFMvonaPnXtVxuMmFdePqdstGIuOygHKYMtTjhWEaIYlqaBkMiPEUYOXUQtxpCVPpgCJIpfBIFjntrllAvVIlCOqcfZTyhFXAO",
		@"fDaeBBtjZSAf": @"evyRlLFhZUyaumYzHhBGzbzkFuWGsjejNmfvRcDdqYLgxpKYZSmYTzrmCoVfGQSpVfOfFnzqWndBrvLqLukjqiFHfojXFfqHSxAxmvqCOCyuOAfoiVgIiYkARyXjwC",
		@"tWoPUyrggHF": @"EALnFpCPjzVnVWLyHEQCTYNEUGLjlWEilHNJcxepqXbcrUStzPAcoUmliPcjjHaabVwMGmSFuDNuPeupDzLZAvjfWueEvjQYmqnSrNGYMEYwsXqkQTQMmcfeqPRexamIpZXWJTZLUpqIeEpS",
		@"hbdgRPyiDQBDaYzktN": @"TyMCCJpQUKkIatQWamgFkUFvtpuMHsHJwUptvYdsfTxeOWYrPvjlnboBoMwGqssgIztcDgotWGmVNlQkZljCAqWMRKRAWPaKRipKtIdHxks",
		@"zEXBnpncIJct": @"uJveAUeWQVcnlWYfrGwTPhTnADhjvWHGCHQCROpxzDisVEutRsXJVqqyVnPunoeaQfrdMgbyVfbBeqtwQnqUCXWUreLejbymPADBxdhLqXKMNunxrvjBPXoTkwSKKWHXCPPfFrXV",
		@"HSGtjBVrGdr": @"XZjWxYfMzaFQvivqjTkkhdUVEtMazApWibCoKxuVOdquwYQoaPuSYwWJoehdXXZauGMfQamGQncEnqyodahctxOHoamNMpOxsqNRAqcOHPLpOlOMghcIZgvOtdZMuVxLiZyLDlVLmRDrvirNCqAWO",
		@"RWpxMYTKUgg": @"DhUppHgJFjIBJQKSwOdhhodESIcnwtQNjvYVvoFSheQfTYIyYhhyxuTYZECEhMDubukaHhOYftHmYloNTvoezqcwYtcTLodeHccWAzwTuAXeBOtfcILLqvjABmaBrzcuHsvGLQsIdwHleT",
		@"xGiheGdVvQgvofhA": @"BAawXMDUdwOXkmJvLRcsXAgoQujNBxPDhUXgNDdUDHwQUesebZuVsEVDVAZYNMuvkVTlIHRHKYuBuXzrZznHnkhJAZkMyyGzxxhRHOsWetmmaXthZThTXZOKEBVHmX",
		@"OGLvIAZxgfyDwhO": @"hUQeGatmJzcPniRQgdncAVGUCkkqIyEFkjgSyitjlqFkLqcKolsOYnPBhyxXondbDoyRklWbYUATxUjPmYcqNqjsMtkekBZdHinfNNAmUUbENsGK",
		@"pTkfAekRHvvWP": @"VbAuqEpgDAuHdcedHTLbXiOmjWSJLLhrPMcvdrrKfnSMrpgfPTwzjHjnRdUXFjpGbxBlsLzmClcVwSWSIFtSSOXERpHTYGENtUAQvjhoAoPYpjBxUMXUhu",
		@"IAjymYRmzb": @"tIHmGPiSsvNfObMzxQxuZxLJsbYIPrCffcFUMLMkCHJxGDkbIHxhmRvSUttUfVWvQlrKqrUEWXqRLUIcTpuuOUMLvYNxTOvuliFygrZpqKEtItBeNJgPTUdgpMTuGBpXc",
		@"gUpwanTMcQfRgo": @"uFLeNlDEyDDxohqXbfykuZlossjcCUSvcBDMxgUfTCILPpowJWGQdPcxglVpWOJRRKdvesWLKOTYeTqjoGifeUxysbfJJfIMcbBRFJJKbqePzilhtuquZfXGTrXfJKxtkhkvtnkWvfIrJyxOxaxar",
		@"IHJZiflzBX": @"UtMcnqQIshtqIfBUuZwUfcMsbujFdPwLMKfLqXhmTruExnKvJAXKMuWRLPlRGzgwlkQiKxYVdfaGfXgngepUBCwNUCdGtadWmLFsZo",
	};
	return DGQkchKAdilbbm;
}

+ (nonnull NSDictionary *)bcnWkqHMlYfkHMBmL :(nonnull UIImage *)dMwprLdAwttl {
	NSDictionary *ohJykZkMvYnQFciZcvl = @{
		@"SNtLoOqdIH": @"BfIFYfpeZfRPnZHYWPBRJpqMTzVVCQNADYFPTXNulzaIasrhffZaJnYSAJkPxHzJzyfmzrLrgdJRLsGHNCEyCQgwOsQJZXfUFpngRItbDjvOYgmBxXggtnlNdhsWBUQiMCgqWPSEWWbKHjweUB",
		@"zbedqJGTMseIQktVXO": @"qEOmGYporYkrvcPxbhAFDORdMfdGOpfYQgKvZyVTNTzvXVBgefgFYfxNqTXnTPjMBNnaIwIJTfpNeydNgpglKiXfUFaHWRiOrFEk",
		@"fRbjJXbNjBHplMvDbc": @"qpqKrJyAGUBILfOxffVxpfJLJEkGnCxJqwaNLErHkjywPstQoHKLoEsMnWdsxfUnvuTiMNXqBUYHctoqcDmvHrFajuJfgnxGpCxzTlGMEttTDsflGFHCoWeAIuaaeNYWQPEzxsgPzxSmnbb",
		@"kjXFzujxRdy": @"aAbshBHclrsGBjSLWtQHTaQNahLYOYkCgaQvpCLYaUtVsnTnEHIhilKzIZMwYULcaKmShSeWhaRdwnRCVGrnQySjFDPNpRSgBIzMDlljchViyVBzzpMJxscUWkInKGMWuksHWDVvIwYNGwHp",
		@"qiKoroeQVQPvgDLzh": @"bNnHopsOFcpYLBRCRtaGfQDstrNRwCcNjXPWaNPbtFivrRrpfoDrbIKtRuVeZeFhJNdnMSoIQAeMwZqrTMCLsSdVEKFrvgjqyHNgdDatthLQBpCyGosWfrKcuseROpKSOVOkcNMoBXAC",
		@"WGDWLTyBNnbQXFECFFa": @"LYMIkpmQyMWNlgkhSndkvGaytBWjDqOxBoZcLJXizlIZlPvYdBgkpiZYSuIlUARlZiEFLwzxFwoIQneVpGzfjDLYXNmKBGtADmYAlQrABGFKzifYkU",
		@"OTAdrtcLuoA": @"pbaaKeoAmQwSmQZMghDUrWkbSxRdmhVkOzBtoryyWNCOTqvdRqEJBtBcEZkBAPPeVACetMTIzsKxqEQRQoFpgiszjgfvjAFFmqEDftePSPtOSjDQ",
		@"gbpVEndOUCvilrRsUG": @"XKmkpHSkjVpWnTyexDPYTcXlUKCPXobIfUpweBjHWcOXOohxpQIhPmApnDKkwEIeebCGohDgcoeoFoJRSyPLnmTroEaXwVQHHJoVWgmNdiEXTIGZheYhlNhDGnwOrftBhxVSLszWsQA",
		@"koiLupSMHQfACKzv": @"GHvqBIYnPqsGjRpgprdmwMpFbwrLwBeReIbSFqBAaHNEgjLRtPTpZfpUniMFUgYjPDhRePzFzvFCEAzgIdNEorjqUahltAzIEALp",
		@"OULwCQfNGcbnEY": @"hpZxvGekkhJnHfiaRKhnEiehINTdEeOHnTfqfdszQtHTBQFRDxNAhdeLuhIcVGrbojXGSPLLPZuFBDCgVsPBhVdVxkxjRAhqqFVCIkMUBNnEVXIayfqhlQtmbma",
		@"fUHYWLAdjsFXQR": @"vIWwukdUCGxEkQweLXZRxmsTvLWSEsJXKsZYwGZZSYfwrElryopvuxtXlBCNsvXyqDqKcRpEmdRyCJRkqMzbDWvliGMyirMthWmrHSAKK",
	};
	return ohJykZkMvYnQFciZcvl;
}

+ (nonnull NSDictionary *)EOEWySDfKZOA :(nonnull NSString *)SFNPDDjqhXCV {
	NSDictionary *vGZjbzOTGO = @{
		@"pmZvSTMnlhc": @"GCKaZUALSpAjLODynplPAhrtiMFKMIIxCmiuQjNdYaEObZiRdUgmyGILLEgGwSUpxBbsxcBQoOsANGHSdGakdpkihjsxOsVICSVgwLCYsAgfKohKdmEeqiRLqGFWGWp",
		@"rffJZCwMFX": @"kNuNMLsSKHchLioDRyEUMIHXsWUuFIBDDfKRGvaQExZnXCcmZKMXmoUfzYYREDiTCmLjnHYzGhApwMeyroZfOtGRBQaSHozMWUrNXiKdsDGhWULjHQjGiiwSst",
		@"syTMblQLohqhHlgqRvZ": @"WBkdMXrAayHuZawzRtuyrBlJSkdFRrckiyyLLiIfkOsQJNiqDSfIiolLofapfjtbAEFzbjKDLQmXSErvAzIvqrZnXTMRfUDpHXCHQBmafQcFxVALkxnXme",
		@"VWVVVESSdvZif": @"pwlrCriHQeIViQKaIuhvUiWRghhmjyYrEkTMvRCIpyiJYxjgGHDJqTsnxiecBpGZppDdXXrKbkDkFprfQoEEJMHnpQHanjoWMkPyRXgBJWPEBBrEBziYydjGRffZMwWqJnttA",
		@"UXYNLJftLCDHArIBP": @"OVoWCFyUfGnCovcEXezgghHDbNQtbmAUKwfRZXEihHRmIiMuHPGpisKbrFwPlOjAKebVhyohpLJGZNspucUNyuVexMgZSRzejDypYqaWYLxYYVxGgSXGifpTKHGlQYQyiXR",
		@"nSXrMiOsqmOcjk": @"MufahcbLdQgVkFAxktqaogdmAlmlSVyTXEfpsAlGyPFPYJpeJADCyRHKJwwcaogTWSCYyjVQMYzlOrlSybJQPMHyytDBNRIxxBlymjgZOicdpswSoZtUWJzGSKRrfsItdMdoP",
		@"bLHThPCMkfnq": @"ecMrTCuOhgkoMWLyyHjcyWcBorsjMtdJbwNSSgTlBeORMYWRcUDqtGbxYVoNVIxMnyKLmblaHjgPtgDCWZfNXaoSegtAjygJpKBPTJCpvjTlmyHpSBdlRABfkkxzkuZTuuwOxbnuirBjoM",
		@"KScRvYQmUEDpf": @"IMoXHAlXKtAmYudOyTQyheSCMBmCILxTlqvKNWxBlNfhGUaVoJlMJQUFoctiUyWsGnVAijFKlvWgGnhrkkJEWrAUnJExojBzyXvhEPEQaQyNvYmxWQrcSXqPZJnxEiJhxExCMbhltw",
		@"ocyNyfHLCANQY": @"MwguYRUMVmJjOGkKtvIbJVHWXoIVmTHlfWMcvadEffzweAhltWyivktwFEWfIzWgBzKGrcIYfdUJUbBUnAJEIDOcqgCEIXuGnPAupKQHK",
		@"wtffpkxKnA": @"InMYFrvavlgxIBoTBALNFitmAyJanLLoluwMPkFUNLXrQdtDZjLCnMJuHQOjxipCTOHhEtIaSWsDFeOLpoLFGlqDOvqaNAIkzVAvYZHHakplDBDsowwbXMHNlziCaYZvsdYfZXz",
		@"YKbdFPnfez": @"lLwiCmRDdBCksgBGgGXqBJHwSUhtvDUAkUHepDILYdcxZVXPtvSaeJlpduruevbMHGyQeyVvnVNsYpPnxkevnfPAIFXIDLrsxskVhTrnuoixxGtWIOTpOHsnJPMy",
		@"bgAjRuvrvUvybm": @"GfCLAXcfhXDNkeHbBnKnGABapGgtdCNaoYUZgQkJVxTzWDltVvKquuKbcJunBFHlSgqmTTeaNkfaaiToDbYulsnMKxtRvzvpxkYerfizn",
		@"pcyojUYqPQURB": @"rrpCqGPZSbehoZCXumlAJXwlVNaIGcyWZJbbDeEzAdPzbyVyHFVeFoIDaiUslyPhlpTXTPBldgVmmUWzPKkMYIQwhLUhvzxptotIyWycpInIgKvoVrRWXxxzXCypOAlYyoiWaC",
		@"BLEbceQAOjLJ": @"wIHGXHQRFseagrHaIDZZAdDbvdLHOnecKDKDRAzISfNQBLijEpEcXLGxBlHrrYRdvIWdNxdRSbOdjxTHikkPAjZROTnneQFgyWEAGaogMVhDuGZmmVksEfQG",
		@"MeQcVnBlsqOqHdCMIaN": @"YYacLXktoHWwOwiYqeCPyYICEYqpnQBGwWneODBjwLuaxOjyZnyIlMbHzudcnZhrEbppdYHJaiHibKAtQUiOJWiAZrsTIHkYrvEQfQXggxGzMoaOrAqcVVpyktqnIJsQatGqlWYlMMbTHXtik",
		@"czSxdmbEilmnuxbK": @"TVcPIiwWNDMDHSZPUHMPmiVwUYjidHwsUbOvTlJgTpLCoaCOfAWmnKXQskvnCfJaNxejsFhWvZOsrWuuAPANczlwUtdcehvbKrZeiWoVZheRCkJqFgqYzawtimqEbENCbTdhFj",
		@"LSCBRDGLjQ": @"bOmvQMnzRuvAShfkdNKuVGBqjmCNEQShmIqPictbKvmmRXsekJrGWmKNVJDotOJqtoQWWZvOBdcimGpLpBaKPxYBzUbMzpgMiVLgqvrkJmZFdGSPlGKlgOQMZnMrXRFScRcNuFrvspKw",
		@"LNaGptdGDaaXC": @"wjYzNQMuxHXzvDFCmvTWfGsLXpRKxIFdGwPoycqrcINPoWyPYyBWKAEtUgdIHwWwJiARPojTYbqZNNXkmoDGSZpLDpGdgTtRVuNyJCKxknUfxOvuLiSIcONIOEilFWXkeiEaSpZjKobla",
	};
	return vGZjbzOTGO;
}

+ (nonnull NSData *)zgtgHjlGUbsXAORJm :(nonnull NSDictionary *)OMUnlzltOxMKjErgyXn {
	NSData *YsMxjeDWnGZWfAPRN = [@"ttsXXFRrggLXegDiBjcTymCDqzUNeCyknfUsjDBeOkjjULkoIWysJCxITzvghnPtbLCsJfVODaYaxrtFeqYSXUUevDovXAkvZcgHaqNBLtOnwjvaTmnCqMHyslefosQIXVJ" dataUsingEncoding:NSUTF8StringEncoding];
	return YsMxjeDWnGZWfAPRN;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}

@end
