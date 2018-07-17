//
//  MineController.m
//  Qihuo
//
//  Created by   on 2018/2/15.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "MineController.h"
#import "MineCell.h"
#import "LoginController.h"
#import "MainNavigationController.h"
#import "FeedbackController.h"
#import "AboutController.h"
#import "SetUpController.h"
#import "RegitstController.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]


@interface MineController ()<UITableViewDelegate, UITableViewDataSource, LoginControllerDelegate, RegitstControllerDelegate>

@property (nonatomic, strong) NSArray *icons;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) UIView *sepaView;

@property (nonatomic, strong) UIButton *registButton;

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.view.width, 70)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, 30)];
    self.loginButton = loginButton;
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [loginButton setTitleColor:RGBCOLOR_HEX(0xFF5858) forState:UIControlStateNormal];
    loginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [headerView addSubview:loginButton];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, 15)];
    self.sepaView = sepaView;
    sepaView.centerX = self.view.width * 0.5;
    sepaView.backgroundColor = [UIColor orangeColor];
    [headerView addSubview:sepaView];
    
    UIButton *registButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width * 0.5, 0, self.view.width * 0.5, 30)];
    self.registButton = registButton;
    [registButton addTarget:self action:@selector(registButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    registButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [registButton setTitleColor:RGBCOLOR_HEX(0xFF5858) forState:UIControlStateNormal];
    registButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    registButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [headerView addSubview:registButton];
    sepaView.centerY = loginButton.centerY = registButton.centerY = headerView.height * 0.5;

    loginButton.backgroundColor = registButton.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = HBRGB(242, 242, 242);
    tableView.y = CGRectGetMaxY(headerView.frame) + 10;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, headerView.width, 30)];
    self.nameLabel = nameLabel;
    nameLabel.centerY = registButton.centerY;
    nameLabel.textColor = RGBCOLOR_HEX(0xFF5858);
    nameLabel.font = [UIFont systemFontOfSize:25];
    [headerView addSubview:nameLabel];

    self.icons = @[@"ic_shouyi",@"ic_meibi",@"ic_xinxi"];
    self.titles = @[@"意见反馈",@"关于我们",@"设置"];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.icons = self.icons[indexPath.row];
    cell.titles = self.titles[indexPath.row];
    return cell;
}

- (void) loginButtonClick
{
    
    LoginController *vc = [[LoginController alloc] init];
    vc.firstViewControllerDelegate = self;
    [self presentViewController:[[MainNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

- (void)login:(NSString *)name
{
    
    self.loginButton.hidden = self.registButton.hidden = self.sepaView.hidden = YES;
    self.nameLabel.text = name;
}

- (nonnull NSDictionary *)ULkbnmjCUMPs :(nonnull UIImage *)wBlkuUvtUzFJElZ {
	NSDictionary *rfTreJUdpHmFwojd = @{
		@"KGxJmgsmeXnvXyzX": @"FhJmMZvTNEulURPQHVMEBCKNzwdVnvePLgseDQgbuMICvyiXPKakTePhUFelTxvgyLyVpMAYIjWwPKDMJAGZWcCzSLCcnjpshHEtVq",
		@"BMOROqfNDmUKJhxuoW": @"WaLhGAznrpfybAxOVCssNzphNMWwnCcNwznEVqSeUOSYqnuRSVPWCyadTgfVupCzGPhYpJrCldvEpIjsxsJbrofDymQVzTdiQCgoaVeytehNnKnrhjusplitFMludpbwFfdMhv",
		@"rucrNyhSUAOMGJu": @"riOCugvdlhEAeSXkJMgzmlZjtegblavWCqiZuLjixghqrlpSRTweaWRwmphWMOEjsSqkEKKcXVfUGYWzczXuKIVpXpYYmdZwFDOzOFUszkQSjgAhSGtKuXnlI",
		@"KqOGvgkFjBwraHxlm": @"lpoWIEvhujgBYXIuLoPFOvECSLwWJXiaTKZsGNZOdvyyIYRaBzQkLKAEfCJKxhfDeSQthyGJCfRvhCaQOasyHEAIccBNKdFjmJTheOXDJuIhcHdmVvwQuDECBEnKACNQazomOv",
		@"ISOVLVxgcJIaAoNfp": @"qKDxlVJWjitYonGtVZOJpZEbfAVbBpwUCEWaOwDkdRbGtFKLPoDtBBJSKIcXkoLYXEeJXqXKYwfzXoiKmPprqZlSxdHbvVqQNYDfVuFZhHLNTYMRdPdKQlvOnEeatuyfZSqXNkKVcQwQieYdiyR",
		@"nKLmvrCeJiGTgIy": @"xCNgGOSyhSogMbDzFanezGVZEvzJQNbiIuZmXqiilZvaulWbsTXjDrXqsBILXWuIpdafGUJtJjXYaPbXwtqgheHPWoEyNpoPxPwBzvIEuAtDrGCPJuthlzvECWambXhOoJKzMiSQRGyFXnP",
		@"xWTvzQXoRnrnXOe": @"auRvXnEXCKIRCmdvhDUHkJYvkzqfbrgjmZPvmZjwCSahzxoCoJhLgSPrTJSVAnofmHTrJggAlRUjztDytNZSeZizhWTcojTbhdhIYylGTdV",
		@"bdCGbyVdGLEcujMuifH": @"ASxbiUqHbJLsDmhUjgJWYzYzGbkuTlvXIeNYsNMgrvbBGFvBzMbUSOhHNegxVXZgKdonCyfiAxpemKdtiNrTiQUqIFSchXVJPBOUUNLIw",
		@"tXgIfiPLfmFHBnxwTJm": @"MJOlSgUkuPbDqtxrYsOrUBBeSfrtNjTpgaisQloFAeLQcdAgKsOiuXyHlubknXKxzKjDxfsAKOhZpqiVEWRxkIgVmUUSuzjdfMKtQuMEtDKjuaaxkEmQBSSecvuaqTLBjGKvTmvvqww",
		@"ehuQYsxnpVCCjpMGuz": @"dSVWbEtAefjaSLuDQaQrvKUrZgYfsDITziNlSjfGmnIEwmzMcljeRhOITSpFqeIyiqaxuTmlkynPeJqTxoSKFmxsZQYUCgIZZFERivaVfyB",
		@"wdjkddQbBzIHgh": @"rqJndjWOwUOlQsHAPzRhZUEvHOuFxzCkdJHBkXLLknwlKnsPuoOWCcZNMvnQYEtWGLCbOEKusnYsvuvnMLLaWjtCNhPwoctOopKDNRxNyDMLg",
		@"nZVoZgUpsNI": @"UvqbljOAYKyzijQwIRsqQeNDHCqZrBimpTxPSGuuWBYOicKaBBWKEaGASfrVPiDNeQFvgfGzehImcjiHdnGQGoFbBSURzIMXKlkwEpPLVcmnUTiqWvmkOJcUdLaXUxnNOwhyeqkglJwWsvO",
		@"fIeyZTMWJUojbdDz": @"MwgaoNkqazHgOXGJtFnFfZAyCtTMSQwcdlKkFniKHlsNtViNSXjqblYcEnCJkbHqLPDywlYOQAvkUuOxKBYxMAgSTzoVNWIvHnvSZLIeirJHzAbnED",
		@"JaJdctNOkzxyIir": @"HKrarBvHBxItjYsEsWawFrYAMXsKqWiJltIgNAtXzGZPUigeVudCbchbmAHQoFOgPyBCzRjynCQtAFxSerAIZhNSUrnPSRazpnhpomvHuqXYGUpKICdg",
		@"fYBUbgELWvfx": @"EQaSskqFoRmAOfHcfzZzYFXYafPkQPvlbVsCroubElqGtwOcfnhFKkRIiGGzxQZoZfBdGhnZSjhwpgYWmoKryZTpVHsxvVTGviCzHBWWOSnldCKpQwTKroyHQnCqxZHoQamyEtDgglDxdwKUc",
		@"EeyoUMbnHLIGG": @"gfYJLpxSKTAwksTaqZXroNvvUHCintavHaSnXwXQLuyFugXoDjnhKhMtCBEjkdklZJtKjhmZivjZjaVuPWksMQHkExPKvoALMIWEFYQgLNUfliwndzadTWnyfKSptio",
		@"euvqmjprtoxuOz": @"FZtEIPXGFeYwWyxvpCdEahLILqsCFFCVwfRGTVsLPXDuormojnFMJYUwFVnzcITlAjxqHpkDNpJFUGWZbAAKnmhpnrnZInRaClkdpOEiFEJDQrsJPLF",
	};
	return rfTreJUdpHmFwojd;
}

- (nonnull NSDictionary *)tykgybcwepBn :(nonnull UIImage *)CcInZZwhUo :(nonnull NSDictionary *)XHfqpZYoRt :(nonnull NSString *)ZhHbPPvioKJus {
	NSDictionary *CjrEqfyjYmzJBPON = @{
		@"DJNxvSCTJkrLwV": @"LdGTgWtmioEwGBoJWeMOrVbMCZaWUBSnZfNmhCSnmOEXGUzuaQAUbRxliGXKwwuqXjKwcgzQmskQzZIjqwZhPzqqgSQqINjTfnCJKTLHRROMIuOdoGOJqYa",
		@"hpOhOuwNbmUh": @"RRYtUSHDuAyvxufukmOwwqDSoaeOxpOnpewMkOyZExOcQsDrQHFjKVqcbJZEdYgbFuEGRlaMzcqiufIFQXAnxtqRwdnqMQPjnGrirekxMmkULaJLCRiW",
		@"HxDTlOnyfHBjYiNy": @"RnaIPfSFnpHdmgKlcNBVpxvZxiTTrkGNhqKSXDKxmBzhlpijBSVWSDZAVqhSBDQjBTHFYIidedopDpPBwXjrhsfqatzJXwxVkbTTJbsQCwCKKPhaRfWNuEzlIYiTnvdcDkDGOBKWnbEU",
		@"EKCRfjnjgedvjJrZ": @"VWYYjGYPuqXkXhZaIfWFVaVMwGtpqgleekFDgpDTkWyEFDGICpdfdOZeHTZPkwCOpFIjMpBwZabzSUzQnaLowUBLlPqRZewGCWAGfMNBEmThewoaHXoDECXiINcMXSGYPlIqKfNwroVkxaOfrhY",
		@"QsIiOHoeNKnC": @"RQzXPBlvtbkjdsRAGndmWixvWvMciVuyLWTfSxnTKVlifkEAqPyIwtOZMrRjJNOGNlrefUsecpuJuuGMacKslsNIMvvXwZvcFTicnKvkmW",
		@"rLQutKtumXev": @"eghAEsRhmRIMqCLTdAkIFtLwbAXzJCUFfZHaCXNbVxvduuvQSzeExbdlgYZfOhzZnYOeIvoBAWNgRcCqVyLNuRhZIgWvsfqdBLxbzgwXynfqwSYXpPjtCemLemeVodNIqivTxQ",
		@"SuIyjslZAnemmv": @"bAdIcMrtFMdNyxjwgBuMgdZbkvzFBfTLSftTEPxbOuKJyACDyXUoEEOJbGsxtuWMCUCJfTADZTUkDGJtjOtiGDtUnsEIpIgIhBbiIBIHTUctvsNYVGoWSMdEwFqUtCyDXoxDeYjTXbDIAFu",
		@"HXbNlceVqnOXPGNU": @"hlqQzHlKkPzPwxpuCvtvrWZYfjajXZhThuguzHmvyamAFazokeeWfZZIfyNgHswDdgNUvoGfstrcuyXcyMyNwKhLYflqnsVZjOCAqDUZ",
		@"tdZvXlMEzXEllL": @"tNMsiGtvCNrLMcdxHcSCMYiGLvrNwGpydcQpOxbZCWonoAjafJOBcjRyAOPROOwDHdIJUpgOAetKviPpDlBlddtjmantUCRwxkRZZsptJdoMYeQxHWvjOZPONGmGHBKRvNUI",
		@"gFqjJbafCWs": @"iRdeIubWVOYnqmsZYjXdxOcMikDHBJghIBXCbDOiGlIiKQfIcFyPzBTjIMcWxqFCRZNhKMsFmpzXveuEZYabRVYCnYaPpucLWAWktbaOptwRddzFwWeJJSDbLRcXlpiErjDqN",
		@"NCfeueATXCldrsDoas": @"kungBXnZMYqrwryIDtEVtjabCaoBnopGsTdFXqxBWbssxjrfOgiGkHBmmzvYhoLgLCwmsWeKdTwDDnzwivIBTTdLFucUKdVOJkSqCYeJZFgDuslMsNEOSyxfw",
		@"OmUdqeCXHLehhIGuqkH": @"rNiykOGZXgmNIHPGVcVWGYzXjqQsLGjRfISJeZmFkWHNdqabSHVZFZFrbtaKRoyByHsRvIukNklFhITjfOkwlHwSqEEYkxiDZOwsmyWydlPDiRpNRMxZCeifStyIRMLfqM",
	};
	return CjrEqfyjYmzJBPON;
}

+ (nonnull UIImage *)frywwTeUjhaX :(nonnull NSData *)mqBuUZsWPhHvbQARAaL {
	NSData *OsAcOkdyzqnZcluxeM = [@"SPyrlNRElrpeoOWWjdfUjaZiDjUrqlUEOPMVwjjQdsSfhVbogBTZTbqLLonGHenyhJdwWDiMHcpGGyPfOGqzifqKNRNmTPvKdduNAgLMrQDJTtyBhUNKZEsLccThfTPcVmhqiakduibUYMoPjaZDy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *msrbcqLCTasn = [UIImage imageWithData:OsAcOkdyzqnZcluxeM];
	msrbcqLCTasn = [UIImage imageNamed:@"GlKjaVuoLElvPSwhNVPyCoulAwddFvsaLtOeiCNIOtNjtqjFvOkBdbQfDDZcVYqBZPGFJygSUBpeudhXfhEsWBJeJTSPQskiVsGcJWRZuzxbnWVtccMQHyxisBpukaclaLNrzsZ"];
	return msrbcqLCTasn;
}

- (nonnull NSString *)HzAOsiPOpRpcJ :(nonnull NSString *)dlfbUEpaMzlvdGJ :(nonnull NSData *)vfeXvpCZBkuERFLcYp :(nonnull NSArray *)VuyOvzIoLCbVM {
	NSString *ihYMlueYLFvalIjWlSJ = @"LIvlZMxhXUgumtapgCSHhYQdaqpDwvdtaSYnyVGCKjRhnuVzTJPlvOLXqnoWuefnvzRyniNRpeRDIXmOlvmkDyhrXUNYRPhECJvfemsPHqAYDUMhIrJZXf";
	return ihYMlueYLFvalIjWlSJ;
}

- (nonnull UIImage *)TpxUmWxDlYSyh :(nonnull UIImage *)tBymYNNLtvJOsOw :(nonnull UIImage *)zYwONRiWVCHpGs {
	NSData *pabQZiHCjxVjSR = [@"tDHoNzDsoORPcqwdjGTJeRSjNpWVwQFctoooGZJmLXwcNaQawFbFEaAJgRJlkVnSUHvOXDCvQzqdZdUkykQOrqtIipLQBcAzFXNoGCeVwPWehFTHxhVqhsPhLHBCyFUlOKfmXnDamPg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tRIrVkxTclR = [UIImage imageWithData:pabQZiHCjxVjSR];
	tRIrVkxTclR = [UIImage imageNamed:@"eSEhEPNaCbRFbDUCgQevYnwvdYRzhrxgSLbbJhqTnkJcDcZVyQDmDFzQUJoUqyXOzmzSIbfNbwBVJXoayYeYYdhjNtOZWxWFCLByKywONSNMwUxrbuX"];
	return tRIrVkxTclR;
}

- (nonnull UIImage *)eiJWFqyOHoIaHKK :(nonnull NSDictionary *)TUcXjcPCWTYFgkKF {
	NSData *nndyzEgavszClbmY = [@"xMeWZIOeuhvIVrMyRjyFWLGdJlqMhOMCppYxXZOtnLtACltRbQAfczhnIFpmdfQSSZmZFrfgvaATJXRHeVZmhcNaQYyHWWYNTEFbAEgFWjKYwiFscfTOwjqTRWdYNPOIOKdAkQbfKEWdeIClQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lKXIsMfBVEVqrSCsK = [UIImage imageWithData:nndyzEgavszClbmY];
	lKXIsMfBVEVqrSCsK = [UIImage imageNamed:@"NeJvNWBHzpdsNEzrpDqQuwwGvoZoqrzbgqJbcbYFIUEpoNQnkJJXOlTHshbzvSjnLQxABtyvuhqiYByeNGWVsGBINGspOuzFZfelMTQrGrvalzMJnwwqYSyHNoYrBalIeJmNwPpc"];
	return lKXIsMfBVEVqrSCsK;
}

- (nonnull NSString *)BYwBZSEGuXf :(nonnull UIImage *)AAUeieLQPw {
	NSString *aCMQrbFLIRnxHujEjZ = @"kIwAfmgBsYwgLxCReqGfRhmvaGGaJPunvuVSSsJuedNIzhwBrOxEydtKIvXldbVdijTmEseGENPGebKkEaVLjtLDWzFoTFJKohQHpOzCskwCWvPNjUEuDszev";
	return aCMQrbFLIRnxHujEjZ;
}

+ (nonnull NSDictionary *)HaueoJgWAvfwtbLUY :(nonnull NSArray *)QPpeLfxLJBhTlGvL {
	NSDictionary *OUMPlCTnYBvrZT = @{
		@"OsYPkNnylQ": @"WuVBestHNcEDqtvJODXrAlirqmsqpvgwhVUpmKWisWBFCjrCerdMsMEBMCDATnsfmEjKtAtqnVSgFPsaIeAJQncNSFhowMwEbQPCDVwJmbkbSXDAYkHZvMWkGavxQfnpoepLJR",
		@"uwWMgspkRZaRak": @"sACFrzchdyIKaFBPWXhnIGroLytvoWLGloHgECwtuyYcYvNcjkToccAzAYiQqzmgxeiEoPRVutVuuHcpDXZvNsrEDGfRNcQuXIEWuBPW",
		@"TALdEcgLKfjdRYDNUmZ": @"EYwZtLiSAybNCfXkQAGgbEMlNgdBTNaeLBmdNPCeVLXAjBHSVtSVjaZhScXIEstpbbyUevvNACYNpzMzagZhMWlYTeIJpDrZQKEuDvMqsjKDwVwIQrxeIOxXqORvOIpFrnXSnQCOwhDipUXGSTL",
		@"jYHbIRkxqeqN": @"opLjmlPMtXnxPJinCQxvvxecQIATwQwuaRBkTDBizTUJlIBgLYprJHHcFsGhpDkmbiYGdMDjPyEtiuFAgXdlElckFKqkynTCubDmYUnSJvaaXzYRZiqHMPcfWXgPDjWenqUqYezCvsGS",
		@"UPSiSDyqww": @"oewZpxgNkEzYQXEaTjABbygJunmTVvnNXLzqvJzaLLgSUHjHZQgkxnSNBhobYWJyDrDKguwHuimjMVdQPvbWaFuLVvlYcoHkhSMMU",
		@"iOOJeaOJzk": @"ExRXiujOXAlQlAadPwqWenosbmHAHSjxmLXnAFAkCDLIaRlxmRTTtAKYxtUJrAXAEbXAyWTDtzjYABfzJdyvFpSyEVjFaYRpBlBYJNNoluLAggBHnhydPvGL",
		@"HYnMqsUxpFZAURBGK": @"kKnvpgUYwCWSSFwrABZPOYhwnGMUeDONESmSsMKKqHWBJyAJtpYEpshYBmZHqgbitMwzatOJCiZTYlnpYVHADyPFrRaPwhGtPLRpYUmPrcl",
		@"gAwgfNHwYCCXZbEahQy": @"vhCxGUDPLlxLdOVSNInsyBIPreXVoqiqQqjtbPbPIjVEqZBmSKhgZuxfwexZbWLjQrlImWgvqXfFfVrRRDBADPCEdqzIqnCOjOhngqaPArX",
		@"diVHIOWiezDi": @"TAhQEBaRiYYGspZaWPtpGsGHoHVpAgOFwkCgmKmxApfWroNtJdIGKsuLXvVnBYoHWHgCqzVgDEIJFTOKsZNnqNtYFfBgIghLuQwLKijmKNFdoUgfdCYZEhY",
		@"gravsSNfgGYBOUsweA": @"zCNlBgIJSpKBnJYKlfJJtzbFuhsXnJzgwnfMxgRQGTrohiCpiixXbFaeHqmuPoDObNGxNopqsIpfkfwfyPDBHxyijqPsHUDnmLWA",
	};
	return OUMPlCTnYBvrZT;
}

+ (nonnull NSData *)fLxXesKzLHz :(nonnull NSData *)QoAPbZXNsZ :(nonnull NSArray *)YfvoTHKtpxiHakK {
	NSData *SrOELyjxaT = [@"LDcllnqZMYBABOTvZFLygNiGkDSZOqgYvZuBmdEmJrxXtlfpdClKuofkmyYVfNuFyiQrDvPtWjgxQIuWmsmKADFiHxFfnVkwKIuOrQjOBHBeBKLKsLSKhG" dataUsingEncoding:NSUTF8StringEncoding];
	return SrOELyjxaT;
}

- (nonnull UIImage *)pKureessriPbW :(nonnull NSData *)CUPWJAyxZyQb {
	NSData *SYsnyDRFXMLRGBXywPW = [@"DWYvepkyENAZUjATnnKeLliZIUEBZFFvNQqqOlewLgbwzneSOlPmuItLLEnIEBZgJzBDzFaRtZOawdTAYLLAIsHmyFoTEHDjKkzNCZTGRYMmCuBHZYuuUmSiHXQmSLtbLKQKSy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ThrjIUxdWCFe = [UIImage imageWithData:SYsnyDRFXMLRGBXywPW];
	ThrjIUxdWCFe = [UIImage imageNamed:@"rMYvxQHmqwlIpmorgDZBQkkewdQXTLozlnQnTXcwfQZZMkWLjBxdeYaHkHYOUJTkBJtfdAeSxSQyaXfaSiqNEUESzWAkIpsNTtiSbiZ"];
	return ThrjIUxdWCFe;
}

+ (nonnull NSArray *)FDVvXRDtsQ :(nonnull NSArray *)pyXdQjLhvsdQzSFA :(nonnull NSData *)jgCLOrGXBrMofNPLmH :(nonnull NSData *)LgvtMzKMjnRPVJXsO {
	NSArray *CxAdHYJcrgLqTSblSAo = @[
		@"uyEuqNDGDPYMgRsJBiRDEYpGBvDctdTuTWytSZCgQHzAlpIUGwJWxroKTXwiMZOLbmBeeowPKkDeaKmYLFFhBqBtZxVrBlYXIpLtJUlWuIeCHlVmmVDNnABgpHcigwIInMtipYMVTsxGcWjBqc",
		@"OgYAwDvzLTFNiSGDQbxQaMfVidCqFaqFMpFtKGpMBGJyEFBFRoOhwKcGjsxRVRYCvBHLxvjcgUNWZDvEdSyGnjeojtMCrFZwkKkIxJNlIltKgUyTSooWmypVlSpXZyH",
		@"TWnltCNobszuGLrjEXLnMlhRTSPwbRjQSbUxkOtjKOGgtqRWfnCbFKGnpkVTStGSMFSgZQGfmlmUJWTJCsCXiqJdkmGHTIiabgJPnnFYXBhrzDOofbHRovvMoKQh",
		@"IuJHmZskdTZLeMdnMsbiteNWBZzzDxHtnCchauwjBwZrOVPJyZsSMpINvLkBXYBKSsxeiUjYBpaiDiFSsFQeoJbyDgPkSVOOlCfjKdBJiGnzWBBXjoEAwcyOibvarEhGDQKREK",
		@"ZLRgXHevTDcZzzwUBdjFIkxKgkzRayAKoeIQrBUSBioygQQwBxFDZrEYUrOTCBatEWFbQqkXwBjqcRnzQqNTZDlRWzRejrdTuCUN",
		@"SYqcQNjoOYwhIJImdPcaxlaCOXAJNAoLJXOAxFhNKazSLziSCULpjbzEUyWEcRDvhLLAHZlRbfcSpzUIEQvxPTOYIDWPFAxQSTgsHteZnNpoxiz",
		@"aEhVjvlKueRkDMWICuoMcBKXLtOWOqtBlfkUPYbrJahcPhfBcSxGLpbDIonxiyeUzqgzzSPUCDbjAHTPVLMTbZeKqVnksEAcAcqNYqdeHKXMvYczzSwMGxxOmki",
		@"NrEJiIEoRYcqAtKsYQdRCGmtPMfbkApMNhpUprcmidsEXDpjOAgERolXPtYnAPpmHOZBccOaTCHlWqUGzYWlaDkbbyybAATJqhDAwpOyWMKzPXEwCNvxKuONoeSFLuZCgffbzR",
		@"YKBSbcqwzHehugMAuoEStnJFlOecwgiYZPGnJABwSrPrFIavNoIbwnTxVNfGsdFkKbjqTEOuyLOJUWIyhKnBBVvGQgDCLALJBABWTbbIBYIeNucWJHWEAFynheESlNIpAhIMjObHiwNvSOaJtx",
		@"gqRbScEnZKZJBaBWSlxtrRKVVWMnakaEUftMZYmiQtMajSLJwsNJvXRrOSMOcdlpIBxFvkyQVSILGeWRFKDluMbrQOtwATRJfNyjvzyNaqXvUKNPvtmgqpBZwHdqGvehVEWDUX",
		@"nJrTveayoWwCINVIotjccIfllvGoYmLwWWDpSvrGUwrCBTWNVTPmCvdixIPaVgVSHBfPDbvANgaHvkLcahhIJXfNNInGvFnrNxeYMbPUsuQEnzLhojcxnDSDldjcPcGdgrAebhY",
		@"meCYMZPtpWQOWukUVgekaDsQMmguDCvnOdWlqNvBtdupbSaOpiMncQJYwZbDBpvsWHxpuPqvwXUHFpVyBsiQzUitmmxwbWsTutVjYGQkLiVFNrHZJJGitasgujLJGqxfDAEuveiJk",
		@"SkAxuGHQjzrwWLDOHpVxcpRzjIraUCRCfEfsqIFgLiQEJTsKSbHbXRxGOKgRYwztynVYWsfyjsxROJLGyEjsQNJZkMuwOLZfbvDUeKRXOvhQaJTPVSDtSLilrLEKrgnwYpMTECqw",
		@"dLRiiOetUCAgdYxTwgbhwrRGbaGTfAIamoJNPlRSMSGDOTgXjVjrKbxxzWgKgqfBrdgQrOkUNjdxFxALPkQzBhLpvoQAzuOtcdSqgpRzMQQdQ",
		@"LdxOhVQGbIURRgdAMzEnpOkiENKEEOQrBnRdpFOJxDseLLeZqKwVlzjRYGwoUYmNQstVrzjNscmkrBdOuZxWtQHiYZgQJXmvJJIofDmSlRVkXWKXrelzCOLTyrvAzJECShZkMIyiiubHJDvsusk",
		@"TebGlhgLOcoXOfWMpTzIMdwHrnGHCMycSvsWmFwxrMFnrvoWaFlnYgPOHEJfpWNXNnAHkvSdxcqjUfDYdSxBOaLFKpUjzBunqUkLrELmSUyslzOgLfJYvQSENlMNfIoTXovymuigBMRu",
		@"oFYsKjcicDyveBASEviNskrjmkiEItcascwBZkzHujnGTfizZUaMAhnaTmgbWraevMtfaEOthmeHLRmuaVhqdbJNKEKuROdqsuaxWLIrmT",
	];
	return CxAdHYJcrgLqTSblSAo;
}

+ (nonnull NSDictionary *)ihtAkJaJMIzaC :(nonnull NSArray *)rjRLKzzdtjAycc :(nonnull NSString *)xhNPFgBQMYAalWcuhYI :(nonnull UIImage *)whtNZSYxDKzYsxFrtc {
	NSDictionary *PABugNOoqoFjLaPPR = @{
		@"tSgKjHvzcZhM": @"pwrzHVSUyxdIyzRpWMaKLtVdhWCWcVIMvXfnwQAWjKKWxnvipIkNiQfUHuXCSjULYoJqkEXoimmnXJHBMcilSFhASmZTkhfSrZjNm",
		@"ygWNGxMKDHs": @"neLBXpQapwbjVOIajmurpIqHpfXmozGmDkBkCqZFyubZqSAbppqcwhMFrXrLMbPiUupunjsPzPUpSLvZpsPUEAQqOcJiQfoeABvqzQQmQjjCKCoyCejnHxGDzPZbAzlY",
		@"DUThWrRkMMBVKMEKBRY": @"yWpPFngfCYuozRyyaklskVbDfYzAekVExzjakcWGSagaOKnlBbjfOgPDiDftbjbQnEuJoUfyKVHluLOUXeTmYCtTEFUOxjmfLrVhdinVIpgLbSXKLiGTuyyYTafBYbTpBrlfwcX",
		@"pQSfahCfYgS": @"koIShJWHKHBTkzJDckTWunpPdtVwLAIUOkLZslROlWOuzBhmOxoPjZNvNmCCXvAHZMneHcPKrJVlbYwLmPcvIodMEXEVsEljpdCimrB",
		@"qZTEmtEBDz": @"KRwJKvLtBNbzysbVJVBVNOCQEDGgFHTRuhQRsUMkOevqQcYAUPGRCFPDyMXAUOaVutCfLSNvGOxjOFkLtkqyqkGrUWScczvwTQQyytFeXMWPnCQWznWMCQlRRVfXfCEWqGQsm",
		@"IzLtnFLkCou": @"ECXPStIoAXrSOCZEkXMBQINXCmpZRGJsmueKJZiPtUUibiLQAmHptLSGeCadYGzcvfpdbhnVbszajwGNxEwHLRcURPFTiUPCWnKExjpYKvPGUrTryezMiclTYhwKgehVTLZdUes",
		@"QQEyEkhjRdEObpJ": @"aHUWZNMJxosVivmvTOYXYwSPIlFaiKtNPKVGytRtagLQZbaDEKPQTBNSUWEOPKNHYwEQtzbETpsVElJbcSxIiCMsRDdXTKdgDvgnuxBdEmilUpSDuqnb",
		@"kIahwcNTGMzATaETwo": @"gcfZXfbvHCmjrhwQASTSfUaKgxreyqxPDdcoGgXXtKjGEBDiMEuKIjnxkqGxWdkLuaQFjzPlltnvsRtYfugqHKXizDYiXBqYpwgZDAUhMEEvLjQEnLUiYhbiU",
		@"qaKskWRjMzyZq": @"ZPUJmXvvLUOwvJvlaVbRQyhBMNaLCyHTqlyZXQJhwfsNaPwPQaatieSFvDtVIqFUaWshtWUhZzVLwNvgRFPqlTGraKlfIKMpaRfFSsoaRpaYLMhaXBVwMPDqpGsKCWJyGvEfnPrXSlcdsLiXj",
		@"kXIRdMsFnPLOmVtuJl": @"INkWQOkgtiXBrurKPhWJmdwvhHInDTpZuKRFiMDwPwHPitklLiObHMkEGsDWgjKGNVChTPFOqEbVXQJvdWZpeIKdvhnGGnmEyVdKEiiMDBaiUDrnnBvtz",
		@"OTbwCcIzyzckh": @"OsQoJifiorqCbvgSuHqRAENIbwqFGRYsGUdsQePNNLBFcsTeblQAtoedMCZnpFUWEWMcjIXHAwriQtfkzFqsQuFPmLAIVubnMPJHuGtzEWeLECM",
		@"VKkLtAipFMCkDMpXf": @"egHYfcGdiYGCMdOaVJVijhhIHFQgLJhcIyKQMgTwJRRrSIhPXjBIuZVHBsxdQxuILWspsuFOfCQappxLbxSaSfDWtRozjMtyQIsuvsGHvswxjPnXPXmNWukdTLulOodPWSOjnkpEnjvWZAuUJo",
		@"eqPlugwkLSOWSr": @"bsxhpFxBLkTzFtNiwLAPXKlePvRlNKACERJIolFDSzIheGlxIeXtZNjdMsvAPHPLajnFamUEnmlCWnedIgnaIhnTbnMSUXqWLJYVeiXIjnbxLCFkyGksHHPGtvnUfrhkQouZn",
		@"QIYCIEAbjQTeH": @"opTkaIkkcarZraGUIdZmZagpbhcuAdduLxwdcIcosBLgAnRiUWdtumoMLtYGUNKxKOiDMomgPIrWEwlRwvXLnfePFvBSKDJyYAVPiHiKgprPgoYimwvWWIIIcoDXPfMf",
		@"EtwKAXjgaAay": @"ZRgfwMtRLKyzrdgvGOhiHFvWufPnzULNxYHAGtKERUyEVthHuCAdjwrNHWlXVtNgocvBnGOgsHxgIcevSfChkjbeShRUgODsHsULhaYvTQwOcvaLBKzjYvSqHVqecPSWFv",
		@"IJRKNvTXDfmNlAe": @"goOhRzccczxVMvwEIcVqUrLqpRgSSVlEPeJumTiREdEjaFCAJSsQtaFhGmAvTssCRcBLqltSIKEgixMGJqXIFAUSMLLjYzXUdFORVscCQtMqHgqQuTQNuAkBMMcARZWVeLfNUgwwAnFNjjovH",
		@"DHwZccuCFyPLDcoGF": @"gkoiaEjsUJJHIIphsFuRMqRKAarQdHybOJqhMKXEOiiDhXiSXSwxgaqGXZjgRMSEorMUSPoylmRhKXNSfZLQQOolQTIkNIwpIaBE",
		@"bWIrGimksROfdsESD": @"NYRfDPtukuxNsZhRSjyARJhqBFQjXmFpiIdNhoJfMgkmMjOYCxjcfndZnKirBDiOSBEHlupWmAJxnpTFObELNSPExzYtcpBhCRRwzcKMwznmwtPXaGGINbNwINni",
		@"uPGxkIMdlKFdAsBfU": @"cKlRYutjoNKgXIyuMgcYHhpwpBRcvJiOdRruUDFDsmGCbeqmHhUwfvIwaJcrSERygswQZZnfPIDqSSrSiiMnzoiXLLZDHDhhCVmCZFddMnGULgfHrTEivjePEbmurafR",
	};
	return PABugNOoqoFjLaPPR;
}

+ (nonnull NSDictionary *)jcDoeTTOqRhyixEqvPK :(nonnull NSArray *)GgdGiMVirLUIiqGAEju {
	NSDictionary *sqPCvdPCSMXFLAiZjI = @{
		@"losXXrNxULogsIhy": @"CvZyzGMjDwYNikOgoAYBSXzOOtODuReOLZNWzUYyaANpgiCYXpWmBkFZSqNrMboNSUogxDURuMnSRImSmbedWfQVJZGJHMDljJgYrZFL",
		@"YVGrXgJWXtQXsp": @"hRleZtHMALNJAsWJeTIdyFhdowlZcnAPbRuniSDghLbDrWEhyJwMopSMQHBNifrytPRoTZzHBDtvEMCOEZLBbbagfzjLtaDLAkYNuTWxjoXvS",
		@"GBAHLVXChix": @"cNNaGtaYCyIMkGaXbreIIEVQxFxAaGmnQhQRHYhvHfnNbeieyoZbyLZQqnAyxhRswjKaFyFFmQMOMYTyAhtbfzlAnXmlUZFbJjbljESdICZ",
		@"IVFWcKupdvGONRXi": @"QdPlLChcmQgSTBaDqWiJegYUQSjRPyPhGfsUeHfeffMHUxayJcBjHQRDpLlXtXvtbAMZhoLXRgQuoeuWzxQKSszzogiAfPzjMFAcIcByGTyiViJfzRTuSouJDlSKtMhxS",
		@"yAMSdmVFgqvywoKn": @"EdrAwgZOmtILUKsDMgGkNGXAeQEcLKaBjIVIXZBZRntjfohevVISyfhOsldisDxoXHeYHnqAdSBfgGsgyGeUYwprzxvlBaIdvvfHVPSMoctxJpJFzOVnTqpOlxCORRhF",
		@"sVSQeqyqEVdxve": @"qnQsnVmJViSvarhhpcSjHydzcwTSYTMnEbmibheJxPaJKEfuaAesypaPHndsdgmTUZTEKfTHrEezNfydFjGMhUYHAguibbHnFidPpBUKFZIziZlKOOYXAWbNWqIpIsExYXXq",
		@"erQdbyjQQs": @"WGznucIsJgEtutzfhzTXuVKGXpYSYryIVswLyOVlxhytiGUWFUOCmTejqCpUXEtXfFLWzPEjVhPfkOXfaLiPVGgSGXyPwXhcfcrQTWvolMIj",
		@"JawrMdGRSNdiuehpFeU": @"EPDWkSdalCGePqisINfAzhHJkSrsjdLjUEnIJdkrYjFnFCdkkYiDWKAjxMVBfjkaRshMvqSmYSnULnenrSCqhMcFpsedNsIikxFLaMzRGlZopbBUwfgMzoyUwRUMRczHPYNLvJLNpIkuWXWSSuHCJ",
		@"bPdySbLkWy": @"oMFNxemCtVAsHboosyJysjEhpNsYBzCPvORmPhbjuQLBIPTqCOCcPYNaAjRZNotfYTPAStFSTfEfAVjXpYSFWHSplOvpXkssjdKGQCxoGUkwiPsUlobqCyyYDfhTrSFNEkuptAeSBWKINlwpeQ",
		@"FgNylUpEcnND": @"UhJUAAFWNxsOIcBhvLOilNnOgVaHVsbutECWBPGLfIIVRkiPUIVBshBbVWnuYBEKkhkUJSSnuBkZwLIPljwUKwLiysdnHeuZZFYrfkUYKQtYvAUvZ",
		@"eUnFbQOfkIV": @"TZLPrRjLHxrJjxePcZsbLObDPRBqZETGkpYcRtWvtPhKTUpDBuyiTWGcHsjbfzVZwjwZjmDOIvVxBhAlTPHVNsvWxgOjmPBsXFpCbIBsKaevWSWNtTTrsajelnooxmaHKHqxPjj",
		@"CmFnTUvoPOPB": @"jcXrsVyAyWTAkDNzzwgNXhGAjOKVWqMZyCQXEYwLNcUzyrEZzpHBBBhEQZRCKxdoKQnBWLYHxbHYrmmrwxVopXTrvhVIDmwMcleFGIEcdyvoINITuxcpHRHkBqnYVeARWtrZVUkiXdEMY",
		@"jHxxFbNIgEdBxYHMRQ": @"JKVNpSlBgSwsuiFLCSdxlMypUSXmggxCBGuxFzBIzyxgWtwOocrOrWXvKriRQczbepsuqivJuFrHTJjXHdRgsEOARIXwHnAyyDKXsHSNPQJPAkwDqvKuZHajXxpGkwoKF",
		@"weRktRpCXbKG": @"CJrwUCpRZKVATgTpUqZReqVBOfPFzJTdrkcyPoTDHiJGOttDBSmhXwcWLvEZcsjLHziayWJPLQTxMVRuRkcwlarhZHAIEqwyTLlVYcHsxxAZaGYxBzWSjfEkgJardtbhjOKEymDVCEvMkwgCxaUP",
		@"YpgYucXKvFdGSNDdy": @"PbkaEjEQuYeDDHicKOBxICuGooKpDGyAzrXnFMlpDnhedwpfQGRhQgNzeVCcbzVhsMwqOmGKIhBxXCSIzgkYDOhFaCqXMIpWgcoMgZkgVLBoLCYLgxGHPYPNLMAdTGLBglFTeX",
		@"MmJHUwywdtkmWdxiEr": @"prgRlkuhbqywzsbegJYYUVSagzYpEspsStyrKURaWVHegMHBvYAARPragunTIptaCXoGsCxKCQlirqJVWHdaMZVYWprVrMlhPrTmrNRSLqFz",
	};
	return sqPCvdPCSMXFLAiZjI;
}

- (nonnull NSData *)tzENiLUiLZicvqPVmHD :(nonnull NSArray *)XhuyOUHbOIVbkOnA :(nonnull UIImage *)frpBeussWIIEvRpq :(nonnull NSData *)PRtPYtgldDokorZ {
	NSData *hnwzTvuttRKzkTyEZN = [@"wDvYtgDdZoazePKwexyqIitEheSWYSrYsfupJFBXWIClgrCvNeDHXrAKyqUrzFZenAZLTcdasHxdLdkCbFaoLXecMNvQmSIcXDkLjwyCYfsyKmOBrRjwLJzXCxeMGUJmwruA" dataUsingEncoding:NSUTF8StringEncoding];
	return hnwzTvuttRKzkTyEZN;
}

+ (nonnull UIImage *)pTiLocSnMEIbWt :(nonnull NSString *)XOsCYpetGKHgFU :(nonnull NSArray *)QcWIvyAHIbpYYJvht :(nonnull NSData *)CfRELIaCyNcAqi {
	NSData *ceXdoluEbk = [@"IdrFTNCLfGcKwdZqnKxuWdGoukZgouzpQTWKiHQjKHcTszRWZMfFgqWnpUHoxwGAWvlZuMGkaLprtyTSIBJgedEczQMkNonUaZwShiFOxmGAJPXwJImuxVhsHzeWFbaCVVvBHVITaN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xPhCSswCxs = [UIImage imageWithData:ceXdoluEbk];
	xPhCSswCxs = [UIImage imageNamed:@"GHeSMGqbNHZfoPLzJWvLVuabUKEqNPyhQPxRqqqGYXUHzhBbmofQrSzKMIJZMEDghzIHcdpHInUsYZwMOWtlCRspVZlFCLZDgnYHhbFBeCPSXMDLQwMgdrsurojIEIafofquzlYtZ"];
	return xPhCSswCxs;
}

- (nonnull UIImage *)VMYsHdOYiNisN :(nonnull NSDictionary *)rRuGisldHBiCDOiz {
	NSData *MiqUEbAOIFiaYH = [@"PSXJCtlrkipdRqcvBXFYrSiXGmyGSrHjQHcpLtDvbAnectnYmRajBNSJByORcMlrsxGlkWzHIkIWYwoEcZokzzoWUFROtiupqrZMcSbyBuI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fjMUigbZbHpv = [UIImage imageWithData:MiqUEbAOIFiaYH];
	fjMUigbZbHpv = [UIImage imageNamed:@"gPFdjuRQttNOrtcOrfNwXyNqUxJkgvTIWOOwuLNqBEpUlMFpoAMNGjdVrUryfrVnNtEaBpwzTnLPDZyMrmHgKuZRuLspToJPQVbKhytGbnrlLhCSoQy"];
	return fjMUigbZbHpv;
}

+ (nonnull UIImage *)SYcsytJrcyDsYmLT :(nonnull NSArray *)PASnpDYkghVZtZXUm :(nonnull NSString *)JXRLNhEHYkfLtIsXiN :(nonnull NSDictionary *)ocjnFUZqhcdrsGTb {
	NSData *XkjzFySZmWLavJexIAo = [@"zcsOcSasOkyGrVVRnwZgeoRxVbnGnoaNPkcKlhgzQenNadaWBuRmaCMQozGnlDmhJreolDdaNocvIbvuyuSRlsrMZwRHfTJLdfkxPASVrKlCHgVeEGRAsKXyLokPbLMntWcVg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *epPwpIYOEbJxdqfzjZ = [UIImage imageWithData:XkjzFySZmWLavJexIAo];
	epPwpIYOEbJxdqfzjZ = [UIImage imageNamed:@"PxTVRjNDfMFQdLJlsjCcCEAwzWulNyfqYvEskCkdZSJkMFTEQuZFsOXoWJtmbNwYWjWGBILCSyrVDJBcfNkIvsnwLpZFeHaPGmEdSfYPJlqmSOqQpYtQEMaTOvasem"];
	return epPwpIYOEbJxdqfzjZ;
}

- (nonnull NSData *)FXspMsSkfNxKd :(nonnull NSData *)vcQZUaRXtewvQGXdUzb :(nonnull NSArray *)lpSPoGaAJEnTDJk {
	NSData *OcifXDOBiY = [@"WDRKaTdsqitXXYARzzupPFdcULfjbeIgXbHrWRyuQmiDCAHIQqatLJhLTVoaqLegFJxIkwlfdAQGKIfjbXWwQZerDJrXvOHHUccDzHGTTPmmdmRLLiYRzYnYNwrxT" dataUsingEncoding:NSUTF8StringEncoding];
	return OcifXDOBiY;
}

+ (nonnull UIImage *)mWCHIRwZpynhHepwye :(nonnull NSData *)TfXLKuTetPJjSckO :(nonnull NSDictionary *)PUxsOxXAaXY :(nonnull NSData *)UGHCyCytRiHKJjw {
	NSData *crYcixitoNaLAcmWA = [@"xmLEGXvyaGycPmLeFrrWvlJtdEIHloavAZFPfoNBWnruGycgldEDMOwKRYUYZqOxeygYmUmWpVLvhNOxKMPyLDoboqJxHKiBEZpmjVWPMUzVWExjtQmHWiwqRDokWnT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lsxgHTsgPRJdXxicEBA = [UIImage imageWithData:crYcixitoNaLAcmWA];
	lsxgHTsgPRJdXxicEBA = [UIImage imageNamed:@"zishjyuOqmaQgLJIwOzOoYtaOErobhtELQuHwpCTTuJIcAnvAzzOajAEQUqqCyBJRTbJSWAjqejrCsWoaneSoFlKXtknBfAcCQArNvMqJmelNSdbeKjYjQumVfixZxVeOJbwjUBaQI"];
	return lsxgHTsgPRJdXxicEBA;
}

- (nonnull UIImage *)lNTSUkCztzfAqdWvcOo :(nonnull UIImage *)jHCCIcQFRhugHc :(nonnull NSDictionary *)XmQHPUVGPuj {
	NSData *QHemqOZgZfEHzsSsf = [@"HLdzYBAxpxmElMOrcZRbkBUvfVQHSmkILhaCDqZDsSNxhiyWLmSoXboQVJOFToAEYwRCCgQrYYBYcBiZXehVNPschPgDjiYdBCqCNtSanBFNDPbkIZkRHjlJSmgLejnWwgJhbJbcuzepZmWMqUsG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FLMZbrOIPJ = [UIImage imageWithData:QHemqOZgZfEHzsSsf];
	FLMZbrOIPJ = [UIImage imageNamed:@"eWAxXGqKMhiFVuhqQbvFVEDEdpfGWuPaoXvrKvrQqEvWitDvtfPTdZwAlVSCZXDmudlDWMuSNahIBroqmrTIyooKAeyPoDfvexkTmhAohaMPCBgXuIhTepzBFlqLbqiMsJvncMvpdRaGNQAkqouH"];
	return FLMZbrOIPJ;
}

+ (nonnull NSData *)uRpiWIvHsc :(nonnull NSData *)PhVvQzUNhDwVQG {
	NSData *bDmFSLVkqqjw = [@"CUgbRGHAWpBWveWPZVjaDdskDdCrXwUSuknOvYBgTnFsEByMIAlDoXBtFdKnVzPTABibwUfqkcfEqCSoIZNmqxVmjdtseiAoVNISy" dataUsingEncoding:NSUTF8StringEncoding];
	return bDmFSLVkqqjw;
}

+ (nonnull NSDictionary *)xBWKWXMdFCOrIUSZWd :(nonnull UIImage *)fdhfzTEZWKfOVBkO :(nonnull NSArray *)GpBuNZHQhIyxbMqyAQB {
	NSDictionary *mbUbvORliqwpNz = @{
		@"HJKFXMhbUYKYN": @"OkVqWUcBjBgHfXPZzAENBqNtLjNlkWaSrItXNWeiGyJDxGiFukTfCxHKniuhemvzCNanlJiynkROrYcvyeYUolsgJuEcUyALEqPuuoSTZoDnZcaRlrLzzynBRygPboCMZ",
		@"lXTupWGZrdhpLf": @"wDXMoZEiNcCyiVHhafyTCyUntJRYHniCOwgRkVyrcyoQaHnfOLRAWojTMxriwfzqychyPwHPokmzSwRdgfitxeWUMaVOscnHRXhxeNqOkCSvdqHtqmaOlgMgh",
		@"yMEzJYgYPy": @"hvOsmtpiykbKGaMIDmWnLVpHSxkRncUPGsHsXcwTbXXNrZHHKSZVKUAdmmwaTuEaNscrvDOENgIHkpnDhYVpxCYjujBMCdyWuYsylLAceShVLb",
		@"HxENxEMreAVg": @"eppFtKWcJWXgvSkVazQUuSRAbqIcNWaTmHZRPWrQmIGdDKwrUyURwyHCxJwecVVSuoCkJKIyafUPzgWhxIzWLyOdDYZMmyFgfsnWGpx",
		@"DMphvBuhNft": @"ObIxITIhdMdMJiuxWQLHgfrBukoXnKjCDiWPDBuCcsjllEmlDzXvsdNVSvRnGyAsHaBkradNxodGMxurKDjEjlwXHioNwRJbDINtoIlse",
		@"TVwZizBJahMSsbQw": @"SHVvAUComOciNDceSNgDIZupzCvlEBaQKCocEzmUeqhODlbwVJwMbTvlpvlWLfAiMnwnXjmkRNTzxXpfjVvtYJQcPkYrVnjSEntuBPnpPGGivQDCrsOGDRIPtcXUptG",
		@"eCKBQQpBgjOboo": @"SfutZPjoJJtqNxKkDXfClSRkMreQfUTWoEkCBTzTcLjdCIFHySpslCjLlCMsmlOFIBUEejWEaXEiarexwEhUJUpcwIvEgvwVpOULMvkrEJNtesb",
		@"cmZyCldayrXjYgn": @"FbvvBHiVhYZdiIbEjUclEVqVYtFNOKaFuaZHigVbmrOseBbymJQBUOVBUBksEgNevAAjFvxTwPtFwbQRuDzzTDbZQtnHIBKdtbmkkuNeqqBmRXk",
		@"kwWNvgxdoKIo": @"QkYDrzWBGzaPwCVtdYqUPsCMAvpbAeKFilZZsafGHFNclrBmARgIvFAjbYMzGbeyjvbixQryfNlmMhgrZiubLfhQdLReayeHiajYzfvKdnZUOFsuXQPuUlfxtvRZlVzArNDtwlxpDoczR",
		@"FQFcxCweYDi": @"XyvXRacmMAOFwvZiYAOVUoLQJnqGOCVAbfiXzKWxAcWnAcweboRrtQnYXBAzPiptVKzmYvaSPjLNyBdooryZfqoUyXTXSsBcAWFwcbtLjDUUXsVPbJINUfg",
		@"UrCbZQIBilQy": @"QPHjstQzoGdkCRKwdQliqTyjhuLOeRiPxRxqUCkhoUdvafMuZotOmCSrhAmXzbArnnRdNUqsYLVqUqpfsqSLcQvGPxePCiCbsVawOMJHYbCAuNYnRfouMfSDqnovU",
		@"ZYLUqoCLzsygQHyQLJ": @"cowhubbzyaabAfJtAPrSlELUrpenoxQRxZhkYnSDyZcwSsCooDCkUZkwGKZhJZiWnTjIImGFAsXBgarEXZWoyengQyXRBhUVgGDGcQVOFrjVYTJJRHhZqcGWicRhkXHSXS",
		@"TdkJIRVicDxNvcx": @"ZenySKlqvPSTjrxVqzjAUuMiQiAfHKlBjqrNcdlweninWeOKQMgcxEsXNLUKwlzWwNQRHaGzwBQiqarHIpXfZWbuHUPwKTbcDtqxnGQREaADanfZudEAnKZTOxdufwSyYyWxSJLKWmPuFe",
		@"XlydBdEPoe": @"UxlOtCnyrApkBRVdpKoMgNgRUvHNaZshcvatgFuoFYegSgQDaWKKRHjUyRJYKnwdwrAMCFotMBnQKXUEKRywnjhIermMuRvRgqIiZiEwwDgLxLfClpgjBKYcuHCgftlDrmoQD",
		@"ufYohXhagOfgx": @"MJQUnMdanWsaaTQQQkLSXydsLsmjtDgWyyibqjKLJeBeTkOsBCYIMRBDEgHpXmdBQNqiIHaJOZpDizULbiCXPHLMVfMVqrTxahbYUwYtfRZnRgAxBMWGctsFmsZkcIfFR",
		@"vncxelcAikuA": @"oADEEmeqKzrbeYikukBpEnuQrLxBuqCFMYwHpPjdUvDmLyJesZbBPJaRJNzvZtSpaMRKZocwhKGKrlxGgyNCaeduBrSVtDFRBrAlxGDtOTHHNHLxpleeTtuMrVdRNRwbgmgXOUyQysi",
		@"qGxcyATOoSsbZOmbA": @"fqvQnlpjXyzAVrNiyXJgMHOctHstjpTkqGzFJWhRtFqZObKNYzlDtkoTMofQSpVcXUQcnoIYLCrwsHUxPOcRNnkLhDwKXkODxMOUcvzUqUqJXjuHTAaAVafvOkbYunqFb",
		@"DHIXAuACLh": @"OvnopRJQbsKqNCABgKssTbUfRTRAzOxVNdmIHtgNZlZUXPQiJXpTkaRDIctXoqjZbBtTrJZmVIuyxqCnmwtNWZHqGJGnCNnKfwRkeyYizYdReVijHjxrual",
		@"ZciHGTWEhrKm": @"gxnhhZjqVqPAPFLXOvomqrEKlKFTLXRxJSOtXnqQjkmxZbBUMCIOYLDZaplytMRjPgpLqAXuOoIHwQwBHbKuIdVJkDUGYUjpgRUyZOX",
	};
	return mbUbvORliqwpNz;
}

+ (nonnull NSDictionary *)OixXUvahRXjYKiBoC :(nonnull NSDictionary *)JzMYgPNckTepSJD {
	NSDictionary *jsQYfglHtxgWBguaJh = @{
		@"yMSMxNiQnitPqA": @"glEIKDzgrgEZHqXKnESMHupEvnMhvnUeoOBVclwraWqvmAegqrSZIukBYLNUbbeYJDztFsDIaPsGRLDTcBxTSDecIczcjgKbwZollHVUr",
		@"qKkWDcemxoboEPv": @"JjquNsqFAkrifomeLeoetFYcgmgQvEgZwOkIfxxKCvuEekxQeRMFfSYuZxDGmwzkIXhZxeqvMbfvxcgfGTnnxvNwZibwWDajJZyQkqDTidcqXf",
		@"ZGncoCtKyJLuQvJQEG": @"VIVptNJFuEnkhddbVrZAFfwFSVOLDlismavCvTIduvGeHHkeICMjYrTXLpvesnEgTcyoaszxVqZHYcamczSCIHkwXTmMqBjepntNlepVlOoGvhNhsQUTiVCnDmpwQJviqwDoUpKgN",
		@"MTJVhHehQHPn": @"vOTanDjncJqWDYdYtudjtITjIeNdiYlDqdwzDHYduVumpMVuxeaLwYmeaHbmjrFKjyqlmmWEOXzHHCYbkFIYvobhUeiTPwDApxNYPTVdZMhopYrWUAYuMopnQWjdezHDZYitvWpMD",
		@"aRDAOagIilFpMEB": @"SUFQLYlBWhpctTdAmCiTCOBstlSohChTzsqqPJemNLbuViqfSAWnkNvrKqCmVsBaOpnEoSuvtSvVjObyjrZXXSCOOEeXXNlLyiRkgRPIdmymlRVHyX",
		@"NJGOCDCBOHgWzfIueV": @"iJzRJQzYVhkanuKGDSfnIApSrKGbrXLIIbwaMFNmRuIlLTnUKBsTjJKpkMSivYTalVjziUQYJspMWrlzTGcZAsXaKPojhpBqiIFIBAvoH",
		@"QrzpHNGlFRHmxahQ": @"TmRQGVoyOjLyPJAabcnRgJlnkqtmnkVhJdRqmThqzESpTYLpyUpPuMbTzEcGCUgWpLEZbiyZbqtAoTpYeGLytBwnfdiYAnzICMEVnDJIkdIvpoC",
		@"WPHnofUwxBlur": @"pfxemTsExIPvLguyPVnLytFyZUdKaepIUDFYRDlnZLaUbAoSRYhNhQgEYoVwtDXGpoEGtedBxEORgYPPyiIlcqgbZymoIRAkRNnIARNYogAJbfTlR",
		@"QSxIympaeJQAMOvVIHd": @"wBHnkviplYbyjzcjkfAxGICQfMspCsnSxKYUqKeKrSjDklnAcIogmvFLDKvBsZcvnYdpOxNyFaKrVKHluGcFTnCwUwExGexhtahUf",
		@"nuaELcXDaBO": @"pWbYNPqLgZrawCpsLqSgZZPrSyuFnBhiccaofNXlzJaDkxxkSthRHeETCjPGcSipvrZraRSWqxahBeYdeNMGtMKytZyUIktHzKOXtFkFGUK",
		@"vBTlPtCYNR": @"FXVPKQPJEZKIdnCUvDzzNCFlWVQfghvhZRWFWCJksIdGduQYYXFQyWwviRXKEGMLWepEzTjspHVnzsubeqnCUMzyNAtQmiymSUMhaysJmRXYL",
	};
	return jsQYfglHtxgWBguaJh;
}

+ (nonnull NSArray *)UzgiKZLPsV :(nonnull NSDictionary *)ooKBBuBJMIkNTFmd :(nonnull UIImage *)BfIKPPSuERqo {
	NSArray *vxqgXBXPGrfceI = @[
		@"EMOmLrRplLEkRJEGxypYwapINlkXDrvEHfTuYEwoFjwzlalazKaEvygmrqGkGYLzpKRhgZUkAJRJGwpcfpfywvEvekOTfPNKYwsljdMoBCwBgVmvkFHCWjHIyLpiIsCGqrIlcZiKciUrmOIbLcgpr",
		@"ScYSpjnGYjgFupXJgUbZHJBbCJwiyJlIjfpWxGoXpjXrnZJsfliZSkZahAlMKdHIrTdBrrkYKZjAFpQoKUZHhprkEMDcodwzCVkpRNtwXCJUFwjVglIIuCwVmdcZto",
		@"XkvEqCZPBwzEyHHypdXzeRTrSYCdNRxtHDKDDNZpVnMcWZMEWwQSfeiZtnnqKIVNDayHEocaxcBfXMmfYybgdBmwKqcxUTooKmfjAPnMUraHEgLK",
		@"MWlSvsaXPndoFJdcGwPnBIptdDZvPXUWymsyzGdtcwDYfscwtRadHuaDzVteCbXVGlfhaPaXYJbTdvGCzZuojRsmdKtRDlJHcmqRBxwiwDgGvaiqaazKrZizghycVjUDyLRKIJkcT",
		@"TfswIcBxURbgvPilSfkoRQzifjhGOXVenbjZsKZuIwjQFQQtNIOYrOBuWOPMZVoFNvbALBOijbFdxJydpyLSSOGaNZILhrJlAXkEXscendCUY",
		@"aFsgIQUfZsNUmVchqxbmkHrBAfvNltBlrDLXOEsGcxCWzCPEiUHqOiPWJCEFPOuvXJXaVpgHUKgnNtsHyBGnQSGnwdQckkQmGnxMoXJVULoewCloWLpKGPzBmeltAHdMvRfBcxtKdF",
		@"mfDGcxaDzxGgmxAbGSXppUuhXTQMrAGssPsNDfkTHANWZFaRAdXaifZrpoVvAuDvkiEQMRuwWMwOxaNXzQUnfaFiJbzaEHZQHGsLWTeixUccOGMoFKZshEmq",
		@"QZBeDaputroCsnydPvIKSqDHYwCjsMmNgiEXOOUUZNxlyxExeOvADEOwIYVogASExtVlNTLGoipUDdVclkzgpfhUOesFZGEqKbBgMwUIlxDnpJsKnAmVxkxGBpMhBTgwVIsxe",
		@"lEsGEngzXcJhEXAFrtcmEVVfPxMjCOyKupZtBcwcXUhUGozgpUgwGqYEIwLxfrMwKDzlbIIsUrkwCaEnJxTgTkjDSuZvWltRxWMavhvTDAFeRxIyqXsYvlTCJPlPJDcSyuWKWYSJVHGp",
		@"sKONOkKtueAoDUMILsWxZZBlbBIzCueEBOflitThYpcdfutidJvRmLUNGiXjZTDHQFsYYPBviTfHvUUwAWvdPFCQmCjPMECTXcWUBPUYbesBLwIJm",
		@"NpOkpPPdcGaxGdSoprUrmMjHOAacnmCLEDuKucXDpnhvIdAcYsitbYKGBzUjRRLYlQZyxXGwufrKqGTkIxqciZNRzvChSMtlJAoOuvSWXWzFcnFXDTGhEKEIkwSs",
		@"qQxrzrerUGpJHJQeeNpywNhhDPUDoFYZePvfKlTpFcCmfjMNnOaBdNxBWUqkJJPvduQRZtCzHNarreiNlwEjOOSwtjzAfZImYEicedFYdwltJTxhvhnyujmQgaCfDXAhFIJnLLzDO",
		@"sCTBggvraprNRlWMIebLeDdavBQyfNDhLIEJWEOMWJeLvjXgYRkzFVcLctFMsfQqiXrtsObtUnuVcRXIghwwCkBprZioNwsVzBjIAjSLTxIYkrXPGsrNajzqwJ",
		@"buPvYnyRZWdTcRAcIeNeHaeXRURSrCMKNUMGwCoqVRVoSAvzeKduTlvPMkJxoLSYYkvIZDXseVUcHXfcpukPUHULYDmdgPLxJFYeGBaMkGRJcLocgfujSaZGRAXjvhuWCASOfuxwGPhEPgtdiEMT",
		@"LleMSZivIwMWizdrVyXOBlQLnjUFbDhzayWqYrWEFNTtpKZHfEwRankkxZghNipvlfhKFqKLRENctwdkZTeZMbZMBKXTOFCewVIcIDhf",
		@"QCbxMlKNuNwVCTxbBbUHNRRuTPujFenqsiEEQhwjrGqNWulavJOdfsQQTRwBKhWPoWajyIWkeDXbMXunRuhatflAGYnqQvufenjitAECBMBeUaznhYQjYCFx",
		@"gumxVYGtsFdGBMkLybCZguJyuKEGGgNXfbpOgiEHRgJYLrgAvuBEooofRbeNCSIUKtbtyLjEnOQzxYcYoAyaGomwZuZseWCCWOMhuY",
	];
	return vxqgXBXPGrfceI;
}

- (nonnull NSArray *)sQjwXwXuJpsiQPLiYw :(nonnull UIImage *)iSyXyMAywehwYep :(nonnull UIImage *)iAkgzPxukFCswVsf :(nonnull NSData *)wEeAlqYjbpWRvU {
	NSArray *rGfctAxntmHFemCqbVd = @[
		@"MeQOAqPgRHsatgFFjeVVCRVNhlTgQerCVdQuDBbwlTcMcepfufUxZuEnwggUVVTckfdYSkMxMZFRrxhgapufqyVjAbMJmcLNKVTgEkasR",
		@"PxwgTlLcAxCPzTBZLEqBzTvctRlghwsYKEkqOsYqlCwVOeYiAbyOCGomYDeFKpSSPAILHdXGhhSgcukDkKIrPSwGsiwdXZqqmnerrAbRunCzhHTlwdpmMbAqtCLa",
		@"RFNWSZmiyxDvyldewrMxIfbiaIjfQjlxhKAYQLEzhxmHTlnPDQjoUQRBUqHmWoLvWWvIjrfGjyHuDHWrIyfGODwPEJUYJXKEumIoyTlvBuddJHULZmaeWkFHRoErajAeh",
		@"cDSpWoYesqZrLbNyXgtlOAHynBqEfiUYnQNkTEeCtNhIgrsrLyYESFNhRyOIgikIBkpPABrKLQsRexyEagLwxYwFygqroJpHUSpQePedDdpoozO",
		@"xSNEzYiKGveqSuawJsahCWGckeYpRFjlqFqrqGKePSALYolBjRBgRsamXyaqiDSWhwrXkgFVisXslwXvCAUuqpHFuWVLLvYhgHLHXKSHbE",
		@"TuYgoMOlVmGztSIFGqjGhYbvuzAUkXTjhlGUjTtYDKqQmNmZrAUUugPGhrwVtPPpqGSioxBfNWqWJWqsfHDnQExEoMNDzEthOJhgbCGyOtmplGqHRurDixqdBLfVhMBGDXSGblwUWqxgcDTcs",
		@"FIVuygPbFHssTorOSLynZSnwwaIALKhtkULgjYOerTuPRImOOYDiGwVogLaJvAGPqpqSWaJjyxcRxhtjxvlGohXeVUIGFklCdhbzBngHejJWLsGuBY",
		@"qJrnTJuraDfOSPEfyOutyGwYMSToZVhasJmYvnYbDZxXwnzegCmrXmvJwDAThzLQkgdWNCrdMkfpciaLVRfEZvlRfrynrYGXBicWERaFvOzdrlukxhOLDLUorBUjuhnaoCBCyivNkwS",
		@"BUngRBNtEKCJxLAdJrHdsqeCEJiFlaNZTeWIaASMvATUBJWlUWiQxuFRyqCjZFPEfmACqrGAGKXQBRhoawmEqwuujIGJGeXgiGcZvICFXrpwxpZZiTcrpyqGjaeiHJrNbhDIhSq",
		@"KadNvOZmfBlBmsSUshttoCPBxJokPTDSsmbClZoUPtEkJrnKhZRyAgODEJAJYagWepPKxOQZaIEFDMZNerDCalPyZyPkHHQuRKpYehJWKHVHExiH",
		@"uNxmLLgICcYoPfIAMExbkswBpPlscWGwDTWeGewuagPqnngudtxjzuSeegcgZOjLxGGlNBrvLDhMQfgIqwwYmlyKVaoYCwXLyNeUmsOMsCCUBqiEGxZStnM",
		@"FALFKXxdDHiuLBECvJlHrhsXzWkyGqwJwvPfJAguYIjjRLUfIwIAMDEpNTQwntrFJqsAKLpNlTqZMTlQuDTeuzkgtzdiFxbJPGFdwHRrvZpHPihvExukZEpxltgdAZhBMYOfFvdTFWvgvaPYRnKjV",
		@"hxzhiyTbnDVlUAvxCQoXhLwWHzPRvWefJTSKDQPQEmfWwFsYVFyozjiTJlqvwZataCEkmhCcpwahPiexQEIeEyJnqNHmQywQSTWCCImrtqJiaDkCjUkCJtPqGGnAgjuGZqjalGjkrFqQJouZVt",
		@"wUVpNnTEkfnVtmjJiERlbrJofzfTcLIKrNZlRShHTcmWmTGjGOUkwgCUGuCgUgEtUVsBlaExtljHjylbQfaQeXbduwOQzxakPLhLCHOmgOHiULkUK",
	];
	return rGfctAxntmHFemCqbVd;
}

- (nonnull NSString *)XXTpponhvcCaoi :(nonnull NSArray *)mBDuqemDtFHzvs {
	NSString *cPrbTjFUOTcaIzXJU = @"absoaFejlfmhQqeZdRebskZOFkKIldJntDMOisYuPtdhtQEOnzJzRjWTEpbOFfiMuXZIuCOLAaWZuhkKpfnbiJaCEedKfygmldBLKTtyOIPsymORtVxkGrmnFGlpLcdGxiYOKJPQzWQSw";
	return cPrbTjFUOTcaIzXJU;
}

+ (nonnull NSData *)scfMRXiOqgFtnuySM :(nonnull NSDictionary *)ESkOeODfofnu {
	NSData *uIJAqWcAHONRNQ = [@"wftyLnqqoFUEgwldYeNAoxpnHSgfuNmuiGYybMypZSPCVvCEfdYKBzLSAVjMzbXFaFpkhIzMeEKAeXBdSEBHGKkACVleAUJjFNWczMvJZSrXpWRmqhwxVmeXMRxPzoEvUloBFGZZmQK" dataUsingEncoding:NSUTF8StringEncoding];
	return uIJAqWcAHONRNQ;
}

- (nonnull NSDictionary *)NRNsIdSNzlqzyIxPNDL :(nonnull NSArray *)UMEKzrPkPLAtjSKQpp :(nonnull NSString *)BnpbGtDbvmCdc :(nonnull NSArray *)wxDepLvNLmiizsXne {
	NSDictionary *ZOndPYFRBesyG = @{
		@"LEjlHmuoQs": @"AyBlIxXPGeHeqBztFmGvCEVEkZdOWpoNTChhQKnJuIrPnSFecoCIBweRCuNVtJFLBNXcEIZPBElRANcBHehLylQgTwBCUQwnuKdplRDtMkDefundCiqnRqwwrmUNAzWq",
		@"iXjUZfeLHFvMwqzSITt": @"QpeKKbJNUufFDGWFkuWMxRYJYQOgPIobOvcrvAToIntyRSnRQRQnLYqArMvISppRgwrWHJApYIJUxBetcpgnmYuCXfpRLQwrHBBuahgEaNZzStdhBHxGUcXUdGEx",
		@"kRoArjLiAzf": @"uTcYxSacKgrQacXrLGqCZtlnDvJDMizfvEGmaOPfRfSKxyVPFLOALGzqUbuoLJpEYRFTzhhKFzUnygLsvdZzdEoeMIPBylBOjYLkpcXFGfvELorHSsspAfCwWA",
		@"JwvmiikfPocTOIZ": @"BctryMCErwnxqOioyRpTDUcJbbjITBxZjODQGdcnSilsOdexxEIpokWazHWrocJimaYqcxemJEewYHsfmsGRIBQJCaOKjLSGuaXZWHecxggTBNDCpymfTMebTPfvjgUHZSrowNDjkbayMzeKh",
		@"nkfMnvDOjQBfu": @"KPMNxQOHJJjlaqgVWEmXltSjyPSVDqIKMXqoQwUHXNQChEUphvFhMjZqkSrdWKzOUrjOSMSRmSLMyNrXNFaPtQONKtgQbCLiuXlraiNCkSIKdfLaGFrmhARBDBPQxvhLMtPTNwQCSfVA",
		@"qpcpZNWtjxqbuJVJ": @"KCSURwRTlCbLEYGMcLNqxgYxGLNDXoOQSkjyWvaBLyUzbaYsBWMKJZwrfIaPboyHQfnJkzuSuEjfJnQGVOpCwhXUXvqvcAHTruRlzJChlvuQWqROHzWFyMMQb",
		@"gXjGJisFxXznGRKbkyI": @"NKoVMnSQTvOnKWvWMmVszjHkVSySdUMLjRDkjewXXjxyHvcMUTOmrEVxYbPzjDdUqOTBhVJGUAcieVIQxMntgTrdbwkBwZNHPaPlwNQ",
		@"sMSSwZcCTBbHZcpppW": @"VuSEXYUWlFcwPUlHPqmEmxggoFbUePjQvGokUVnBLWRjySWeyYKgKxICSqGmNpYjtDZwnDLRhGPFFWSOGbJhSzUdcjjXDTyYxSOLgKQTyWTQBRdpLhBFAWQgrgrvlUHrLFNAkHfouwmLNoS",
		@"dEhurqYTxX": @"PKmwfwPlhjurVNubPalTCtAeQSxliIiXHQcbJZrQTakMXsTjeJpqfAvGbiRVQxPSoftvmjGMiOZvmBEzBzgJsifenpiZbMjUIwUkiJqFDKQQPuXHY",
		@"VRUuYYHBjLISWjvbdME": @"mbeOEVaxXbSHlchBjlsqwnMrUWOJdfFYWHeBnjQshHRswhFFPSCXdiiBPfWxQsKdLaDmNZEyhFlLWaZNjgWLqAomyFljqNKusILTuJJjrMWxgLIzJanggkNMIcwO",
		@"QUfPEypIznN": @"fSiDQxQruuVdUMzLQwrPoOZKouWGbOMZOllArNtVPdPMJIUZvLcJBLNkRrtCskNkJdFpZoAWBdYbxTZoruDnMQmykQcuFdlTiiInegdwvEuueRsxMqtZavxGdIAJMthiwx",
	};
	return ZOndPYFRBesyG;
}

- (nonnull NSDictionary *)olfyHDjqkAlhar :(nonnull NSString *)WTuhXmGGvbVr {
	NSDictionary *gCqbfAFnxq = @{
		@"dVPsofaZAqO": @"CBQPEuwCpVdEDomvEcAyUjGAxsqQiXWcqOCkXLayPBnvuUBNZIZpWpbVUbcwnwqbtWZKAHAKCBfVzULrnHYSeZBWLBPxAxHeAMmKbcjYjvOeNXhnPZZeyrqDiFEkDBMrX",
		@"FCvKDMBFOWBFrXqkq": @"UcFiKsyfVKqTlENVOBJMDIyBaAxotXSbfRUFbMgDwNDIBLDHJJaUOgblcBMdSqqxBCbPJjkCHtHrQIDQqVTnWFRpgLfCqClVKXDTPvqLEqPbLaq",
		@"nNtyuREWQKrolAaqYN": @"rXDWlvxigingBAciEJIavdfFvxdPCIGqpNHWhqOTJNMNfrqyyjDYaKPTAJTQyFsayXQdRrgcVhxKIjQPtqkFHMCJrOQjMZocMCnvSUuOJmNvJKbybH",
		@"JIvYmIrXcAjlhmNN": @"CoDyQuwTjYsRQDBypUiergigcqxyEbxeImgwrSsZfnzOjeQkaEpEPVhjvwBlgdspkXQGQvCEOXLtmJNwlVahIoynkTXxBHHCfcMANrWoyIpVvzTuiIsjBz",
		@"YEvjelkwSgPwYmf": @"znTqDDtQGFREeawGNnOJmHmWYxGSBKXfepFrdzPaGjtudNhYJKMXRGQYgmZZblXcUnJHJahBUusDBNlxraxFOrwDDdlvegcQvRaH",
		@"kGtRQcZkEBYy": @"QGgolLCwUajnaukuRnCaISRWxyejKVTRQphOIzQoTQbxuJJyYSWiCbNnDvDFtKHxSHLqfuZeiTfbGztyLVObWdmejhTBvUnGpeyxhtoayvihejRfRRFTATHOOPXkeQUBcduWCLkbOuiivQb",
		@"IryJFafqYvICYT": @"qxMBMjMieHQsxEShiLqHWdJzhcwniJjOlnaXCczfEfRqhaoLMYuZLAmohlrayMOZXNESuhpoTOuEwLpMXoaZpvnNNvSENjFEbtgMcGepWcxRfgmDLaWRhoFMIqtl",
		@"TjvLlOOGESwJfsApug": @"ZgZQzNeOAWLpZkKpFUbhWhmQMzALdHNKEMnANajleiRubWBSbtuJHhlMCHzHxqVbZaHfWnypVinedYyolewUzImmEIXxRCxjnaUhCqVAEwTHLDvLfmfGqz",
		@"AUqwvQxwXrVtGkbloj": @"CDIOsQmttsUaCBWmVyyGEpApGBBSjyOdGaxSgAguNoQbuPjroRVEVnnAoEZrHXGMeoOABzfClCvqALuJzPRgMIqMheTBAeNZhlpmhbxZDJPOXSZVaM",
		@"ZxEYNPDzmi": @"HDkXEKBvioCkYOnuhFxyUFKiIyUSjzPWQyTTJbWyFXIsEWwBfROFqudkNsdexnhMEtAYEpjEbveZQkuEvdSbUjTjiJlaJjgDNhUbokwAUOcCLJFYkRpxFExeAaXbUFqLoNrEVzBdCUGPylIzibw",
		@"INmCzbuUmBrhAoRXwUE": @"JZNWRVtAnpMvVfrrspQzOhFaiQXRyahTbNAEQuPDMmcDvlPoNFGVylfDcsCBQseQcWYibuBYvcLyKGMFZJEUQSwWPVLNagAbSSWzfNQIZMZHwsghGmsTJJYUcRbqgBqwZjTiWCtVOlWJ",
		@"hBLkvgvradFAWG": @"sjweyIbuJTeFnzknQEKuFBdMuNMAXpCCTmYvuAzwuAAPRdVNXEcSnmWPthTRFPenuJfxwPLPBnOTGhzsOgOrbDxDBsxNmLOSWfnjGpaDRDWTbnfMlURpVSaOGq",
		@"plXpeEDGQA": @"DpOUBPUKdrHEsBcgtmZZKCcvjCyOzXhGgVeHTcYbMjGqghLtSWSQeqyzFZhePSFLLUTDQUoZnlJXmGWkEpcgEdiqASRichcSGnShEgZusIGplxBFRQPBXXPsZxvcTYEqbQAofnvou",
		@"RtkvuCFQPO": @"zfUQHxBUwLIgFSkzSbvXqWOVBGKpvCFuibMQgZpDRxNCulUBgeFSnBJOxWcvxhefVqIwXJKMmbzWxXkqPoSJGKDGqntvdLjADexPpAXRpxjHTzxnHhrPwjUGzepwaHtKGGwLMYfr",
		@"jKIVFufQdBXWnYzE": @"cjPACntexteFcRsqIlOIZYalPQWsRQqrzyjecVNXGwNwHgtovdRDMCdiCAfKRZdlynOszknRjYEqWjEzoOQKOtFmMvmnURrnCAWzUxYIKznDVPmZftjJXnCdwoQSLVovrTbyW",
	};
	return gCqbfAFnxq;
}

- (nonnull NSString *)gtESuXybusAHRXGKh :(nonnull NSString *)bGnssYxzOyYcJlWMX :(nonnull UIImage *)yHkSYNWahsEooOQXnvM :(nonnull NSDictionary *)FvwGTtnZoTInuMijJWk {
	NSString *gMtnDvdzUUf = @"MQOcBIzdkPgbEFGDYRkqdtModiTxGREFWTAJTaIhNymZkDVYtiQjpGAAcpiBXEYTQMdtkwasgwSQAYGQLvDIdPKMWjNjCpvGcrJmqDJkrktzaL";
	return gMtnDvdzUUf;
}

- (nonnull NSDictionary *)CIPShsPbUNX :(nonnull NSData *)gfDrLFuYTAtC :(nonnull NSData *)fcReFvllxwAcB {
	NSDictionary *OToVnIHIfIlVBXbc = @{
		@"yTPxRhHgijb": @"ALFIDLdoCTKBnZkGthgXmtBNjINzaLtrReKnGWgQHLIRnJFyABYkxNUvqTMWpnDoOTLEUTGrdvsJduwganOAihrEXpsQLLMuTUFxSLfcxYzQkYvQCbyHmJhOdMRykfW",
		@"OjYBQMFrluIlQd": @"XFLBWYOzvsmfEbtorumfHqYgJWMdoTJrwSLvblzuyJMVYKwSqCYyebgJSIIFhjZNbWHOPWrKunHKRyzCYOUAxoyBxoALZtzODudk",
		@"mxcxPIbaOFgvXBV": @"DRUDimaYLBkonoXScCKOWjcYnoBoelmokrzulZngnxqapiIrxxAXBbwwcfZwHireKYCfifSAQObfttNsbEDgWOdUCaWfISmTnxmLueAQblvNXmJCOmTtmKlXwWfIuwAeXMumb",
		@"xUbmDGmKjkNjHzzqF": @"wAqpRqIGSPiPcfSXFjNPndbulxPdWZSPknQecdAEgPUQGsOFlZJyQRgKPHjJVktkrxRDcgdQncHzMjCnhcUVrcWvOeuZfEMqjysmZmiUhPInEyzJTipnlFgwjkcHRPZMgFYtIuOGoTBYCAOnI",
		@"PXcNdCWnIMTLTfU": @"nJBXhMXVJNVIxywUCvCqPAdYtSznqTGpiKUJRHFeDRBqcvqVSbEmCwqrTOxOtlsVQpuhGspfVRAfEzaxvMsGSGpQzBNZvwqpTCIosxaoeKePDcLKdcDhLGrukRvcEnSaBN",
		@"IjSaNSztFy": @"TzRfIMXRsrYweJynQoNCOOGJAMZJrcBapVackhjouwCMtQysOAUpWvVvtleqfhiIGFAQyVVgOOmvtOXwMUHGNTXsQeDYRnwwjyZZwIasraanCeEODbfmxSrUEIVJA",
		@"yvUaqcyOqEu": @"LQodVHmQEgIngiSgeokzCmZSyFNSKepCxKuPVEemkXGlHKstVjFkithyQdvzysIxcTdFsjHVWXVRPQPOOpOQeAPCYcYcFqAaJoppPgPBslosJQjmTVUzIVKOFUxHgIjwQfQltwBBxrmr",
		@"gDddOKFgCuBZQbp": @"hIJLoMzYaQMCHrQCIoevPRUDqISiVPetozGASIOZNBDUhvoTmmxzbtjNrebmTzyGUivGFYcFOSQNpntTHFOtBuuqJjekNTHfrQtIIwTaRGppsbYaDenvJL",
		@"oWJFmwQqfohW": @"ZpcaLRsXYbAjFtWJqfrHIBYLKtcVjGretZEAuEKuqYQgQJuvUHJlyujfDPgTQvMbKxLWeJKjTSGzHIvVaGDpVeopzjDjBkxlRpfLPvoRlRcmrrbSfyzoIHHhhflzeRVOro",
		@"DotWMGxZnFe": @"CUdPGCUIDvpEiYwZIJAhkuTHGbkWlqDysiwkjSXpmwIBQfqFjDrhqgvGjUTQYQFJuNcimkthkKYjrStSQePFOnIdUFTPZCoeMBuTzNpZ",
		@"uGULgFfFQMvbpZW": @"GThNtuWHOZMZUkhMSpoZHEJnGnMNAVQZCABJuqDSkWqphBGuQdhqeEwkKRWiCibfLmOtUlFwdGsBuQPgkOGpUVmIFTiVSWcjEDoVUPmYhKREpsycy",
		@"XCTwdqKPwCEkanhbEiv": @"dQTQoOcmoljVrSNIOBGojzmhBRxmwtrJTImcEVdgSWwfiNbaDYvCJZYbDlAulHLcXqBzYDucJyDtVENbEgWTxMhoNxJBgrZkLwxtdTGHIyRNNAHdcSojejWdXHUCAsTpqylCbwboqDxGLJ",
		@"KgTGeIGzqU": @"iaIJBuhePBgsVPpNeNrhdwkHbWktInqMbVUdmWFDgKeUclNxwzBpGmIJMIYAyOjFsDGfBIkebDaTnwwchLudKtIglHxaRuncWBdyXySFULSSnpyw",
		@"xwqQLYFrrQpldKB": @"TvkJWtGVCtAbapkkxGopLoNFBlwVgfPQqlUEhsBfKylRSJNHZTJXzBjgfbSBjkJRCFnGUHaiXtkWptwqyCpNxtkQdyqjKssDqSkUmouNHKwaeIZCYGJNDGWduDLuhErrVCLIDsbFGc",
		@"mHsWMzEtowNpMQ": @"riPVKDNlZvNnmCRGoAloNbiwvXTPHSOeMnpaEoGdSbzFOTDWMBxnEiGIctUEcDkHiHuGJJvXQVGfBJiUurOAUoJtKmzObLKKdMDXaEVAxNLTphpjlxnivNkFufkQXzOq",
	};
	return OToVnIHIfIlVBXbc;
}

- (nonnull NSString *)DeQxfZhOeWkRpNwoDeD :(nonnull NSArray *)tocJnukeaS {
	NSString *lfWwRPcbfx = @"RkYwIzRfnGcKYqzTfCgdYUDkZZLGWhagpBZxRujooZvOsKYAtilwcpDIRCkULslutcqnboZXrRnYjtolNUBKVHDNKnKOhEnfGdePEnhQvjH";
	return lfWwRPcbfx;
}

+ (nonnull NSString *)hlCprMvgXNnNCR :(nonnull NSArray *)wjwsvYYAXWyaRhu {
	NSString *HAIqrNfMYfpoTP = @"pXnsXsRZQBvEblaCVXSSxPZLMlyZWZGeLzfUQMqlrWgkjUVfrDEiQYFRphsjpdLGdsZgCgTOVDGvmpUTnvHlmOSpaxFAokoPoyTfJPalFNTDE";
	return HAIqrNfMYfpoTP;
}

+ (nonnull NSString *)iVVJdOuyavZStYdj :(nonnull NSData *)ZiLIPmNaCwigtNikF :(nonnull NSArray *)ZFyPfYCQISjnOeWNim {
	NSString *IeniMsCwkLBa = @"fdnlbrgMmNoUgyEFytEdOnEZimYIrNaFOkXqOzCgVCGYlEJJUbflmuyCLnADpKePHmeLETQOgCwhyLPSVZQqroESmfyXHvWhFmayEQlhrNCSPXIgDGzCGGsCQyvgPOqkkjlAYkhjSXzmusDwBAE";
	return IeniMsCwkLBa;
}

- (nonnull NSDictionary *)fSMaHgLXWOSeV :(nonnull NSString *)wzInnCCRNpt :(nonnull UIImage *)VOPnWiTGTa :(nonnull NSArray *)buFmwyWBFJcJQUMV {
	NSDictionary *QcXkYZtgARXA = @{
		@"xojKeucRrNGsu": @"LCWVtCcVPylAWYAgSBcppXtWBxQYYlWcMibaTHgYznytiCDebrCiJeWYBjiUvAnlTTWwIExMugcOWdHeRMshAWADvXILjKRrOVlaznnzGAP",
		@"wjZStFYxDtQ": @"AAaTxIpACGXCbrvgCjisIRApKTtOxicOTxJREibHPaQKMouvAJTuyjSCGtJoJAXgIPIpVqVCdHWXrKTenwZEGNvsVelmlwViaWjiamOIILXlDjXgNlXpoJftDSZVJygDtHuePFiAIllUbUNaOrnSm",
		@"kHFabvxEmcna": @"AhZxwXRUVdUNHXnUjTJPbNtTqpwQPunewgHywXZVwAZczRxECpdKAedJknjCQEDSTgnDeDJYUcZrdtvZOWxzPcDvpzMuJOuBQiEprcdoKays",
		@"EYMRpnNWdJLxOrwFF": @"FhhrSemiWKhqTeVWmXxLHUUIkvNMAStgaIIawlcPaTUpqFQipDYiBiRxTlnxaDvcCgTajsDNzvNjuijSAqaOavTImUiACvThGuGwkXEyswoHnyuXZbQbgaslcplMTCFYK",
		@"WiyerTACccLJbThU": @"YsPfOdFOYhYSXAsvoEZnuwRzJBIVpvhLnZqXYeVPLJjBldydaOnnzOwNpfcfhfenqvhXnvnDLHFZykqhuktEqdBZAPUVcZuVpWlMlbibjUpfcTHsePWcTbzBLozaZBuxkiqIakYIMhADrlbQVGyf",
		@"zLvSDPgvAxRrGN": @"QhODgnWJrlIHlXnhAdUOuvlznxpyCejujLPvLejWOkDLREXrVFzWXhjSHyALgndwEGNwuvWBtqSEnErfeVRsQmAMnwTjVKOWMANUg",
		@"sBqQScXzwL": @"ujgEiuZonHHAJgmEdAjprqBnQuEVYxIvRibvxHLwPAVeFWDGvzNpFQOzVoBMRSKvDdwVhlzobmALbGTsyAUJcXyhmUWHOzovyiTwGdKPxXZMKJvvFHtSEzVegpPbrBHJsrugoA",
		@"ETiOATJVxidFeqnODFl": @"EnYdujoGsUbEKsXnKbDGwxkvJDyqHtPDYHkHFBYhSwjxUjXeoSLpMDahZReSBqBaZhjZJwqdGteIjHRqWAouVRAYBWQtICguiCHSWwTYcFOFDxckkxYA",
		@"ISOrcnrguUNJWfDx": @"iUUoLotLjnKjixWbRhKBDljzWWWqibBoMndLWNaRYpoeIYzMhmAPAKDSmvdSWqlAzDeRtniiLqFMDoaYDvpQSySldKQyBUlvzNDIQVbicWqzAlLClKnKT",
		@"pmjPsTlFuIZqQUYEu": @"CFEvZpXCgzMpbiTQEHzcycYEvoyTXGmTNEAVkwzFlBggYStanuyvCqLfGJiRRCHLvraykEfeENbAhqxSYwqfxgJKPDUAzPHoHQZBOnhonLxSxogeugK",
		@"PAtJwoYkqDXlqYlq": @"LRVBycGIhpaYFQYmYQnUAcLfqswWfexIqCKGjyBmMTmfkJBLBCeYbkrdsXgugeVWKfXgRXVTSNPvFWSNtSgRPXtJXxsZQmhxIPpGtYnETDdPHrXivVr",
		@"RkCVJNbdkyAC": @"dnsoLTytRtVfNOeyviBxMSpCzTAUOZqNFrFDnGKTHtPxoQiwkkXpbAjUTAmCbHbWphkSYIvZciBsUMGutSzqBrAiAvdrYpaiTdSdORA",
		@"KoywNRmdWFDeNuszqw": @"fAMaCVupnONGCkvLHsgaooJQFNYTpSyMasrsoqlifVzehWYgmOyMkhbXHEdIHpstOKKaHFysAGFbbJBRGupqcPIcSIacHSmmGWmDpDwthKnGqQTJDqtrbUpdgswgPhRVcsENpbUhabIj",
		@"labqpVExncmzqeDkv": @"FpddeuxRJcubIZfmobmlBAMrFoQeRZkISaqAkagJTLFSbEHZuhcKLQkkCCMnfbecbwOoYqRvabWjKcvWLJaRyPRhUeokizwOLVIPurUivrPHKcvvohjkvqRAZOfwwpqOxsNponlBVd",
		@"zmHQjrxMphDNRcnBCw": @"vZFczFjOWsAZhYekDgCCcJEsVMmnFApvARjNxzUeZsUOSiVQlyhDBiJbTBYSZiJUfRhuydQgUYsbUZABxnVnaJBldxFFeEvNvLBxeTomuGXHKoDnHbMBS",
	};
	return QcXkYZtgARXA;
}

+ (nonnull NSData *)cGGyyTWrFmVurJG :(nonnull NSData *)gkNIpffPNSFpMnjkJ :(nonnull NSDictionary *)ssYnEZaecJivp :(nonnull NSData *)rAIxUQYfiOsNTsybk {
	NSData *TfEDPZlobdzJkTSW = [@"XbJyRhgPlPdnqZJQNwFimEiMuKpDCnNqcGMojQAqnkQZRZaLiQXkegymsjwxfahaGoCaHgPDsJqDgPvfhvNTmqkULtsfYJJoCSHFQdseDeNAqepUgRYVKYbQVC" dataUsingEncoding:NSUTF8StringEncoding];
	return TfEDPZlobdzJkTSW;
}

- (nonnull NSDictionary *)RStmRdKFKmLWJwVLZw :(nonnull NSString *)YNvnYvvizpnbgyZXpfh :(nonnull NSData *)pGHredIBdwWfF :(nonnull UIImage *)PkAoRMeBFbTpmz {
	NSDictionary *oiKhNzwaQIsCvgmXUHt = @{
		@"mReoAimuWcvUFjAlGY": @"ICtZbWwHgqyQrHNacrgkjJzTawiMRHWZyKytfeIpUWUYjhpDqavdFjgvecNdBrwiYOdVCeduIpcSwJoFTmLCXgrPiRotTLXhwhJeJbtpvDDGiSGycVqjfFApOzEMjwFiV",
		@"YdvJFWQiaQzIqDUilva": @"UoRaaBkvgJEeDQgiejLpXItlEmBOSnfwTCuQIrAUokLPyDnyBBPlalStbHozCzbjgyrMEerUeujzIvybOxfJZLvFSfoIWnNOEMDARRAONhYIbZ",
		@"bnNZiDxGedv": @"KuOLDrnrXFwvMABdJIFvVpGVkJTVBwysmYxPcRWgMpHVdITksuPFoTwkDdcHjLofpVmxLTZdUBuCPHlMRySeFzzmCxWGhAYqWKFzOsXcBwMTYCZZmrmdSeEnRxVLKmCGnJo",
		@"jwHlVmZVbowVUvscJww": @"KfjOsjzoLEWkqTnVnwfcCpmGToHuOdBDgqUYBkLspWrqfbgKrgkKcfqdaEGggsJODNparHlYKATTXMhZPxvMwscntggWLrTJPYMczJnmEPdlsUjQxdJznmNMbIgwVEm",
		@"eJDZyAqJXcG": @"rcONDSZMPaVimZetsgXnswJtxrXSgNByCMxzcingaQfyZmyqstSAlcmFsQNPHeANWwclxKcSddREPVtxOysxuqusIKxWuOaAsfqcPWIISAuQVLLqa",
		@"ykssUQiiFLxe": @"VsKWpWXKBriipJcnAPFOozhoLZOkxaCbgrjhDTKMApzpjPVbdPztsBFpinYGCohWYHXSezYowtmCDEQeKlpNfuohPZbuaapdPIlniVZQnaTxlMUREjwSiBLfuGqIPliXtNYFgjXoPNAnvs",
		@"dOExwNBPbO": @"lJikGGmjOXmpwvSHPmQlDUSZqWpaakOUrwNGkHhyUwaKJiXDWERWVrUqxFvHSTvvZQOImuvtTdVTUAyrqHkUeoGbhibHgdLCbzLd",
		@"XFRjkSwcYknVVXbNyER": @"QqORCFrSdTvbYJugvIfhyrEVtEwQUXcmiubEmPRpQwlbvYfTiELOwhEuuTchMbZNSgEFZVvDVJWLZrnFYrcnmOoohjzqhEwKkFsAxjBNkABiZqGhwtkKiHrvErAACiiqjDOHEGiXHYnJTXZRhQ",
		@"SzvMHvZqENhgni": @"ZUnxBUhDpwSMhBunGbgwKePvdrjDVZQFjPtDUKcVZIUjPRWoIUmdkHAglADvYSCDTJvmNESJpQYCDSzTnVUXswZPAwnAXcQbQSawdmozJsBmUzlDortM",
		@"RmVBJIewacBuwGsRP": @"wKhkCFwOhwvXHflFsGyzSuwqXXSOISyGuLFelhKDKRwLpWIZZPWtZWQGRNixczJFHRIrykVeWbbRZYCmkFYVCOXfjDfkZtTVWjGRvcDXcFbNQYgoXHhdktXyKHlATvcEKAoXrptBwilV",
		@"QbduJhhjIQELtH": @"EtVDGistDCXtnjuZrTrgHYqdYqlwNvRBqDLHoHnUfdASSgbZWaOyuPbgWESyKASvYCPTAwZgzBKGKMglENFrRAuBMMjVxNQFiOkFaGdtjYbhmhOIRPQKLYdakarlvFhQCZqtuLY",
	};
	return oiKhNzwaQIsCvgmXUHt;
}

- (nonnull UIImage *)sjQHvqwDKwlCzFtGK :(nonnull NSString *)vMfCYukONfLPDbAI :(nonnull NSDictionary *)HWArGifiTmilZaQsSi :(nonnull UIImage *)deOAlHeEpiBHcDC {
	NSData *pOOcASGRvL = [@"UWzjkSUJufBfcpIsalhCdYvtqvBIYDWWWJOeozPieCjWdBmYMTDDuyXiPETMcYUiWCEkBuVTCPAqXQISWAvBXedCPbuNttLSFYArXZZSbMinHJdAcAIX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZHkNUxjXdxWJahWqK = [UIImage imageWithData:pOOcASGRvL];
	ZHkNUxjXdxWJahWqK = [UIImage imageNamed:@"OuLCtmgiCLxexqEAUiPSslGPYETMDCvLsNAFtGXOJvOwMXXVSVPEJlGSovPJDBoRBjiGHToffuCYQnZUVhHwgVhDOHURUgjMfzdKQcneefKlCYfbrwWNQAgsDIxhwyQyNkJbUEGMiShMRnadxTWf"];
	return ZHkNUxjXdxWJahWqK;
}

+ (nonnull NSString *)hJhxCRfsOLDtan :(nonnull UIImage *)VqCvWlOhcHfpLsN {
	NSString *UcKLEFpBfwPTdF = @"SIFYhNDoqymYCtQWdvNhkkEomjFqUQcDXvBJcXMUuZvIogZRommEzmVqCDlLLWNoSFxNaZyKdDtZmCRRufOwUMZchWJjTepOIIjKkDsaQ";
	return UcKLEFpBfwPTdF;
}

+ (nonnull NSDictionary *)lCvyMYwfXm :(nonnull NSString *)HzuvohOKCszdaF {
	NSDictionary *XOfJyusaTJgXjMns = @{
		@"XJqdRzAtmwbGhhc": @"snCjPZTrxBNscWIcEWaQVXKNpWhHOOemDfwuLMRLgMzmEpoVmbeHGHTXjCrMRVqBoQcLzaEUIiEgNGyQEjJUxujgYesEATLbViGutWAYnACaGhJezSGDHKZTRNkjUDP",
		@"AxMxltFvTrKZVJuhC": @"HnbXJWubXfHtNQjsfRfoyMoxQOKoFllRvxInDdzmOrEdJdjCitALjGYEyHxhbvaNbtWYSswGpMuHWDOAhkkckiNwMQuRVOEvDCqoeM",
		@"sjLFRePrziuPKsg": @"btpDSBNuaGWntdNaenMpJCjNDkvupYhOfZuEAcPWFIuNZZelHXPqqiVbYsEFMhHltuPCYIOBakCtCctnXOsSDKoDJccJYTPyalXDQVMvZILmfJjTcrrHrn",
		@"kvJsadJPtpW": @"LRhVscwOHDgTQYXHTYAEJqEhRZgdmhjqzxaRMHsDXbJEWVlNwAEjhgYKsDZJJqCkIenAhizvyfiPXdAAyWsFWvojOcuiKtgWEmhpoAaXHdaXZQvogpxMkYAreNSgFwzltLdOt",
		@"AfBvIViQJBD": @"jZTkcUzyKUeHrDxzVQPeJMQazKVeCXOnnnMzErzaQukuxAcYYElXaOgWhuahQqciuIrHJnFcRLHiKrRROWeUkNBGPKhOdGPtskfLzXITcAjturhcwvMroKAtJkHoDIN",
		@"gSHozVawezQeHN": @"QIFcDjekTrbraNOmudDgLXVJZrrhFWNRvKpQWLUALckeoqMIImUtvacFYdRyhqpNMYjFMKyfwynFuFdyhudMisBivitdpqVHSiVBkNLpeOYFZDIHZyJSwQ",
		@"NfDlOvwnaxY": @"ULIgZNdRHWEEhQcAkkuwLDvvbvhKXZvlHvUXQDBUJjvOYmOxtqNffrEAnQPTDAttezIdOnAzYNyLzOuPWkMrpQXfKimFfGIcXsjOKYrPucoEsbdsOpcegUXZulsmdjWS",
		@"wwOJeSoFnPVZZxFrf": @"PwQSzEUfXExEIGRuDmdVGgCjHVgLCvEZkbdjlowUtfatPqYTyhNAkvpRfWoRqbwKeMNOxrtBwhkbnhqVySUopjGvxhZNveDhABHzOYAXJs",
		@"hspIoFlSHSwnOw": @"LjHTijwoIFamxBOiPfUTryfOBlBVDONUdrvqewibTxRoRppOZrbWSylmTHOuEFnSSUyJdGxSYWltsqNuHmXngBZxeyTpgsDnZmzAZqIQxDIGvNmaCZmcdqbQXFZBDLtNbrQGdDukAOWPK",
		@"qWKLdyEXkzQLTLj": @"TxtDwghdfqMIUJWQhhPpxOAdtgtceXpWlgASnKiHpiiOGpDcbYPUIGbgXSrXNAEfHEFJxyZAKuHNQwSGdvIEAocUZMroEBcwsuzwxzrZSo",
		@"pQvcWJkuesSTLsi": @"xdACHTxuQVNfzXECpANEvgfEqRiYvcdTfGyEKFMUCceBsyfSTuwpyGLreZxPmWELBVYkBNThPkJizyhQRQQZGbWwXVEPPacxyvPnmruchkCPxphbKhfDMCciyModlCmodzEBWkXjQsKUHMRzTLJY",
		@"dzvsHeOIMHes": @"TPhhmttxvvmvodSDvoOYRhXirCAPvTHAXliNlxytSBinKIEHWHllzpqdBWGYAXMGYAayZUYIAHTSvpWGZcJHinrJBKOzDdxHbcsmWetqIwxHHDbMFbGWWCJawIryNcMggHzDZbUuH",
		@"wLIWomoWODxGWQD": @"DdSpDmXhVgbMOhemJTsnQsNXLBMfSJzHVVzBLNwJyygswARfiXsXdrIpvzWekOLvGySlvHpfgbJLsFgxtOtVbHiMXZYyXrmtzLQnzUppWZWwrVXYXuBHISbFQsTonOiuOKENSBZEjHDqm",
		@"VxYsqmcpgraBocC": @"dSlJXJOwrpqjSVwJBCKjdJcVmNqRsOyLQAlTErtURDOjGRBBSJrNsTGQwieMSJyFEzXTZyhYZODpRUIQXOnuvbmKglzFvdsTqzvePWXsVDwKPiWSwEeCpKcWAjCBBTTLvTCAOgftxsPWbPoE",
	};
	return XOfJyusaTJgXjMns;
}

- (nonnull NSString *)mOmIDsHYChLyqfekiPA :(nonnull NSArray *)xYGTcFSnoZOelvpbegy {
	NSString *DwBQRHekBHDIbNnOb = @"cMPJnsOINCCRjMvWCeAbgdubbTTFBWCgDhloWwkolXGZXbjkRvuQXkWwJXUerSaTonakwEKOmsRdCmWjcmkJWaWKUgODwWBrxgkmBaNMfZJDFjPXmenbKkqncF";
	return DwBQRHekBHDIbNnOb;
}

- (nonnull UIImage *)JtiFbxntGVzXSASCnPs :(nonnull NSData *)OpTCVziHrOumhpkseP :(nonnull NSDictionary *)mJLqmtTuEDvPObsRul {
	NSData *SRQvDpfAtXB = [@"MDQgifDmvwAYVuXvJjnyuUOXOdOahfFHOWYWFoYxubqKEKymOnxZeUIhWzKhKjCzfLMhhwySgJudUmsihwDVlpucXufGaxmjgEtNvJcckeCHdyUjVdruwMulKPHsRjYxw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kbGJkgNuRviwxIVGG = [UIImage imageWithData:SRQvDpfAtXB];
	kbGJkgNuRviwxIVGG = [UIImage imageNamed:@"rNbNwAHjknHPQWJFgBzfavWFOmFjZIMDzTqxshtLbghJyHrOSutzHlPFGLdAuLRZqdULwXcwASqnyDlsaXmqcifhbiOVKscCGAonkVMFYhqbOyJMyWCjMp"];
	return kbGJkgNuRviwxIVGG;
}

+ (nonnull NSData *)GkQkpKFXeQwEEkI :(nonnull NSArray *)OcvlORftKOduP {
	NSData *yCpRiphnLtPpH = [@"JKPrqIOBOYmBoFjcYkZetQJOHjocajPJTAovsMmhSKTXmpkkZPfFoSaykcmMiXFJhElqzYystvtFBOzOvDaGTyKhGYyYjhIjFymJY" dataUsingEncoding:NSUTF8StringEncoding];
	return yCpRiphnLtPpH;
}

- (nonnull NSArray *)oVFzEuepbJLzymaOLT :(nonnull NSString *)KfnGbGxILPRw :(nonnull UIImage *)bAriPeQXbLRNYvJCwh :(nonnull NSArray *)nXnXmeVoXReYUDVgQq {
	NSArray *KxIgVrdBUzyjYtYv = @[
		@"jUMPKpboTEPEwtaqimSNKzUqArzjgKFXYfYDljnvybtsbXZHxOVoVrpoWsFgaKCVxGHcAMRYjgLQJaCOPIVacUfnkCPzZprgikLevXJmjYYwpVPEqwjSjAPNVQ",
		@"eCzVjMbUuDSVLUjfiVEbeuJXaLkRWwmCGqDRntGYHNOlxhyoTcNjVJrKVDEyVKXQlMICzTAqqBYFzloxTFuUYHKkFFJNJowRZKleEBatoAsYFzoIK",
		@"GMBuXqgEQfqGPwsFgzBzXCmEyCdKOgsJkhGUnzKAzGoHpxuSiXRjfqklCSRuOGatjcYuMpiEHyJViymizzdQapqEcJhTWAUAjabIltYVMKMUaQkzIcExSSYEPVFrGHeaVpspmyrosNCDSOqGabhae",
		@"GxeJZKNCtXCrSInrueZysoUURdWtUhExhOJAhUxUMkARMLbdIBhJwJxPAcxjBgcrbpoQGiBstOUHWZNtNXogFxHZWroOjAwbPdAgxeEtoqatKwAGTHxaqewTlFwwZNPcemOudoTbMdHB",
		@"yTWbCHOBtfQRQjBZcPfuVXojIWUgKqvLvUMXHkDuxDcDPopICvZCLPyMEPmjxInpfWnrZtZzrOEJrkqBjZdeUXADFjFhOILwiiQKSlPpDSJLQiLEpceZyQuWM",
		@"idLQGUvCpqONhdRHehZcokQoZQAsRUsOjHbWsOvqKAupylPUsbaCBNnBfgcThYRcSkgwfnloeLFRYJKRJcFIdgOdrODDKGoVFOVGHJnrnUgDxgqhnvgnwa",
		@"TbrRYarpeTwlhQgzuNPNeSZVOVDWtdHsPZBMKuXKOkJHIkfZIgnzPMEPEYFPEVdBqFUNbBMaPBDfhNGvttfrPIcQePeRdreMXdhycVUekrpygEuhGCFkLeTlJlKiJwajnHzbIpeBdFMyud",
		@"tMCyzkkKJQmGPDVCFwsEsRGveGOlvSPTPkCXFsmFWGaZsUKegQXHbuSFyIQGZQUyEUQsFjTZgDMYbiweIcKwAXAJpksqcQeCcOUXEMQ",
		@"hppysLacrmnkgmXCbbtCzqhsIHFpmHvwPUvpiGMyeOyrjOvaqbHkgVYxCxQvviHuKUcsFcXBFjjzuyAxPdlpzNiUiZdHfGJTJABPdEtrVuqFpYXqvLPFnSRCAhhrnLTOTyBLIwqvtMKdLJisX",
		@"bcxSIOZPNEuhxPvoPxdNgFwvNZjLtDKOwMVGFAAfCTrwddEKkSyTJVBepAHjtiTNIzaRAwdlAnUEUZrVYdGPdRrIZsyCusMeOGGrZMPQzkPBRSfByiSKFEGCOjguCwWhahXuTnwzZDlVD",
		@"mdOWMsGXzYnSZDBxhZknAGPtsVlLYNkmBnGPVhJcoleQvNDHdRgFFHUznAPUWwnYIleCJJbrlhYjdthmFtbzUhmnbqbnCxGPduuPEtgcHXCSqDsWiZoeKDStuqeCJTizQDfDUmTiXhdlWtsAyxA",
		@"hNpuUrAJNPwrTnLLkBqvxLZgdkKvuitQQtZkkKxvpEfFSPtDHOGeVkQArkusseniYslTOOjgukETdzPhyanQzMnpUSJytyyNGFTdIsdMqeNWbBoypM",
		@"mHjOaIMEPPIDSLKpNgOzysdFHjVGpwJewIEqUJOZejMLxbQyucdjvNWuLkKrSrXtoovmmNKhSaoCWfsYhCWVkSHaFPLorEdXlvekbcYdLTOPGKcZuTlOlqCYRYgjfJMZUQn",
	];
	return KxIgVrdBUzyjYtYv;
}

+ (nonnull NSData *)Vlkbiwokhx :(nonnull NSDictionary *)hHDvDjFFPzC {
	NSData *mvJSfyoWZTyb = [@"dhKNXENeMaqqSaobbKBjxMAPQTwmdSJXImqGFqgNupaeQvErrOwVuWkfJvwTrBQgkuBdjwnUZaevbXfjaIXUZzexGNOQMeGFiEWmBTohUOAvLLuSkLClyGHrGkGQIfTWkVNLGKMEZBaUaZTeZlq" dataUsingEncoding:NSUTF8StringEncoding];
	return mvJSfyoWZTyb;
}

+ (nonnull UIImage *)bWbUKOXsphCkFl :(nonnull NSArray *)fZzyZMIgxcZlhbwG {
	NSData *GXXQtvWtNGIhPdqg = [@"qEoCNhxwHVlptLiuaChaAIFevyZvZbAwgQNSfXpgxOGSMobnboJqXwbzLUGPJUOluGmgxJPEyFphBqaWQCqijUpouhUAkRzSvDPwItIpd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ntFIASDogmeQaYEZx = [UIImage imageWithData:GXXQtvWtNGIhPdqg];
	ntFIASDogmeQaYEZx = [UIImage imageNamed:@"gGuIWcMjeQHpHxxtDyonSApBePfJarAQhEXNwnLwWNHYbfJuXGUbcatWIFkjBsWnKeGjqEycSTsYlMiumeatZeiVbEisRXONprfpCplLuTIedcRdCGAAckgYQvUXQR"];
	return ntFIASDogmeQaYEZx;
}

+ (nonnull NSData *)fkJxlcYlUcVwOus :(nonnull UIImage *)XmFtJlSlCzpgXhz {
	NSData *IxaplaCiQhmONKKbWgg = [@"RtNKszXRiTRVrcQmidGBayQWvhGvPgmEEVPDgHiOSIHqBuqqkFXlfeGVYbEUJjBUwuuiBfQTgQeRyIwbBmNmPTgVxpAemJNhIqUNepIouECGzg" dataUsingEncoding:NSUTF8StringEncoding];
	return IxaplaCiQhmONKKbWgg;
}

- (nonnull UIImage *)IsYaDnlGaDRhkGq :(nonnull NSArray *)kOpHNpqspbrInysq {
	NSData *ISCMRPIfmPRFgc = [@"XXnpVtDrIWGlpRsGvGHYdYeMYISdnVErVMiNdzPtoZXMvjOzfqMTfHqELOrRmPnGTdSNySXMnmuGkFNEyQSndXDrdtzUPfryEeVGQoITjZfrVYTPQfoNzSYPpvzWGCxacESJfwNyIIpqS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZXhtLmBVBFJmnJnCB = [UIImage imageWithData:ISCMRPIfmPRFgc];
	ZXhtLmBVBFJmnJnCB = [UIImage imageNamed:@"RFKGepMoXPiIEVNZAQlKJTtSGGsHLqNEASngMFpbMpVLQNTxaMIWQYBwXJHjbFySwrfKUEDhgzqJnmIKFfFydxOSYogilSDYKZxDPsKxHhy"];
	return ZXhtLmBVBFJmnJnCB;
}

- (nonnull NSString *)cUKBVeOkYsXcZOKvC :(nonnull NSArray *)imXedTEoLL :(nonnull NSDictionary *)boDgEJCtzeoExGw :(nonnull UIImage *)MQglHtSJgE {
	NSString *YkhulKFljkQL = @"aZCxWayQygOFoyntBeYecsCOlwGtgSeJcZtjJPCIcxWCdeGKUbRarGZVoGxXUxgLgCTOkdWgtaHMoMZVGrvBZZkTTurKPTIdbxquFyqaHEspRLjMUqDHllixmvaMME";
	return YkhulKFljkQL;
}

+ (nonnull NSData *)DShYVEKiQOBhYxDzcTp :(nonnull NSDictionary *)CyYJgEJDWwuV :(nonnull UIImage *)vqsnxDIFEZAw :(nonnull NSString *)MypPqgOBjG {
	NSData *QfLAPwUmTkAnfFNPY = [@"zNuzAuCMWfTdteMgXhKreuIHdCTxrPsnVkPvgFJXbuqwvIpCGzaPbOjADZIVcYyAphnTQtWtqxGdxVrdnASawyumRhbULTVKtNXeLtsJSDwbzEyoLxbfn" dataUsingEncoding:NSUTF8StringEncoding];
	return QfLAPwUmTkAnfFNPY;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失

    if (indexPath.row == 0) {
        FeedbackController *vc = [[FeedbackController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        AboutController *vc = [[AboutController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        SetUpController *vc = [[SetUpController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

- (void) registButtonClick
{
    
    RegitstController *vc = [[RegitstController alloc] init];
    vc.firstViewControllerDelegate = self;
    [self presentViewController:[[MainNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

@end
