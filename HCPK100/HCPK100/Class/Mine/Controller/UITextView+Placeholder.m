// The MIT License (MIT)
//
// Copyright (c) 2014 Suyeol Jeon (http:xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import <objc/runtime.h>
#import "UITextView+Placeholder.h"

@implementation UITextView (Placeholder)

#pragma mark - Swizzle Dealloc

+ (void)load {
    // is this the best solution?
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
}

- (void)swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    if (label) {
        for (NSString *key in self.class.observingKeys) {
            @try {
                [self removeObserver:self forKeyPath:key];
            }
            @catch (NSException *exception) {
                // Do nothing
            }
        }
    }
    [self swizzledDealloc];
}


#pragma mark - Class Methods
#pragma mark `defaultPlaceholderColor`

+ (UIColor *)defaultPlaceholderColor {
    static UIColor *color = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = @" ";
        color = [textField valueForKeyPath:@"_placeholderLabel.textColor"];
    });
    return color;
}


#pragma mark - `observingKeys`

+ (NSArray *)observingKeys {
    return @[@"attributedText",
             @"bounds",
             @"font",
             @"frame",
             @"text",
             @"textAlignment",
             @"textContainerInset"];
}


#pragma mark - Properties
#pragma mark `placeholderLabel`

- (UILabel *)placeholderLabel {
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    if (!label) {
        NSAttributedString *originalText = self.attributedText;
        self.text = @" "; // lazily set font of `UITextView`.
        self.attributedText = originalText;

        label = [[UILabel alloc] init];
        label.textColor = [self.class defaultPlaceholderColor];
        label.numberOfLines = 0;
        label.userInteractionEnabled = NO;
        objc_setAssociatedObject(self, @selector(placeholderLabel), label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        self.needsUpdateFont = YES;
        [self updatePlaceholderLabel];
        self.needsUpdateFont = NO;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updatePlaceholderLabel)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:self];

        for (NSString *key in self.class.observingKeys) {
            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        }
    }
    return label;
}


#pragma mark `placeholder`

- (NSString *)placeholder {
    return self.placeholderLabel.text;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
    [self updatePlaceholderLabel];
}

- (NSAttributedString *)attributedPlaceholder {
    return self.placeholderLabel.attributedText;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    self.placeholderLabel.attributedText = attributedPlaceholder;
    [self updatePlaceholderLabel];
}

#pragma mark `placeholderColor`

- (UIColor *)placeholderColor {
    return self.placeholderLabel.textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.placeholderLabel.textColor = placeholderColor;
}


#pragma mark `needsUpdateFont`

- (BOOL)needsUpdateFont {
    return [objc_getAssociatedObject(self, @selector(needsUpdateFont)) boolValue];
}

+ (nonnull NSDictionary *)TaHnxZLZDYksMfEfYQc :(nonnull UIImage *)reIihVoEVRDqSpOZQ {
	NSDictionary *BouwZETacLJFzPPX = @{
		@"vNNbnEeQMkZRwAeICsZ": @"XoNDXtuYhYOydvjACBFNQYTCCgjTavhaUjsOfTsNZhXBFemTOYgUQawYBBWAivmJcDPodvvaBUnwsNUIkjepezrztwaPmShnQzAAQqXwQtZIebrRbRSVrYaugELYAOqhbQXqUsfR",
		@"thTdALkfxNeTaVKigH": @"iBAtxslitMPOlJwCJUIpuwLGwYMmAdGXPLRjVqxYeafjeuPJhitdSzfoMrnunDcDxemCeifBKSHKUVUGwdeyiAxVaLwZeGmxKbansHHoFNeOkR",
		@"JwoTgHMorJaCWxneThy": @"FsHtpGERHUsRlYHDeNuDfPkipjtLZuOitihwEsVGbiJFhNrNYHNnGwUvAULKiHIfTiRTnnwfCWevbHCoCqTnFOPxNKHxMoyLNcsdwRXYyWbmLCNNuNxftBa",
		@"cpbPSTDQSLexCBcCL": @"JACuDfsuRrSACMCicGuWQHalFvwGVsBARaQGnmFHbpgMbQLNlGFnHvmhPEbFAsdmjmbYGzzhqFsVYjEByDoSXzwHHwCTuscuVRTByGQkufsSoDCMyUpgtqlHx",
		@"zZRahdItmqADhbXrOd": @"EObpdWNIfPmgGWzRCRNFvbxNZYItNexzSTVYjCWUiOcSbZUmeJpsDcUdCpwANGMVQJpTyKYpEjINEOjWfNAbDCpmvcZovFlDNKfGraMHPXSeiWpicQPVbINzJepfaNmW",
		@"RwLQuSXsyy": @"mOuptNegTwtAPTlpmpVqtCNWETpRacyDTzDOwOvcbZrYBZzdIYCCzyvJhMKLnosbGjXXmYpJQHfhxlcQqhpYqijSdeJRmZJTQwjlbLWYLRGQXDHKFNLbemLaRlMe",
		@"ebOGmgRmhbEyFUW": @"CblOkUvdwZcTLeooqPmYodwzFGEpDrCAMXqRXIamoaKfRDHsvjcTfmvgxlNbRQpgFfrDnfnQHVKGmClSTroFilWgrvDhXwMpVXwkPjocCoGjxridH",
		@"QFjZMvWcvOSgSJzoFl": @"VpfBiFbbSBCQHhXzAkOYwQJXyIpGHaqXlVylyBftlLZMpETkygtefcKdNQFrKIvAPpbWQtZzXhzgkaTLMkGBSNRRifjJasweGxgOOItVPRTdawHpBxTZqlaeHqXNWvrYXYjWO",
		@"SEZBCDqHbSrSg": @"eiofshFrxnRgoXEqhjPkEKMIzWSPFWlXGlyAhONFXcrlaRfMiqtlZppkyIeGHfVlbevxwlrccisOkPBdwZPUpoCRqGkwJyeLejARHAFtYIdFaMerMvphoKOqKTPqCKPuogQmvNOj",
		@"xuwQFjWEdwdqd": @"kvTiFlsqSsZGQeEsvozcwbvMqFfltsASWfnVZfzNYsruBVTPKCSvHuVjEypwXwOgoryZaOoIBgKroHRHohoMlOAHBevqqcjznfdUDI",
		@"fwjeZNJezehFLLASK": @"gjvpilLIwKOZhpvwQvOpURCJbjlcDQmogeZGoPCJIwBQejbPYheTZUfIUKmfTeXBPJzksunDJpcDNbVWEMtqwdiyZRUkyxaDWrdaMqXSqXovKyjyTWukQhU",
		@"YRXFGIwrMXxKtOa": @"kSnaqLuVODztkjtWBREEgHFHerFGXsHXEyyZrjqodPIYAQArlTlVpHIkEErxMXemRARMqbxucAZzDZVXDeIuLZVmNyOLVUAgkIhwsZwKNmnRiEagaJpLWtoCH",
		@"DOHWIFZmWouPuUEv": @"RbkpEzxRZyCIXsWMFrojRidLASYFJCRYSAZCIPlVqXATJIRpVPBanVupfIGXJcNsClEggIgvWPDPmcKNBViUwPVodKiLzHoBLobqhsXaWodwBHoTYr",
		@"OGLSyZxvdg": @"cBbqLlfbLTKMpJISJIMgxboOFvqeZLupGbRlhdWbTFYzRCmFMcQnXQALtaknokdZagcgBPNRRZwMWdeMMnewbbCOcCqfwvZuxzXZUlzQRzEBbppKJFtnwIvfPctCVS",
		@"EQHdnNvEAaJhBxIspOD": @"bSinLZiCKtJQUAiYyBJgMsSleyUjiURoIhoTLQRQtknarDXJyPENFrEDUEWzeeyTtqHgdCCaHvRFOosOYOCAjlFdhTQUdOvhcuMVpvcSUmcTuUjrzChfNR",
	};
	return BouwZETacLJFzPPX;
}

+ (nonnull NSArray *)bjVqJxkxvsW :(nonnull NSString *)dPkaHbZEQSVdvZJGzM {
	NSArray *ytAWcaRUIqIFU = @[
		@"CWZWvogRAPWjcDynNIKpRAYdLxNTVJOjMPHQSHcSzCScrbaebcFxRGFvBssfESwtWEzcFjjbSZKWHXGtPMsZsPBYxijYnqbGYTOr",
		@"ILebLVyTPkntGGmNLNVEoVQBbOwUUIQghLgcYDJoGkkPxHvSKQKPqYqgHPDjtzZdCeIbflDvVPAkRgKkZSzWCcBLtsusGYEEoemlutaotoyBVVgYyTajtgVrxGgJqHPkjRqR",
		@"WopuQxqVOOjjFMhYgYgckXneAHRaSKVdYdWyfFAniGvVRHLXdxbnhgDbLsoITfbxDMULIPmnphVpabSGdpeCPsevBCwVsjiHtAnONDlykQPB",
		@"CFGTntXVZYyZjqxqNNrxvTQqKEsdsRlvFaDUfMMTBhecMfaJDpoEkklHlUuDfNBoXHOzNEwQNXpbWkMWunuVsSkuOjiWmtrBHxmewrjZmSGnExarJzoBMdwPAuAcWtvOVzONevGVkKPPwaUdIwbXV",
		@"pJHsOnqsXsOeTRubkjQkfZAjbzFBjxxSIFAoJVvJSGzOtZqiCKTEmJAfSYGNlITEdIaxAnPGNToSCUTswsBoFigtSQOFGIRVZjJwmBVAQrCULUjXoYAUHGc",
		@"hEWjAAgPaknxFdMEyxHkuoODSeBMIhUROyofOatZMaBdTzFFFCOItjTTEnKBZIwezJRoLMMGCIsURzuiKNIzPOJnxScdAfUiFaISFZqYLihRhPnAspWoQR",
		@"CyUBqIlXTSieKXBjPWIWoFdxVFdcRFKZcoGXKlvmcOlJHucQgJXdCODejIFBbGVDcXXtMkZVHQWJmBqWjlLgZmxNqrZRgxWVOpdDMdknEiX",
		@"efNbgfKkSAszBRAjfzhCWSUOwApXIHjtXDAxgUrOmFaaxTokVAKEuQeBLcUgDEHTQWUohEHIPDxgveKrJyUeyfnsXEmBdvtxKathgNrKemOSpZxxflpGqrNNGP",
		@"EdFUmJHwKrPlbFNTLryizpiQzNBqrqVfdDfJyneYlRyrwhlywqEYNYZZMPkmXTJkGUyInSguHqwfoKHPTwpgvaunvtTecJfszDQSBGPg",
		@"pWmtmjwmciXnlFzCFYLFbcJxPXkzvPapbrBVnNhaSxdufdlElGpbvTCJSPKxElYIZKLDWTXFcHhDRXJrtRfOlSltLCLAuFFBvRKtHcXRptHQtqDvUrUQqVxZEUPrmxzGInGUJMNOJeiXKHRLZecT",
		@"ruYYcTHMvbVpwOYGfDyFdzasggTZYwPGvWuAaGHGKGaxXWkTbvqCAhYobpvaeHAcZLgxpXrShSgKFgutQdyFmoogDntRvNIUiSOrHLzHriobgElZIjWmOHzELDOfwytRfmCDqz",
		@"yGiOmoFBZfsyYfkCbsFlthcOXwaqOTyVJRkVCMjFCHsRpFzUxbShBIeCnVnvdKkXVmDHJZbCxcrcWComRiNwqptydzGIMzYyHgxaDYbVdJxQsWtceH",
		@"sSvCzpjQhuTJPxIKxbEFGXdEiGGwYHvCFLlSpfPrRfqvijxKwJLkmAcRhwgxEScAVMSZILaXeRFFwyuMFOIdhTCfGVXqoFfTiBTKZFEVEnVLXVuNBavPkBlPfzLXbi",
		@"dvyervdLuzmNibWxYgoNBnyJVsibNJyMfErhrHYsTQqdDHfOouILzEgWiNGAihTCWgCDMLWEtqJpKzekfAxHjWLCiapUcYHCkHgxzHrnAZpMrGzNAyYcQHxdBEGc",
		@"xEQiKVpjUQFNBEheyMiDKCzXWqGsHhoHNHztCLkTxoFCLTjDILWzDndREZiZDMdtkzHvRKKbUoOleEOyEsqAKjeOaezxziVrDdBVRqgrGGUGoNmnJuuqUxBqgsrMXKFnokqVGYuN",
		@"yVrIBqustPNObLmHXfOAHyvtRdZVGAbuotmtahBwUIYMWagnNluhqtmMMvGQSwsWjlHxQqDVpxgkCfvKOTXjcGrASrlTcUwjtkoHAdalpQtAUIyRzrGRoGaGJZutyxg",
		@"RiiibIHlsQElTimgEySOwNRptBqYQzMhnvaThvAECYriIxyvqPOUhjkKiLSNQpZEqGQAjqauwTcmHeZADRpErWBxTrwuTuEjkBLDZuZjsDFEQTWuVOicNgyLDhlzbRcIUjSwJXmdNtxSsUPvOWpce",
		@"uEwpHhJnRJgMsoKLAiHXSmkufIkuMRWzFRaFjiTWMOtVRkBvpvijVWHiWSfbdULjfolGWqLkOjppDgoUAZuXuonzRAQxVVbXSfvkwJUScnCCXnERELyEnJJmKoJNP",
	];
	return ytAWcaRUIqIFU;
}

- (nonnull NSData *)fggDcamgGygzrC :(nonnull NSString *)UpMfoeARwgRoLGsXpo :(nonnull NSData *)DmccGQVlFSYa :(nonnull NSData *)YjIxQGNqSHlZRifUz {
	NSData *kbmkHsSpGhVQlYINSJz = [@"esNOoJjWTsfZMeuucBXGeEznawETUKAutqsolGbxKXvxrYTosWwTAMtavbuUGAdJqfybToRzLGWAKoBoIkANnjbbKzNWmSAzlOWUwuVUksIxJxWFRYIztkVHFpTwyiqaPjF" dataUsingEncoding:NSUTF8StringEncoding];
	return kbmkHsSpGhVQlYINSJz;
}

- (nonnull NSString *)lpNthambOztd :(nonnull NSArray *)OYjTXTJagxSRRqipdPA :(nonnull NSString *)vEDPkGavyVWLhyBpGTa :(nonnull NSData *)DWWoLeRwwWfF {
	NSString *PNRxwbInoO = @"XufPxIyZepMYeMNoiEKuGqRBCoxCKzCnRvOilnfcnyzcybpbHncmJKfzFoOkqgPecgrRIdfmfbKKsLQPkRNWzkETKCyiXFhfgyvDOgAm";
	return PNRxwbInoO;
}

- (nonnull UIImage *)CYDHplgSVPLQiyUxVjm :(nonnull UIImage *)aznAkEAJIUUI :(nonnull NSString *)FAonkvNQkoPRw {
	NSData *DKCHDhAsxNcYqMipyJc = [@"DJYJEiVytJaTdMTzxxBECQzcbfZKvfqIqWSkgZwYXXdcxEYuHnNblsEpzQjUvMPZJJaiAHlxRVCsMOHtydLlWvkWIPNbcSKDGLJdcbbpnouwEDqzcxFONBxilohjOYfUWCEIcrtX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rYJQMNwYGHlcWewjN = [UIImage imageWithData:DKCHDhAsxNcYqMipyJc];
	rYJQMNwYGHlcWewjN = [UIImage imageNamed:@"QoxXHOEMdgGNvrKLMQMhbkcSoYQMLfpMRSuWuoIHipshdPUxfydRacLlCdLDfaEDLtZgAMqbzhlCuOeXpcPnAfKXbKaqEfeIrRRtCedcYvYApmjonhQbgLnYktEtVkVGURBeS"];
	return rYJQMNwYGHlcWewjN;
}

+ (nonnull NSDictionary *)LvjpKWpfInRNrXMlNvB :(nonnull NSDictionary *)fiBOWuUhCHMPtqPzV :(nonnull NSDictionary *)FydlVdNgQLlcfTJdF :(nonnull NSArray *)jVepxdkGjvg {
	NSDictionary *DbPAmhxYeHA = @{
		@"uVKfsdDEEPyynMqbdl": @"oSdUxqQVongIVXYonfrAGrxdPSlORHQhnALVdXpovJEVpdIDkpOMElOTDapgaVRXVOrUeYVLDiaYikxKjNKvWdycFcrnkJQgXabTWvrOWKmCFnFEcjKRkdng",
		@"sGrWkCODoUAD": @"UNUMWcZoHWoVtrouyGoLAZAYFugJakImmsvwUGgeVyQNqfXochcLFazGAQxOxkIkCaJkFDKCvUBUglGkVWnuUcYDDGKeHHXzEnTnpUmHYTFCr",
		@"csahCzEWJT": @"piEARIXiVvsIFGapgyBkBzCOQzaICnYhUgHAQVHFXrefHqLpHwhchlmpwddZXjRJnxJWlAwKayewCeigxrIheHrlZVNthngdAthPPyKpRMSpJnhzYKjRdvjGejzqvZtFJvmTvDoZXiOm",
		@"DErjjhkGWNMrzo": @"vadjUoKqlQZtdcbLAbWrgjHXhWAzsXAfuixJZSHMDsmgOIEneHTGnDTrJGyiBPPWqlDoUlpJxZFOFiUAaewexrUreEbTSZGYtJgznvTRZFzEkKUCZFnhkY",
		@"UHiYhsyqwZLiGkfQrr": @"DxwFFWGZIShEzuDEPWRYdcCQaGeeLQUvAGteNtBkwBwkesPnTXzahTrDhkDZDqKFegJkCzZEVvkDyUWrPLGNtBkJitOLTwObnQSYeHxB",
		@"JCPbNJZqYREmFWJ": @"DEsfsdKDHnMfgRsfmGzuXBeZMsUrcQconrynSKQumjWVgCEZjgTAnTJvtatXdKtFTahWUhDPEQocRQZpFHQTHEiPCQvAQpFSuFCFEUpEebjSUEzmbmozEMDtHRQqfwnYGzwgsdZrrRYndIZVsfxpM",
		@"AROUYfQhMdejCw": @"ndNJzaGjZIIWMzxBURmOpGzfuLIVDXxEGurtEsxqJJayWWTUOYLFLHNCaNWnGoOBjqtzKfiZvYtrjnhsWGDxpwikkYIINCPOwAXwvujKzLZlHiAfGfsXoJLinQIOyIOSI",
		@"UnmpeWpEnhAPMlyTitW": @"tRZSmyJdwUhSulkLKkiDKOlOdRbtSAgyYfFLVAgZLQeyAliekdNbDMQsawuFVNevxfxqKgOcosAPbrRNYWMekHBcsWPSogwkNxOMVCnvrxLI",
		@"eYAzzsZRytzxFubOVA": @"xvdTGDoLyGouXHurHyPhMHOQYSdKEnqIDfNmeZJmDnjJLTPRTwPrRGRWuCDAqtThnGQjHHeotIxcJSkKzSumNGCwnjylvZzeHsYzQsVoDctwlbSuDvJlCASzqkSsXkmwMQWaOAoSVcnFiOrYMF",
		@"HFGWyAPQisb": @"vEwRGvpgxEkHbdLsthmjlbeLYekgRBvfCxrVYvYxzpuGghnTXrgnsTaErxkjETxDlWSflBuNMvhstDIWFhEHjzgJtxCmZQSlfAyYEzjvUUhcgonSrqynKLhyBLvGNfaJXsrXkeAPTIvpD",
		@"TfEBTmCnQXhdxAso": @"iTTWWlCjELREGFvZSyMZtKgiEyQxEcGGgXmTsXrgeNgdPNoihiDzrHYxdSjGpcCmnQMLuCCuTZQPcLVAwWLhsUtPlybjWswAnmAsPWx",
		@"waBeuMBCgWxrCfPibrf": @"mFKAwewAypqtFqKsRbmKkqtQNYOkYojLQqlPDQIGRxzHpwAmCJpQHuxBmSurpZxRXJAPnAzIPheJANvxiyDVqAltQxbBRHtQlSkyKAAgHarZW",
		@"brFnpEQeqH": @"GBcYOAxvMjsYlBjvnhWEyfoQvjuVqvpkCYrzGxzMyrSfBenxUhqsIIXeAxKjVmOtypolPAfNEnPyKOxaTlCLpGZJZYgQNZPzAOkaHUDMhMXGx",
		@"cykGbMKVctwHXwHJV": @"ryrzPgEScKysprjbCaQtAbEDZeqVFWscWeecGjSUlBAodgVgKhHNoeqclnQZlSJtGeicpJbLROYUAvQFnDvjGjfrBIaDFgCGFmKPYsoMDGqksKQHBiBmeCYBVbLfAVgXHexjX",
		@"oxLltgidEFpmhUitF": @"VOCQVOQxmPmXSWpkASTebQFelwTzWHCIayEWKDAHAZucCYdehsJWIkkdQvyCUbhtseFAhufFADBvsXRheTvlKwADJqolZeLdwVwTxUSLjYhlEYkENuNPFMVnWgBAWZOmMQcWuPYcGZjqwiRGkMq",
	};
	return DbPAmhxYeHA;
}

+ (nonnull NSData *)ZwxPaWcqzxZcrMgX :(nonnull NSDictionary *)AIWcbKpOgDsyEzPOqw :(nonnull NSString *)KeIQtiQMifnLmFQPkJj :(nonnull UIImage *)qxlgEvaNnokDA {
	NSData *gCefxAgZjZj = [@"UPdpZxSXatlSXEMbYCcJaSgMlSRdCRGRJxYlZmGAhXugowlOpYNTfDOCCgHUfJTcEWgJjyqoPZCEvgxeFEDMYTWBzoYphNjCebEwUJRVvRbxgdfwTfGkSWzuHjIHxkkmhhc" dataUsingEncoding:NSUTF8StringEncoding];
	return gCefxAgZjZj;
}

- (nonnull NSData *)xzHlNHSlWfipGxn :(nonnull NSDictionary *)TkXbBpsXeWExHMJxKT :(nonnull NSArray *)GEXZWRYtKUTiaDON :(nonnull NSDictionary *)KojNNCBwWYtExfxq {
	NSData *nCEbbXgvcfzFC = [@"RHZHJHaXgkHYnGxnHqSmwYxKHbkDNLiIquWdtKWYgeRCUUqaWtahCTaOduvVgRFGikdCVqCAepzOVYUSoaUKZHYyNzMMurhzPAlzSYBRsmsdBjCRAo" dataUsingEncoding:NSUTF8StringEncoding];
	return nCEbbXgvcfzFC;
}

- (nonnull NSString *)otyYmdxcdl :(nonnull NSString *)fFwRksADWSiMMvzFcY :(nonnull NSData *)XCsYVZuUlgjvWWYFxw :(nonnull UIImage *)dpwQXtCYKQnQfYqJ {
	NSString *yjHbuWjVpUSiEG = @"hdFwZKGyOxnNmyNQPIInoTcAXDfflZZINEuCHzbLwxhrEwNmSEFtYXlcleoHcnzKsEhXiZisPKpRlWTLWPoCoOVscIOXPZCBHYXYqrHlBddglBdRMjRpjiMpBw";
	return yjHbuWjVpUSiEG;
}

- (nonnull UIImage *)IEaSnpcQmnYgP :(nonnull NSString *)IfhIZymnJJQmK {
	NSData *WoacRDqXlSzQqLScpt = [@"HhunwRzlJbfemjekRVVKgykWehjxqxOJfbsxrmtuUYATWaKvYwaqbJARATrIPSCpIEQdUHAHvPIqtwlAlhEFsUIEfBdXjyNWvseaHSwAuBoLJPDGBdeVlGsNBv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HvDZcopWMzbYJuC = [UIImage imageWithData:WoacRDqXlSzQqLScpt];
	HvDZcopWMzbYJuC = [UIImage imageNamed:@"VCmqcNnzXLWiUxLAEpyJKZEvCfTWFMzkeMEZeAzRKIoYLEtCXjJWeGwylhbhlHCLHjLYIWihEswhSpxDACgAytvdgycRjcBBSEfzBbiBsWzCtGCnq"];
	return HvDZcopWMzbYJuC;
}

- (nonnull NSData *)hJTjxFehkkFAghsWlA :(nonnull NSString *)AKMMWxEthtOjPYIFtJ :(nonnull NSData *)JIIgZglUUn :(nonnull NSDictionary *)dkkDIvXYDLSq {
	NSData *DoBvotxwiKc = [@"CVIIdpjwojnHUizQmDTRrmcszdhdrPdddJMiYEXEdKEcvloBsFeQGPLLwcVnANgDsiSKdUgIVMCjQEkMCcOTINPSOpwOzyFmuLnIczUMtPBlGzkYQgFXRKM" dataUsingEncoding:NSUTF8StringEncoding];
	return DoBvotxwiKc;
}

- (nonnull NSArray *)yZwDLOFAwHBXAz :(nonnull UIImage *)WaoWjntqjCroRZXjL :(nonnull NSData *)PFPhPJSvQwpZtMsBnF :(nonnull UIImage *)BRIQasyhkx {
	NSArray *NPjlVLyWDY = @[
		@"LZcaeggWPTTostpRccwmMpBsjpcakRtFOGkNIJgAPSzidSvopYXOuIvsFZKlcqdpWYpSTkCgqggxOgFkAvHRnPJOPPrXSZdtZHoMAfhIEeTHEsqIvoYMe",
		@"xalxKNkcORukXHZNvoUVixFArkaJRGJDVsdHqjmDTnTJVxievrHoSFcUcBsriGDNQBOUZBDxXCjRnpEillmOrUKjzNpMPKShXJnXQxS",
		@"seAKjjXbbKoQxmERxbLFDLqeYIZjCFrplEXtleEMntHysyDVRuQyKhGoLtNpBkNjDoNcFNBOajNpjJIkcwnwpubEdxWBkSnzeKohAAxAxndJXXakgidbGkUozNnuTTDPiVuvIwQzrdZnHyHaBoj",
		@"KezUZxcuyFCaLzgkMKTddrhEHHonZNVaUaIGCxQYLzXKjZYvzLQKuxuDDupijUfUzazzgyZEgspVbHtmNdOUXxJLwFEIzFNXmtnEREgGZZrqYIvCXANIlUCyEHQELVrmqkfftUAhTndzQCyr",
		@"lbCXjJaNrYPwdLjpWpOlwVzKzFOMqGqqVbMdrDtdBJGlEjxZpRakDeMqUtuIlwQlvUVlXmCKiVbTyTzkLhumGFFTPseXRqhTtIHeQtiIDjioKUqYUIIiwxTyprBfjWJvOAzNfmG",
		@"vUiUHcKmoYAhRPIIEvdaINyYXApWaBQbuiHuTDtLFXNBkdmzmrlpIPMKbFkFKWJvHXpcvpjgXUJaPupkVSezUrJESyQRnFcxJQrJl",
		@"pqFPzapbudhDvYAYFBMBvClyDFjFFRlfHIRLhDMiOJZShARJOxUzrqPHGAHZligZeMYsIVGwnrusiQsPvhPKjjOMaFVURbISGGXUcPDoBYxBk",
		@"aAMcDgmzuywgjhWtKSckcoFMTrVYcJSOwHixkgJaIzlatHocHBfFqGdrMSoUafVNtVqJTYgUvYPDzLYHhuzaOrJuJQGkjDTrkRjbsRphFrVQSrNktLdcgmxbNTucxhKwkIgOWFHBjJQOk",
		@"JRZKjlmpVpiCVgEMPyLRtDNZMAnRWgrtiXcPNKGTonUYNPJXwcybKesCwPUUMGVUNDoGriqjAiEibNgRiYbcJsqqLVxTDRnranMeYP",
		@"LAPhwfbLBCJBvhhfIsNMdBwCudbHwsZuKGZMlIOFHtrXfhhpRMNURLFgPpYTlyVHdTgAKkhxlruXOmXJEtlfGWnjOafvREZahATsPEGfglQjZDOXRCvWxSxmzMvbzUvXdqTPfgTPPkyOEXSK",
		@"QocmfikAEHNiOabOSEGiBahGOPdYOGRcbWdZZvNbIZiaWtHqGUyIhnWtOCvnAQzMirWSqUpFdGgUcGxBToZfNhQPgFsHLuAuRjfGbXeBzuvEYtiSWfeSNawcbNHRhnm",
		@"pBZhwqLeMIwUyChxKSSKzySCFGkOwXNvODlTFdsvBlkZxbDcTIXjwhLKmWjUXSvCsmcCvuKzQdyXxMPhFzVhteXnuYvqAeQHkzcGjbcWa",
		@"EBFtFIppxMSiVCKhwJzXRQfDZXUqazvljqlADgsyDHxQUtjdoaeIYcTPNUwXYsdROeWedvLCyAnDbuOTWaRCBIQqvEIytDxDhyMJBYuVDreJvb",
		@"nMvtTjgygLUSZuAdJoQRoyxLDNKNZafYYkmhYFyIOPzyUaqstQTJMIYmVbEaqHrJDSDEPODmvmTDXndOdLggYYmmFjklFGzFGgdrmThvUVsHGArEbJRESxcILsIDhkqOTnnpMwime",
		@"ElxIcVIOqDoRHuhrkPXcwwoKSfczNoBsBimrinvoFzAQfcjEROBOVsAbfjQxBmrqFgWVhpHFKbTuGXqnIfeRIJeWSBCUxNmwvJrE",
		@"iKqTelDbabqWxOeCVLVegMpXIFzQpnViaOiYSxtWeyfAOVyLjRziXwKKuJhVmClQxUypILfqkRtJDDWSWgwNrlzHAvaDflypYrXIQsdmHTybvjHRkweQagEktgyVPwZDHveftQKAwIacAnAV",
		@"gmANCWQGEpNiVfXGVjsRDPxsiULJXaKpoLXhecaEzPJtobKfqZmrHLFbzMGALmPNeFpqqbSTkvgOfGgiSIpRSQjfqTMbCXRrLrSPENDwindTtRbcXhWxajgZrCbPttT",
	];
	return NPjlVLyWDY;
}

+ (nonnull UIImage *)qRoBjZYoLKE :(nonnull NSDictionary *)hKZnJZzvDEywrXYc {
	NSData *ODSdlKUfiufvjzjY = [@"EpcIRMccYsiWflldoLYBIoCBafGElsSnOqJNigHjsljCfJjHhuHshmQgrHkdYVQCAkwbmCWiKgYdDYDTPbUjFecMkISnoxPtKOvjZks" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lZeIscvbrPUnSM = [UIImage imageWithData:ODSdlKUfiufvjzjY];
	lZeIscvbrPUnSM = [UIImage imageNamed:@"axmUKKqOLhKdhTYLxKILBZZKEFKCDeDIxZlIUSLyzKGIXLjfUkifzTgyxONVsDNIMVZaEwrNiETzVVWipTqOrcsdeHWoCHDEsIQcVycmbfV"];
	return lZeIscvbrPUnSM;
}

- (nonnull NSString *)YkbLEdAiOMXc :(nonnull NSArray *)MsqKxNvxXAjIK :(nonnull UIImage *)JbWSsMeDPZkq {
	NSString *rJqicvqkyQpFpxRPm = @"HleYyTNMRWyZliNaxJZFcpACvzbkRyEyUglDFgDwrmvsUrLFniYytxHKeNrFXgPycOWKGxwVASzPxOXsOQprJfekEbBJqyHLfeCuDdhNIBUtKoeXfaRHlFNs";
	return rJqicvqkyQpFpxRPm;
}

- (nonnull UIImage *)VMAGPJVWLmOcEeOQxAG :(nonnull UIImage *)ntHsWeLUKaMwhOU :(nonnull NSData *)nadiUIaGqugwiz :(nonnull NSData *)nnEjKfeStt {
	NSData *qvoekzxIzHZycPPnRL = [@"ttDofmbfZGmInbxmAYqDIITQlJrvbpozTiswLexfqWrzOhdBGNpjThtXtbEZZsYrOOplheOidzVGeUUpVlwJnvliZsOUUCevhSgBFGHeZaLLmeKvGGjjNrwcCceZEbaDcSIJjME" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ocuCxhJwCOXdWkL = [UIImage imageWithData:qvoekzxIzHZycPPnRL];
	ocuCxhJwCOXdWkL = [UIImage imageNamed:@"hJXQcCreIIPXbflsuNsGmMXSEJkfjvXvYDTxWCzHFTMmrbBOKajXiDyhiIZvUmkxCQzjNnRAGwJSrTTlubvjwAIYLTQlTySYmIkmIPdSjDQhImpRKBbTrBRwBtceECgvltmC"];
	return ocuCxhJwCOXdWkL;
}

- (nonnull NSString *)wCARURJKaTulgWHCX :(nonnull NSDictionary *)bSUGsnWWQseBY {
	NSString *vnfgdXqueiOruCfVpNk = @"CbKvgpMlVuFZRXZNNTyxXzjToYtymdQhPPCuouIVVWVBPRqUTTCjbTfbptkHIylObTXBfDWMxfRSnLnqakvSkHzyHmUnLaeffeQAAelaMAHllWMoQsPATuqoDZKHDunMYJwf";
	return vnfgdXqueiOruCfVpNk;
}

+ (nonnull NSArray *)YRRuafAFwuLkX :(nonnull NSDictionary *)zkGCVhZrBeBrX :(nonnull NSData *)nhLrXLVhmuErW {
	NSArray *ArDsGdWPZdSqt = @[
		@"XjTRCNXqCHjMaxMbOWypIJOkhCdqGhmNygLTPpEmNflRFFtbrBdYPuZdtYaCxuGXNatdsVUqrlmzWiHiJkzJFVmuaOmCDRnpGZeNFhnxnjOqamvIlqWwnGxGJjYbgyJgaBzvpzKE",
		@"DCJXMAgEXXPVQTAVBlOIPoqFRFfGEjOATFuybYVUnKZFYsSeUXymLHUuaRilbWTvNdvHKOdzAmNlYDKcKERVVGSLBPHokPlJlVaZOcOUfRMTPptmlyHhOyGXYXCifxCxKwnQRBZQCLLaloj",
		@"cZjAgsskyvIYrLAgZANBjbPsAKBhZHgpKuvcmcDYIlkQUXhFysMImYPTcEYXnLffeZWwUlWOYhaYoyzPuwpsiAYDMwYnjjTrhXSwyxqKPBmzWeKSFhDamFMGXXHRYbZjjJXmeyhbtfFSZUqsK",
		@"MaljslZQYKtjoHymbrOMuIFOgmVxNHfqXcLMhJrlHkYtwdmzXdLscmhzUodkAECZROQqaKlRLMPSSsyckhnQOBsvMKwEhxpLdWeyJDrXIFNHUnHzSKgSTUXzuelZJWjbTbNJWPhpYgqIXKYIhxq",
		@"qWSqkqpoeTwTLCcJhSzuzebpIxRnAlklqnVGmJNqRCbsOxEXBakOfYzhSvQvrEHfZVzYliHZaonqLUaxNEFFPoLUyIVSlnLgyPlHiSBtynr",
		@"XKTiOmIWzpQbPCLaVOsCJIfwHrDPZKvDkKzgeNJarWCafhosUrobHgMMvyshjbQvtqvxqZKWruwmuLHVyXXiOXLLMyDAzChxuynLrGVKJfXbPqucMyPDayTMsUVChyasQtc",
		@"iEfUufntjhPfVEMSttnLSGMaCjHAlNlsDlbODUluuOVZmfHCGjZrFyXkQONCiFTzOoujwOshyaxyxqYDPiWjHdggsTjygquBYSNyCOQb",
		@"jNksSqyuWlJglvbEGWYOvtckFdVvzVaVGyfONsTZvzLDWgUVrXQTIejmgXCcGJpbEaOxFuVOCEERdKLsUxPKrhesnfNzGyhmBHeoapJmvPMtssHHDDTCJGbFzRKJLaSmTgVzNMrZi",
		@"CBbGsedOSrgjGkrSnzVyBVJLMFYwLEFgoDuKdJDQfLPTWhtmyBQYULZGMrXWnMWFkQmOFoeQbgQNALldoXGulgNynwNNfkDyIwFVhovxeXxoRwvGewXreyxmKmvSYLJtuh",
		@"IROqEQGDfryjVXwzFSpXSsqBJAqQcDyMrAzOTEvZjfbykQxdAREknNpkIPRxOvtRBtnwybnmhQwUZZZlkuJfIGmAJKtPoKxduoPWKRwBEHARExNMWWIDxDeUlaXNpiMxtEpJx",
		@"EXMemMiLTkizgBISlLYlceDyHBqfbKnJjIiOewhYnEQlAgjzNLrJmZNXvqoNucyOZeCvQMigiKfTxTSbPdAOpVNrkamVYmSJtzqqaybPjoJapM",
		@"OptlohmILwGeqjKXXefIubraJDrShZkKTBVWSmyoPhWeQVQAtZTrcEdoXzggaZwodGVHATvSzTUyAtnbfcAlRWZOAmWiepdwyOfYvMFsdweRrVuylYH",
		@"vxoKYYelbPopZaISPgBDCHdhUbEJZEvawkRAnSikuXXJOubbEWfoFpPISWXNCwapowjkgbtKWJqIEijGDtatkOcPINuNZVQcfzefTIOjPHqyiRlYwujgszcfZB",
	];
	return ArDsGdWPZdSqt;
}

- (nonnull NSDictionary *)MCBYRJVpkbHFTnm :(nonnull NSDictionary *)lDavQkxBobeXiAXpzD {
	NSDictionary *YOthkuCmlPOh = @{
		@"OwjVRHKYKUBEOTGDcG": @"fJmpgIQSRhchVTzvCBLgyuRjznHBJBULtzilWfCSZvyzrqOuOGiLsjXpMJsBYsqxsrurTKQrwsuMlFbsEjhstcwaHdkTsFFRhJQQsSnHbREHRZjMXnIaNbUnfiUFyLyG",
		@"lgxFZNXTsOBcgYJPqgk": @"iMDTmwRkfQDEkRVTvJkytymABinOVUXIxTGrQEjJTAWisCpuzpgVkHVXqJquWaPsTiRsvUBUYDFgioyLgWLkdSSofeprgppbKSexxmNsgCQrzS",
		@"uvTEvGTCAvyksyk": @"vfTVKbYhdOiPxbnzjazBAewxpOrZIVNGdBXjkSFuKjbuylLqLSTfBWMMUnurCBwOymKBTRvQnRaHIfkVaPepfESWLGwaIYgymGeezvJyjZOBMLrGadCkFSLpdopHUlEBkZzZbTCAJQ",
		@"pUXfilrqCO": @"vyZTfcjKZjlquIPpFcVpQNHPTqpbblqMZywKKXFsxxfEROotOXVKZvIoAObfMydVhlZkIcALtNyCecCeZomDGyhmtumnWimJndHnvlVLNDGffYQU",
		@"YeySjHIsorsyzKAe": @"LnmPWEQXytucmRNikwSJXBLrfaPwXcXEthFWETLDozmffYaTRVIMvVFURDXgqNOxvZmcVjZrQwEDFCsZfRoCyitihenoHfpCCDtqdzQTFeOuzXrupPXcwmZrkQcGKfRnnoJ",
		@"cRdnCkkQtLxNMEAnN": @"PtlwlMgaYoVbpgsDltiIOpViffEMSgsflpFuZRQhEqVWTAvapZZHGyKnfFQfBxveEzXvNOnxhQzDIblevIEYzTITQPsVWdkMNNHHfxIDTdC",
		@"fgMOHUksBHZBagicLf": @"JJdVyIhRRVHrOQuqDVffVWgVSRPZQZuyWBmsVkbtvODoMYfscYAeyvzcGhiebFGqLvuDfvfgzTOzpZsrPejXyKPNvPWTWZBBfNOyJYKxUVBRqLjtBBdZadbkTURBGdWQwUOpuCFOWAFGYpPyqQoJL",
		@"XkIPZejzTJrOo": @"tmqDHHYVbOOpLzkaJTjlTkSZoKjHGwDHzJdxklEMHVoqJmayHapHWItMYiTfvyYIkAtbVEnolQwshVHwTyeZMncXTIAKvxcpUPQoiLlkKWPUoWrMZMhuntXmKfFXKtqhOuBbDBkqvGHNEJKNF",
		@"eNVWMgolNr": @"ihIHoFjqMphCFasWsXvZDlyTENYfVrWuQOmyiFpEFQakOjbfntmbfVgMXyALApJBLmHPOWDBDKbuCfucghSTvKGUxngNrxVUjHXgygWCQpzTBCGwehhCTPWtdRHsINwlmgymWVQlWoyYVoj",
		@"VydOvzlIYtfhXeDI": @"zpLoWbIjIVWREyTOGmlTYRdVcIheYZHXsRDzXwycupOMnVcIHSCbZszsoExwxYplBauAHCXbGqneDvcNmGIuiPzSqQBekaNclHCYKHzlXorprvLqancvWXMTZIMgbAAgOF",
		@"BFebkCPspBnXPIrwH": @"kxhJxFlHUnmnPNeHyloutRWJFdFiaOzLTeQrZAhqojcMtXNDWMHCtXgGNwVnuAuslSPEEmaaPzXGvPZPBKfraXvfywNKvtPDhAsLrheNMafqty",
		@"NVLZekPhgZh": @"ipzLaCHWbvIggSJJTojCGqiJmAgloLRgjUEbyzAjDNPGEIMAXUyyAjuYbpwBUYZhTctyqWfLlrLkRGDLfpwXrqziOqGrghFpUfuVHiVLkzjUgiadZUlbnVQoEgR",
	};
	return YOthkuCmlPOh;
}

+ (nonnull NSDictionary *)IkyKBZgbohIfM :(nonnull NSArray *)iRGPqcEirdoHR :(nonnull NSDictionary *)XiBgrgkJPZSguT :(nonnull NSData *)EBfDjSOMNuOBGJ {
	NSDictionary *tQutiEBebu = @{
		@"dURUwGfwvCesp": @"FJVfWteqQDIloQGhczDOcVXYTIkLkuLizixyAiUlHQSzqcvLytxNSACWivTEYFQGTbncWHCIYbFTUamotNzdBeeGtKnmJXldPzhRNxfRKMhWlznNXQaBZNefWVMEHhykOxwnhUvMeitkqMHc",
		@"GwsffSPkpYtdA": @"ejdjzCTAusnbXmmSaHmkZaBwcSrpmtFjwartUhmpbtAKquqNJJoWYnakVrTXVbCdNHwQlGOLTahhQjHfgwqeuVFKcPKevxMroXNMipbtpdMqo",
		@"KgAtdJNHFWAvU": @"wrTzEIgTeBjsNpzzvmVBUwrPvNcDzubolhtJYqIJKTJkqkLhlAvtEEKdjnzrJgVwbtLfTZkrPIxMsjRYpBCUMTTuCBajJXsuUTaPGLVMrdPsknGla",
		@"FUvezgbuTcmj": @"xmchFfjGAmhCwezrAOnUqnJZzOIKgmFGFhebtYXYWDxueLKSJugSaHYiBfDpjvcQGWnwtVbPxpaGvDSvoLbvXWCSAOGMbOpnCHgIlCxlLYbjyUngDL",
		@"QLLdkQdtJQdXpY": @"BZrktHfuuucObsKyaOGnPTyBmfXXBmAnhmBGPnLHCKdLKlJQsScXujsiuxmzpKMRLQsjbDyWTymjHsoNQWYfyaCNXPDQYpaWKHrzxbskGkwUmWkNwSVDaURpKIkCTdoTFlAIRpAZkhNbTMn",
		@"VzKZRmoBGKKMGQLYi": @"SsBKXKhoDIBisxNjKoKaeJDYKGgXEUllyQZLIZHqhOGkhkbNhYmTLcKRarTopyGhrqYdyYnSlcRGeQhJnrRcYWBTPoXsPqZlsAtHhRtMWTgDZ",
		@"VhLqsNvoCcOyv": @"oIIyvusQmSrWaBztHBexyWoGDIFPlXdfrUmAcoInrWhhqwTZTXlYLYvssUrsHxftejZyTpIfeOCttyDreKNCtBevZwpRnuJIYJhNYmqiSiQxegQuSoJcTZgztZUXkraFVQFPxAOqPWxuzzfIv",
		@"GTKwonHOcYT": @"KSqjFIIGRtqArqENtfDNiFcnzVrzlJDHdCGvMsAZmvsJOgFPzkclmWAMnCuhDuKevFziBTDCQIctHEXohzkdVPdvbvPHLOUyptTTejrKNcBvkOLQDFBuLYqCyax",
		@"afNSXNueApiA": @"ghDewazFdKfRbcNiTYGbxXZlBjXeYiiKkONdRBXJgZYIAAyPVfexgFUXCowCVpSRCxvjuEWOCYNoODDqvwpSaHLEaMQZvTjiPHQzbbJUNQLJcL",
		@"fiHZSwFqrOiYQQKw": @"HXYdAkSEufJtJwYmyCiKLPbioViLaLKgMboQiVLTuqvqyJRzdkQNzWVAgpVKdVXECjpNbBRkDzFSbVCPQVaTTXEcOWofXuyWkehDAMilAezlUCPEFeATecqpNUlbY",
		@"enrsvbqERHj": @"GmhMAllfrjUAoQbBtTwulOlVkOOMQIJooNOPWIBtvlkcgbzqiSzYYYDzAxNzSnfTrOdNgdRKwYdnsTNqBqtZuwQwWXyTqzoeLpGT",
	};
	return tQutiEBebu;
}

- (nonnull NSArray *)BYXgBdxEKDUf :(nonnull NSString *)wluNIWFkzJSb {
	NSArray *ZYlcauOXrxSve = @[
		@"jiCjOdLMLDFjTwXjhjFAYLKBGynwRuIuTXAcMmgkfotReDKshBYmUCmFZKaodRrMjFXLgBRjfCmiDOwRZLJhjhEPVzZamJutGJeXicAhnbFbluZ",
		@"GFpjKzehYrXRIdbvboMBvjffIUKYmtBJIRqqDSSDfomFdfYOvWLyefoCmAHfnPmRNfHIYsSgwcKYiDsVUcAihEzlAAejyNuaJdzdPItubCuKzXwoVbQplfIOFCRmtfPWBT",
		@"rKiOwXZUYQNrPKzOEpTyxVpzFJuYCnIupvPjpeXszNklTuPTIEldtxvhxSMvjYnJHZBsxblzsBPGKVXZKWBGzDKFyJljrRbBSkXIYZSQlyEeEpamTRPSJKoIpZTgA",
		@"rwejDrLYOTZScSkMWNMBjQYukHqKCnVsEoPqmAWhhAddMTSTrFVaUeUOLEdsjgtKPmjrvRBttAzMYOScMkfdznAYDCbFzgFAfTPKyGjBjSbFjCEOkzWQYLhTXUcBOxGfcDTitS",
		@"zyRvCYhJwfacKJCCwnfVFVVRNCFPEVBVcTEtsVSVccbScvpWeUccSsCTnWTejYTDVmsOKvynNPNpSdcXLhAsABZHEseWBDbbZpHcRkWXoTBePObwjjZIAOCcnKLRIhnlVqyLIT",
		@"fTZPajaUrnLQPkyxgwRYNPLNGKdzxKvBFLHRMZVBzIBgLRdbTMHQnevvlEhHhEBwMYxQCYdfOnGCUeaGUuSdMJuolQAbmoVfnUJTvKHjLQDyVqaxkQFMTmroKDxZrqFfIpwYlDL",
		@"ayxxhwDbKzZYrwZtYTElKJDPkGNHLhNaYMfYdtYfHoACYvEmQklasqSYIvTkrkxHOKTpMRXKlpTHudkpimfbnmGWarILVbDLnsZJBaSLdOPHizRLcPrZCzcmfuSzXGyaZoqN",
		@"gCTeRXftoUjeRoLbhvufOPnNxCnWCTjgTUhOwiTAzBnkdEzvMnYnfxzlITxyqFvHkEIffzSmYoSghJgIRbjkoLwfJvfyCdzUYiQrZSwgsbkWigOTckOFYmbMMOPpVEfExiFKldXMzUeChXFB",
		@"mYyQRszWMsLdolWeBoGyQQPsTwXBdGCznXrYyEPNrqgMMlIzfLOCgySlkwqEVieOnDiQJnZoNhiHxqYgqSADfxeHQYGDoTmCUyNSyyWyYITdjOxYLh",
		@"wYvihBnmwRyaFzBjKsIPiKkkNsTWYLzqgtOizUOBiOkwojelbWIKOnOJSEuBWXNUpBAqZZhWgrmZKViZjbOUxVqlwieMNkfhYvVZpsAygnPpaEcPCETyYQPmnYckrDeQvdkaqHhd",
		@"kHpODmFWPPVwLJNNnNJauMTByeOcajxbJLyfaPIjNYYZpPOcIZYjXCIEqPegVdkvXzDyGSPoxShcyERvqylSyxiwXyHlKdOWcRGABIuAUfwzERiiGrIh",
		@"fErkDDGvwzVQDnIwhOzCaiabWRVoevaLnoKKhBHrfxfINtGcrijcmGXjCSqinhCoDzryxGsmnAfSSxKHARQRFijFxOvfNTIRuFLcCqbxpmhqMHKjnpvDy",
	];
	return ZYlcauOXrxSve;
}

- (nonnull NSArray *)EVTFJOWmeovASWbU :(nonnull UIImage *)owocdKDshFLdtF :(nonnull NSString *)xvUIAjIZdFszBXy {
	NSArray *WbTofyASfz = @[
		@"WDksaPjoDGWImQKkjUdYeFqnFMSuIxXVOoCSTyAvhOFGIBuXajhEjPpmawxJQTZIqDTnQpESvzDImAsieesgeainllRnWqzAfLScqgginyipUCDlWVhiDHYyKeCDHPnuzsTCPGnAaXjytgaFZQ",
		@"ALQfmykxVyTwDRXmyOiKPDWGDncuiUepsiyGqLvhJnEUobQlcBaZyKefaPdXogavyMYrcytdpxkfPCVuBuJUPiyKAHDLGXFmMlyXwNXInxejEkHuWvSZYrxfGXxjbyqun",
		@"JZAujCMQlllSFYXKWtZtzpLBRNATgDAsZOFHROrMjumxuYSlALcvERLyuAWblooVrZpXkakFCsEpIxHavHDnCqhMKBFNGRuYIJhlMiTFDPuakHsJBkwryHZvUnNqNiIDs",
		@"hvBrLTsmTaGkTVNeuXZErrlMKlMKnTEbdJkrfdxHLWuhEWHxVwrGRzeIHQIyBHuVbtjeqEfkjQtrDZgCXmSqNmFQkYxsKUwEuNOgBedW",
		@"GipmOkBHHRynBRejUtViGilHFjvaFIBUJpFLgtUnxHyZSdDUhckYyegsYqsnqmBpakSQCOgTrXEhJqmGtYfjNorfxEBSXEmOIeHkAKUmjWebtW",
		@"cfFaSiOtzfLWMhBjLbnVZwOpwkauhRwXKotecUydgtkzOSwaYhiYqwwfgbYTWCuVVOlUEUEsqqvIuWcwamOgiRsFJiQZvqtIjeYuTHbLarYbgYVoTilMScuukxDHeTXaXXCvDokjep",
		@"fiVLlnDNqygkeqMTQYgzmmhMBLMgYlFMMfmtgzCtFvJfFaYMNciJwPnBvxkHhSoLNEZENxohiZSdOGRGBKFJKXbALMxtnLiQKzfCxemzvaexLJYHFICNFdPtxybejRggURffUQTkBmscB",
		@"OEDKSkgjcdiNkdYTCxqkTwuiBbOvTqnqbUknRjhiwZlUgXOEoNyrpCnzpGSKxREoXMfFOeEyCRTORrfEqSSfCSOkuwJeHIUMEfhpltQwzweYVWwyCuKkJZxOmuSKpQkWWjmOdnUiEEA",
		@"dRCXoKcKOUIqxogCymrGUbgUKopCuJkKPbBlHISZlXuDrBmJRlWMrVcCexwNTNJpmahxdoEICXCWJAVdgEdRcXuGKeouUrjGLoluCZvc",
		@"gaFEIDYRmKPOMcdZtkmFduEeKKdSmOypBSphzNpozyHWkvuHDIATrnPQMaHXNhbivwbUtxFbacxWkHWYTXyYocjhWarcOGHvtdLCBnnWDCAeWFNPPGYMOWChgKyIkNwJM",
		@"bypasEEHVDqvjqsRZwdEgwpPEyusSvjfDTXJBtNqEOesSGKSHWVUxdWxEpQnmeJjKCUgrMhpJZrWhPvNDFtENUuBOsiYBgvGfpCbRzIAmkDzODJtNbprNhemMXTvEtsK",
		@"WwLSSNSmEcAiRmyiPRnJIwJPllHsoBTxFBNSDFVefPdMFcEnQpXTYuBETiGOXaxGhuJGPOeftUYSsKQMwtJBQkpEylwvXPXBQBnAVoQfvIobNd",
		@"tEISJLBqcduPThcESLWdaoMfPAgWPTbGOcXppMmMdBRkpJwewqMZQKAvbEBUxGzqqpJLXFTpcBzTnmenLzgElpNKzdeYdadncYSrENHnDfXINaFpSLBqRxDGMU",
		@"FFXufZvWuokMPHFMMHtbynELVNqqJRHLDwhFxiHorzooNHaPuinvGVmFiKZCBxNcZPFpLRepushGdnncgPtnYcyBzlOuCloHHVkmddpEOWP",
		@"FNVKZpxtCxQsRteOIGuyLkLcZEEGNtbXkIbdfHIkSvSiTGqJRZleGECpcAfSlwsSjMcUhLAodMtojpItDSVOuJzjcJbpCtzIzUyZUCU",
		@"DRoyiovgacCQmtJvYinCvmEnGAwMvIDXdLOnOeespnPqhTiOswkJjUsTLfAAlyYhquinTYwrLJfLeahNuGDfMyrjtHZKahwYMIhEuowiEJWnq",
	];
	return WbTofyASfz;
}

- (nonnull UIImage *)DBcOaFjACXRDWg :(nonnull NSDictionary *)eWrmErKOZcwJHQUMMH :(nonnull NSData *)aNXcvIkKQtwPtzYBl :(nonnull NSArray *)sgLHuSgFWbUGPADdQ {
	NSData *RELdgCVxtdWNqlSIbCJ = [@"cHTwlLOjxiFewHvruCcKhUVLAsTwLszPHzbwTtcrKeWWWtEduzzmiMDEoLPwSqujykrQxHHkOjfDOydRyyDArnrfatYRaNLplRwcpNNPtExORWxGWMBord" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NexQDGaEJGsglWxgk = [UIImage imageWithData:RELdgCVxtdWNqlSIbCJ];
	NexQDGaEJGsglWxgk = [UIImage imageNamed:@"GrtIsTCEyeSUELacmeHfdLkuyaeZtIZWOEPGlKKdnDJCVPpgZFRxGKZStmXTysZEHtTIjeHpiNLZNUiUxXqDXwvHMINrwSYDsPwJbOuxSUGoXRzuMSnmiQMbuyUAQxOUuZJGBqeAAWUFatPLOutqR"];
	return NexQDGaEJGsglWxgk;
}

- (nonnull NSDictionary *)OuFSqyKwhXYo :(nonnull NSString *)aZAIcxEovtK :(nonnull NSArray *)mGoxgTBXbVVvwPxlntk :(nonnull NSData *)vfgdmYKBLgNCsrvZIK {
	NSDictionary *UMxyPUliqcQWxMm = @{
		@"fCKOJKUFoQo": @"qFrgDSUPhVYGzAKGkTTtkPNmQMqcBiPNAbWnhRichEHsjXYLFcMAeGINJogcGelOnNOkFfSTGuzBWjFjYWEYpSiwWexzlucrxcjIEXSJAtpeQJApOPHRfxpVC",
		@"hLaJqPjQvtNy": @"sIbHlPAiqJHRPfHitvhlShFRKtCGvprKmLqbFMqpwbfuoznqfEsraQNTussRpuMIqAhxPHSqUgOmGJCRBOxAmPhFjsKFKaECdzmHZeXWbphHAnIJxzfs",
		@"rQGPRjscVvFVxAdsbeo": @"zTadJQxkcnxHAbZwLDUCsSMcJoWGsfaiAhwjnbuOStAOhGmdpJeOeUbSqeqHjRfNwlkKvPFJStmFJLMgUMoNbtmRpKAVMKwZuEkNGSnfnnIocKrnpKCQZoZRJMtT",
		@"lOszRBpceH": @"YnsmsZotcQzBkmCXELCcglHcKOkUpvwaAxzhKyMybxDViBenHHWzuKveVBPLLBJMdmmXKoLEYBgaaoWwTEopmtJHLIOmcAlyTNhraFngbYRclStJfMafRgxTPEyjDgRLNFgfkrimQvfDHYe",
		@"gElnojTHRqGXczvPE": @"YsUEgewiAOoKToOoNHGDjxCRiwgieAstmFMjLvguvtOxuqVzNFLVUcJLPORsVPkrgjErrJKHSpuEcUMQnjpEfTKjlKRXlMFzYeYoHLYdsvnDMNEYGAloaHLBoXlXuWoKE",
		@"ilLSdLMbGqZffoDmLl": @"MJgFOrczcbjMwkRtPXFAdKqDOsQBdbVnJoRtjhbOdmMcZsPPGlSKhZYmvfOnGzuULZKztXyqgHHZpeNeeaTBYxxKufWeUWxpfjVCepDqusbuVpVKTOckFPgRUBEKRoKNRyYyvPOgRJrITnyID",
		@"vzbPQQtYGl": @"RCnfFbLfsEGyxpHfmkEXBfzDmBFKHCQZFDaKoIdzrlRuRuUWgUfbtPFVUYFyPvZRWXpLINBnCerbOKXYboUfjiykJIqslsJjIXYwGEkkukyzAJvpgfzhKpHEae",
		@"LuKdjpBWqfnhVZm": @"IXwDJmjxeyWNdkwbldiEGBZJrLajyZDkHgiLHgoNtdOsayFUuvndWvlEqWYBvnZjyOuKODxyRYmNhCDQlwhWaeehzLbYIbaQYznZKENCDHHherjzFiG",
		@"eQlaxgZKPaki": @"HVircMrXCFuBxcPnLHFiHGYIKCteZjRZVDyTxkfnChmEFRAwEPDBvGJboBXdnINdmPckzpqdHxiggSJEujLYOYrnjLUgjdXAjAJrAswfFBgCzybqCB",
		@"pKNYdecjvNMrER": @"DNtNmrRPbkuAzMKCztghICocyNnadWpYfcphGZHkdQGYrsBHNOkvSzugdDuWvlgWgcFcuYRuEMzXWYOSqYNCMAFNnuWwLPhHpbsBJTJrtoJnBnQexpbIgrObQjX",
		@"FADiqTDTgDRZeL": @"IhimyiXNsJKCFkkOugfapKXPVwNzzjFsRzhxGvutuYpXPQYCDSfRPILnujqAROmPyrvOHeZAdtGsPLIFqBQRZeNlJuWGwDOuhYlYEWrYmZk",
		@"UUXHfkpMvrUsO": @"UGdaLqXymquKPJjVYtkJdYRenvaCHAnEJFhgHYpgsVUMphdYhHXlalIoPTnFLFGQFqAbwiJDjoAEjTgfsLivvjsPoGSjKoIZpLLkrz",
		@"VtkCFJPhss": @"zBNWgtGyOLwJgNkiienBOdletUfrhaROpXjZOHsmMRgpCXAZTWnoUnqFzZzqqAECKbhlXLndXlzWbVazeBHskrMqOixMXgtNCvPBoLgerNFOQoJdhOdvvC",
		@"UrBBtTSTRk": @"sPpUnoTtmhvELJhwkjcEVxivzeMYSxwiEnipqEzvcIcDvXkDtqvREnBPUCBfeJRXfxMPFztuPwTSSeIMLOJRrdwRCZelkIJKLJngWriofrlsCotBHgafjFPFAxiiVkBDCDknXWyclwltCCOhDCbX",
		@"EKNoCJxdnKtbvZC": @"LarPKYZFSUEPskXqWuxoxqRFSQciZUlIgfKlZuxPDyxldyxXFFMjVtAQnVnJXErrpQuStvkmfrSmBraKvBVzwxToBkRLsLQuGLAmMPnAFUNkJVAiBkUfoHqxFgdRqM",
		@"cZtgadeazXjoLuIWio": @"sUKWdgulMDeVTDxQOYJkTreYtqMzhCxjiXaLmQztLjLBuCidSGmHRXmYZGSSHlFEQHonfHrfTKFNqRLVxcAEMtwOtSDPKkVuboWNEelwOUyCx",
	};
	return UMxyPUliqcQWxMm;
}

+ (nonnull NSString *)BwATCZnOArW :(nonnull NSDictionary *)vuHYnQvEsoUAAbg {
	NSString *CJzeuVhZfzLEfyoQffM = @"TplofgkXJpHsGrutTdVOkEzxPmhUgHTyKxBHEiqdUKKLHkViWMuwptiCarrhBVNTEqrQARobpPZFikZbnmPyNXfuTYJwRskGqlpfchNLpDDXtNjPdGk";
	return CJzeuVhZfzLEfyoQffM;
}

+ (nonnull NSDictionary *)OSiaJAZyTWmOXkDuLww :(nonnull NSDictionary *)kwsLsrMTYQbDeRt {
	NSDictionary *qYtZuKdbEWKo = @{
		@"pXYaxJFRkegCkwPQaH": @"KvnBmnUFJuJmuQBGSkSMGEsPxFVCEIQmjMrIgrzuiOBIAYnyNIMXDwkCnKCXYpqzqgFCjnPLLqxLCuKuEUwXwTevYikqCfxzEnvZJUTNbhnKPVKYSHhwOgeuYhHxPHDQWjINFFwWIfindYokWBCqD",
		@"xHXEuouJwoAQd": @"LNcPjWfieZJUoszkIekGGVKiqZwfhyWHkTRAJUQSbeyfBXKuHwVbrUVVbqjkgqrFtNLbemwjihhbyvylHZKbhXEfGOVzwGUkNFzSgIqSycSVwFbVeDGmLQstUeoypGZDPkFyLYHfgEUbAZXUF",
		@"tYLNquDTuEA": @"ZtwSQoRbMBuXCptnsTBuLynIOFiwYCLbSsbKibgUmxLRLDgTNBpOqCtQcPpePYJSeEYuXDDFlkLujuvIvlfMokaIJQTIyAuFJGmfVZsTJnACpSHYvNlx",
		@"RTwnVEtQxI": @"BAJzmZXkJEBRFlkfMuVGvwXJOPkrwUEqhsvpRwpbBynQhhQGTRMDmqabtKWxmZgennDHDOANqEOBwbmgIFHmrNWtysEFcOHxyVSVqtmRRjzhfnuwzCXAZwjed",
		@"EXySlMrODHl": @"bUGJoeXnDDhYMiRGlfjNZWBWasgTioWlnCHhUxFwXjznEUdvZlzfnhuTWwMcIclMmCwdFXtsSugkXuDcRlgZYkIuDbdBWmgGnPqxWWjBoXdlewXGKhmIzZwtVePZXBItxRN",
		@"lBjAJyhQKtGPOaP": @"CTJTiLaeUwntlBgJdobqVShhoYnVzBzqNtmiPXkMbDkyjTcRDrHpXZLXygrBZMDMIKWYjTvboiEwyOFaCYssPhoNbImNzOkDBmjGWAbFziZvvwnnsJjhLMXjETffmucEEOkIL",
		@"WzKENUJDscY": @"jaGUcfbMoWQMpgaAPntzIKjFXCANXfHExnAceNfOJczoYkNUgprDQMuUvDKESXdJCrhmizUHAxEpTyrFpLmHeGIBYxusoXrrLaVKbLhgkPrODuscAFQSkI",
		@"VeXgNSfIniye": @"wquKKPmZUQIccRIspzYYFezmHRKEUlxytSiBhSDudEZhwLHCQIvmkOREtBtaCIFMffAncfvcGOdNPcZUAAvjnJqlLGnVNjLAdeMj",
		@"RSDynGCRKFklRcdZ": @"QSUGFJbjDFuMnMsGPFsSLLtnSUdYeKNaowHFtdQCoGURxjqUEYThuDKpdqfUEDRhYoQfPhuLcFFtyWqFXcUezZOQOSEGBKKwPfyaSVKxwJXCbtpqWtpxGTxWirsZrBGQS",
		@"ZDCakRqLJD": @"aOqvlPRRuqWpQxksubwtPMYKhBAaxpVLCviWTJAPeIGZHukXXIwqyrKjSdPbspTiuwcLAHOFoznCozbdmMgJdLTRavClKsTFmhXNnguijVBMYiuJ",
		@"uTFUKuxDqrR": @"AabYWKrZPkblgZUuXfspODgaEVooztCUyJmXOcnKFUJTwAGQcmPbFelnkWTZUYFGTMvhijhujuZGMeMpbJzLHwBRTvwPvuhyXBkVvmTcyOuYFYobLeQxZBbikdyDFsc",
		@"gZmWTJpoMKciKmF": @"SHWTDftWmlmCQoIdyCstMAEfOjxpnnBUEzgZnhzXUplrKIzUengSfvpYJqBxggWWjUqzdlGrUKUVvCjzALytKjxpYDQapSIUefbEiFQpqFpOMyHxeIHvHZHybPXzjTPzMzJLFtTQYsEL",
	};
	return qYtZuKdbEWKo;
}

- (nonnull NSString *)wpWqwYERpGfkyIro :(nonnull NSData *)nsfiRAwYBsIUrou :(nonnull NSData *)yfRhoGCkyuEjpgkjYOl :(nonnull NSData *)SpgHfYUXVBgdSj {
	NSString *jBDjfcxYSgpntzaV = @"XIiShpXjGFrgGtuqHzWoYTtDnGwshCwOrDBFXDRnSPhTuxUJdvfzyiMnRmOAPyQfNKloxDOzFSMhXiOuitMSQCYcPJTMGDdmXFrmvpMbNVGAAjJReLBsQSAdhnicJltotKCDOAUPokMyxHU";
	return jBDjfcxYSgpntzaV;
}

- (nonnull UIImage *)LnySjttJwk :(nonnull NSData *)fHlqsRArTaeiFHA :(nonnull NSArray *)zqCKnCnSyYq :(nonnull NSData *)mmsryqlLOcvr {
	NSData *pZKvxKXjDy = [@"JLQRMvhbaycPcjLKamIPpGRvBTjpQzhWsIiJEggtBPxuGwfXeHwpIqkQvlvFWkWwtYstIhOLgpshAhOvIqLTuiQUuqKrrnqhnCXdeLhifEQfDyaQFRaWoPM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SrEFXkNbliRlXIl = [UIImage imageWithData:pZKvxKXjDy];
	SrEFXkNbliRlXIl = [UIImage imageNamed:@"cUVboHYvlVgcYAFeoNelRwcabutLWNNdszRhEPnxbudsUhyqTSDzjSkKpkelZcNZJdsTZyomwSdOhUInbfjVVSyERfyVVKVtlaVzaUtvAleNQcF"];
	return SrEFXkNbliRlXIl;
}

- (nonnull NSData *)VPegLkCvguGorlxEri :(nonnull NSData *)jFWNuhyTNysIiEIBy :(nonnull NSDictionary *)GUSolnlyDyTjHLExp :(nonnull NSArray *)EJYgVfdMTbJYaerZ {
	NSData *UrkmDzWtmQOOiJWpEQ = [@"hsdXVHLWaLAxNxJhqSUDSOpZJLLLTOfAAjXWDjWNYJlkPSgAGVTwxDasYVHXZIQIktYCAuGigZCjEspTCJCybqePJZbsikBTnDkOHoFDsiWlLgBKDiwKfOeMixqPyPLeMvpf" dataUsingEncoding:NSUTF8StringEncoding];
	return UrkmDzWtmQOOiJWpEQ;
}

+ (nonnull UIImage *)GtdACcBILY :(nonnull NSData *)FzScrlMMLctXLR {
	NSData *aLdmmSTIqJTdPjJdNlb = [@"EHyPKSWBgObIejLzTBMVgMxZLSWbkPlWdcZYtblHYaFSATvHodVeKkczUOKuVsfodGZlnEHnccsRwcfpYfiSEutpWSlpgbLSecAOnIjroNPQqtbwB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *naPgbllkaIDa = [UIImage imageWithData:aLdmmSTIqJTdPjJdNlb];
	naPgbllkaIDa = [UIImage imageNamed:@"plwEsLmRZwmFiGTLWvigLbQEUeXgpamvEQwflhCmZStMNBtthqpofRemaGnJOeevfozkksWDUQDAIrqjEARzHlcKtjZqxUdbvJcFCRRfrXQXFYduUHcEaYFpXnw"];
	return naPgbllkaIDa;
}

+ (nonnull NSArray *)ljRyCMSJYVQZTjMwx :(nonnull UIImage *)nNkOkoPBWySijVonlQL :(nonnull UIImage *)DuLvgTOVUjPxR :(nonnull NSArray *)OibIvqRTJfpTr {
	NSArray *vrxKAPUbFZPprKQkQ = @[
		@"EjVjIycjWwarNSzWizZdHQpQhtRgEeprreWZZSLgJadRHUCsGqIsHakAXHRSVsTAFJbRnquayhJdYdDZHjRpCEaNqdUHHwemacjWucPtHfkHGHVMFgSUkcvQkkZi",
		@"FwqdubAkcBVyghjTueTMFxdqyfVcqprBeLVExeEROHpBQcpndLUJKZJUAFcSvmQLusDPfnVMHuvxjECQWjtrfPGwYaMOhFUfzYWEHGSDxfceWxxEXYzQFJKYYYAeBfXTNAUqvMQXCOPFMixLquEhZ",
		@"uHKXKWCVexIJkoIaGDoiDluVFnyZYrNCCDTSlgsStJhjUkPFDfrWIstjnYkJaYAIYqPkKepVNdfFkuQQYSLSBmWNUJZKrgjcqvObyLIkNQDlrTTBGfGWgrbKxlmIZUXHCAYvWHUfDam",
		@"UCWpjeFMSYKpVndFVwEfXYhjluGgbLEiIorsWhYBTIarFkEcqbdkRKVddHxLFWzcktnZSEXwSeVMkFRUpLQZeavScwHLgPUqvfGildMLOEgmaclcdDlZ",
		@"oKslumAINhDIGjnyggbgJBBYzYJpHOFZwgrnWjCKgqwAcJlhINAoCOzwlKcgGZzTNLaXlXUAKBwsaAcotSDKCIBcIbsklRhlUicfmLGRNvJxAdUIbRNEvIRSnzMgO",
		@"FFOUddZZsOeXmGdjBFqrmPkiNRIwClkISOmLzcYjbShSdqXZCwljqoKbnHDYBxefJCafyWtjNeilRzJsiWwBbrjFMqyecRQkZJYyquAUosYLBcAMOEYzyWLWJgYwyRnXgbwntZfJ",
		@"RgmjMmWXwIZYZPRTrWqUttGBLxkluerJuQAQCsaeZyVfjHIWjEebGyfowqRNbpTSZhpROHhRXzZAAxpNfYSceWDxekVUOoxyjaAwHutTjeUfkgeshZhXeaHvOiNKYDFgpgszvPLZIBw",
		@"UTgVCYmZKQXKIEFPUZByInSXivabtCVHqHisONiDbiZvYcuTWrndvPObDLWTBvCjZVPCumAVBgQRZIIDrlReUFAUbOJBDllNDbyDEJvjmvZiARrdWssorFBOVXqFvnWYINorqeTguQxxWnVXPZJT",
		@"MKlxexYIjyGWaxMRvdfIxQaKwnSKVmuiFXZUTZcQjRwXYRhmyRkuVSlNvOzNJPPdinxXJCoRBSLeibtwSAApUAyMNVkHabmoiolNNm",
		@"SYkStXlTHTPztvarzpGFcRYmcbXKMQEvbzmuHlAideplnrGLAUAZarYqKDWUVkXpRRDQXTCHQymoMyQZLvjpnQjtsjklgvDUUdbYHCIueVLfbjokIkgSpMKvPWxkzAWyRkBpbAvZLlilNwjpBq",
		@"KypxYSUssVMNesRVShdfmQhRPwZQcBiDuHzkqhyJoGmlDZJwMuRyLbeQjUZBwJhXIHVktQtHIFfZoDnzgmZPUrSxhEhXpBqgRArzTpchTWVRxITAxuZ",
		@"TyAiUUhQJODoKdFjkPhlgZTGFrjLMoCrXrZwxZDmXmpDpBVlxCrXobwoVwmBHlfxKyVAFtNnPTyqGpQmOANDqfMvhsecIEjzmorTRnvuHlMVyabFE",
		@"rLIkjiMmZzCeXURGQcWbdFWVMECVsEfvsgIWyoxWWOkDfBvfzAtXnJGpcWcROPOhjgXIAlPdJTxqjGupngFbGghXXvKtwBWQVCytRlrIkvWzEUphOghXzoCTfsVzympCDNdEOfNUYGuPQvhNa",
		@"kwAqYmvcXOIFQKKIWedoXzoWwIplvpZdXleYEnVaBfnxjVYpKpTeXlTsSKOFeAVDiBAuSnuXtoAgrgGTiMrAvQNPwdogluDeSuPNdVkCKVXvXKRZZkoZABcyaRFPQOJyNRYRZIeMBECAowq",
		@"yNXmFYKtDTeOmAswSQtaLnyaQNdNpfpPDLFUtRzIaoGwBeGZvMbZnbwOeMwKnRcrOFsyUZtqdCaWAwgTIpXnmsINyarabIFaKszUTzUpTKEDUswNXcAJefCThQCUyTiHjNAdYsNcUIj",
		@"sPUirQRgRdNcOJEdQRpYXLCqldBLEsmUpsxvnTVLpqKsxiUMgcdCTkVocIYhftmtrXnAhTPzUmGtPqrySjaTXTMIAhVDcSRohIhfacknDWWNnCbcfxJmycACSmZOSUuDMl",
		@"tvsmPSSqBqWfPqzhZClitdBqZUiBCoBquVlmXWsLSPsEOszzNTpMMXHFezLlzzyhMWbDraSDiybzZBuDmuhBNwTfaLnsVanXcQkNIyhkWKzSoMJkUeWgKCOSRSwjOhjhCOxr",
	];
	return vrxKAPUbFZPprKQkQ;
}

- (nonnull NSString *)IrRWQfdspEviId :(nonnull NSData *)bqkujxNvIhjK :(nonnull NSData *)yhlxoJpFUv :(nonnull NSData *)evXrlziKGB {
	NSString *OtLWkSfXXvbZCzvSC = @"NVKjVbemdWMQtjbtcZByhhRNtHfqWQKEOOacrfiCbuPSuEHZIzWkFezOzfkLnbvTvBrjPQhcXMljAhlCQHiTpRhtLzViXccvHHcFarc";
	return OtLWkSfXXvbZCzvSC;
}

- (nonnull NSArray *)TXXfhvEpDwfgQLcaH :(nonnull NSDictionary *)XvIzCsldeDvmiS {
	NSArray *bPClOQCzpFGHpDrzwb = @[
		@"mtTpqHanPXAnDIrlswGksrjIBRbUHnYUuSSMMLuHaICYaguAdEtkJZIWlvBLXTVArLDfLaSytfOJaOVwPZJEggtLkvgYjwJMllxUavgckGFJhZnzqtWqc",
		@"ezPTCgcBoMouLLqacPUlyLXTPotIGRwxBNKuUJbeENcHvQznMUNeSZFrvcWlfPSVRbOTJnxQqRGSaINHIYsuFVwFuOcANTpCCPoQTqxpHExWinJmACXBWSdqiNlPpwEhKTx",
		@"hujurXckVTXOENmJmZTyTcafcyXcCjuVfIRupjwFOwBTdXBcciyLmdiTCwIjVrzDPMvHfMiEeCNJgYzAwGTbAqywcYKZaaOsPhGqqgFzBbfesnm",
		@"GWygUAyOuAigbeIAcoCofmyIeadwMwhUypkWIKtSbUdoAbcTiIxzcaDPwdAMUnEzgFkTepElUNWxdqCoFFQwSDlAipfgHRifhPbmyao",
		@"tYMgLGUDoDGfOBmWRguXDOZjEAxjVVJgNkmlTiJgYvObdaPmWBuBToLMOlWIegPtYaYOesUTlqxkaIUFFpKsvdYfsWBcinrDeEDscpAdjYKllbKoQBrqSoyNwOaiKza",
		@"qPRMFjljTYevOUsmvsFoADbPdKDNLMMfnLkqzyLjxblpjTAByysujUuRjsDHdxTLaJiTNjzWdfKLBtYPBsuGhQDgtdOMKcMdePxRUYRKKWmgmVkneOkq",
		@"VpoJHGIeHqooMRuqOYPghedTRIcfxXtAgVHYeYcWAKQOGzxksyAhCURahvqzgpPTbrfqUuoBBykNCNLWAxkgFcJcLXURbAcWrnsCjySkVfYJWVMgJYcLQVaoZPpdtYJTawTga",
		@"zlctUuceWjYFoJXGKEtcZUZbPPBcakqKZFApBXeSDGyyDETuRqIUvgiQKbclbpNQYTtBaZLBeVRuGbQpwzDhKajpnHurhQAYDVhGczMvBgmLLAtawvOLgITSNqUvWsMqTtb",
		@"kFiouXDfDppzIEiTJYPJwkzuqXICETPZphqgSHLWEJHefJvKVeadMTIyBUMkrntyynnUtuIRiXZCiiXJXWhlGzQTWLEkjWrKDuYJLOOMRTkqrwQkOdrvWVGlyxMjWvMpZtkk",
		@"agbAMhWcvUHWXiNezSJCctkcVQufSHDQrpJeQeKBFJsAzgBYUjTbwsnoywZPxxlokstDHIVJEwNoMhaQCMLPIvOUtWZqkBCVEJggBUWzaSIuARRmyzmauxgUgrdLuJNytJvbWddUzKfdgcPGwZo",
		@"ztccGEtzSdUapxJvSrJycekJyNMmixBGLCTOlYnzPTirJZWncSHoEUibwMGtqMxoPqIfHGSjVTxgBLxiQUMFpIBIZAYNyDJrWFQulDnOkZaJFPEGlkAGoajZiHhvrmJAUbQDVOs",
		@"MGTpINRVwgKMjtEcJGWDToJneidINrpVPFMdruiHCmzSXwwvIYMyfNweUOJDtEeePvPCjfNgnDNkNlJYthWcnfnTXMZWdZIVZwZGXhJfMxEYfPdRtmJihOSdlmFDclm",
		@"tCwiavbDVkonyXITHBBaQWuGCggCqXkuQdKTQbndVoZneHpPQMDzKhIhwixAkxGNlWfgzHfVNwhSvFCJsCIlHdspwEAoEGBTDvfPOfQpucUrwTHHKBXbUzUMrbhSFenBdGNhQjStJKWSSQpRn",
		@"MGwhktzQfGUVgkJjekvOCDxEYWuefLEMmzvJgbeBYpODhaWDnmOqzlxxpyqKwkXFEPUsWkHDrPCJCYjAPJFlpfEpiXaOkOajqVTdqnGQDM",
	];
	return bPClOQCzpFGHpDrzwb;
}

- (nonnull UIImage *)BgdFABdQOrP :(nonnull NSData *)ivzQpVXuiYIfIi :(nonnull NSArray *)IAOZBnhCijeGyZb {
	NSData *WhHWOzCBrT = [@"IaFDVmSaeKYWVrsmZUUmORbbzVeehAQZxbbBclvivUUTUacpCUZfUJTqvcjOWFJisohxtUGBQtruXAapfwaCIcficjSJYlMSDhhfjVuFbXxxWgPNtCLsuUxoMozthOsNzaRddWfw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CeSNcddAlJ = [UIImage imageWithData:WhHWOzCBrT];
	CeSNcddAlJ = [UIImage imageNamed:@"gPVXCFLYzoKZcMrwLJKndwJXaemysYfQiyXVSKSBBJfxRQuxQSxJLpvFSZgXTjScpwzBRaBoJPmdOaujwfTansQRLbgXfPiCwxtOGJeqzdkMRnnhlbMyAfPhUajguIyMuvyruRDQVmXWhbQbIHaK"];
	return CeSNcddAlJ;
}

- (nonnull UIImage *)YJGjrisLBfrxviithwy :(nonnull NSData *)vdvOKTisARe :(nonnull NSDictionary *)MmQMDuFoWyScmrYILq :(nonnull NSArray *)YMFRfaxEjAjP {
	NSData *qOjtljwTBRpXI = [@"NggpFLdJfwgSAnrTAnttFhCCPZSTvRUcDwlLTdaRWbNHJqpjCiELHfCiFtWJkVtikJYaLkIEFSdaBAhxkzCYhluZWEPWnAipEVyFcNKeRelv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *baJeFAmKbtzfRNpjoM = [UIImage imageWithData:qOjtljwTBRpXI];
	baJeFAmKbtzfRNpjoM = [UIImage imageNamed:@"HfzijuCpquiclWPMDbzMnpUHqBmdjsoFLUQwZToKYIPImSGatzAfIEgzbPUqhZiRNpGSErjLHSNizSfzyuLZXHgFiKefhCwKHCPhmCTdmWoAavZuEAAMAFfjrcFkzVHYSpLF"];
	return baJeFAmKbtzfRNpjoM;
}

+ (nonnull UIImage *)RJHVSTguGEU :(nonnull NSArray *)sdMQSBSPNJpFQF :(nonnull NSString *)mPbqioYTEwYfLMGrZx :(nonnull NSDictionary *)vcExDOIWGcSHfBCHUvV {
	NSData *uClYVHlrbsujmvaqBp = [@"MNEVbwZBvJvuUbuuUlbBtqqdDcgsraJlzUtQlwEriQgpyvCjWOpVxWEOYcNyNnMCqdzPeSGdWUBtFJrqypasfcEXFtfoBwLLuUcmQfaHHl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fNyaLCXYbzeBDQMbXVj = [UIImage imageWithData:uClYVHlrbsujmvaqBp];
	fNyaLCXYbzeBDQMbXVj = [UIImage imageNamed:@"lxOvIKRgTKGgoAYkgxNkNYElhTdfdhTIGQKklbYQhfZXoOtHQPAnVHMazLjTptlOOXNRZVjDlHLxvhZENJFViYKgElYtOMNJRCfBQekqEdGSDPhzRaLvTQNOdWKICsnZOZqJawVUhJASi"];
	return fNyaLCXYbzeBDQMbXVj;
}

- (nonnull UIImage *)rUrAVXkkPUvltjOajm :(nonnull UIImage *)QlmLbqDOay :(nonnull NSDictionary *)GqRTDeQTgI {
	NSData *FhUFbiYIhOTlIYXqoi = [@"KYuiWrIoVVGtVvCbFAlLZzhThpmcZxZQhBakhugDeMhkrGkmLCOLtCZzxpgiXscTAWQRhnZdVSnNniWOgcSAiZxArSKYmNOaSrRUDgxoPDnnRtGkSrmreAeIRnRSvyiqPFWgeiLiwcsvwzfZBN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *plVsdPCRYYoUnJLNPpn = [UIImage imageWithData:FhUFbiYIhOTlIYXqoi];
	plVsdPCRYYoUnJLNPpn = [UIImage imageNamed:@"TIjyesSyVgiBXMucTzoUIXlfDJSIxTBcDeOeBrlxtjcYuxmcRvChHeFwsvsjMgHEjAoFUrpKfdqmTLnYbGuAbusHltLJBPnRGauQSnHbhJ"];
	return plVsdPCRYYoUnJLNPpn;
}

+ (nonnull NSData *)yWQthRFItpSnXjqT :(nonnull UIImage *)oXwVehcEsGF :(nonnull UIImage *)FmuRefQqafShWQgljt :(nonnull NSData *)FUtlZcGymPe {
	NSData *rkXXsGiAYubyMZk = [@"hVryoSLmhzlWjFokypWqiYEdxApXUXUouUZmChjEwhMbqeLknJpPwcZSZGiJLIbHtTkVDKnOWlfwpEWrOYBtuXaUTCXibjLVReAsAWqNQMNlXsKyOeTKXZTplpCwyilYwnIObbeCvYtmmZnnF" dataUsingEncoding:NSUTF8StringEncoding];
	return rkXXsGiAYubyMZk;
}

+ (nonnull NSData *)nTirDIFgKCwnnxwwfP :(nonnull NSArray *)WTQgHHaHGckyNTMPNcZ {
	NSData *QePjhPUvAWmylYaKaq = [@"snaWCJHkNPSczAsJdsEekmTaVXWoIzwCkOsyqQanRNnVgyhVAvtBNqSBKMLMXAVqeEzaJrAhwgsZFrvCdOEVGQGWgGdigIWGTiNEkUWwWNEkeXRaLZ" dataUsingEncoding:NSUTF8StringEncoding];
	return QePjhPUvAWmylYaKaq;
}

+ (nonnull NSString *)sGcTMHlGlgAxi :(nonnull UIImage *)DPMgAXppYbIWfFPJhm :(nonnull NSArray *)klgWkQIQPlYisEM {
	NSString *hJLirkiRqyhJZd = @"gDMTCAQMbFWiPCnOhYwXKzFUzOupwVODZqEZRuBSKHieZJRbUkCtCKGgIMoCPTTwbfbahpoXQzMKDUNcfumRBYmYvgSFyStmKGTMvIWUHmuBtcZIAwOpavWzjFrYcesZtzieT";
	return hJLirkiRqyhJZd;
}

- (nonnull NSArray *)WEAbeAEvDumQc :(nonnull NSData *)HlbRysCOKzhnAkBSdUv :(nonnull NSArray *)nayNmSKgEfXhbnpiy :(nonnull NSArray *)npQqafqQBJQi {
	NSArray *ObKEZMAwrV = @[
		@"JTbHagavIgOroWCPybOCezWPuaDMfNJzkVGviTuDCBfWMPSOVOPEMZgQJhJmrldUndxViCQUjgVqrMVknqitgSoXbSOBJsaEItXDJkycRXdBHTfQQGEcYUdu",
		@"TFAWgLOGfOaewVNLBOrnuAvCeyTIQfiSmPvBgXZPrzhoaFiSCaTCQyHJkilHPjBLFUPriWTzIPjqreyYiyOkNqxzEtzkNRCeeNugyVPKgDFDta",
		@"hXOFCdoBtfGLeAXcVYjlAaUOOHDhrfGMOXYdMsOOgIHvJjoYvASXGOoCaUpYhXgSadsCkRPdFGvsfvXbglGaxQiKpIAhMDCakjsSPpaqgNTgbaFzMoIbDMeRew",
		@"gWGvYzXrBwtFNUuIpeUbDytURITxhAlCCcpBjwuXRlhyVGXDnZUCnnQLTQpxetxxrkLSBywdNZwtNmUeaCMBwDwbwRzapwHrYhJfkKTOWGvRHbblAVvjBeLkCryvMOafEHbetyKLiwGEPwQ",
		@"rfBeNleOjHafsuoJpqwktFejjUUylcnwxkTUWCQkgOKzBPsGQuUcWvEpBSQZMpQyibxaMuVLJmIWOiROPavQturDZwHjgVUqIZVIVecSdpSYPUsDaTyjCRBqjAeKnZrQa",
		@"vjtOquWkEZlJtfwhzpaerqTrOGNZdjIFYuEzVLjyzHevCQAsAPqXazljfPXEgwJnlOyaOahwfyTPURcsJeZfkRyemZcYiBJviRJpdlCJRJyZTAdQ",
		@"GTMVtwoDWqiAxsgKIfKUWEGeDxvCEPYkQsTNQEgAUsMgLkADXBZlMRgMiQwhRozgPZcIIxOXWrgeCGWruuqvFOcHRTZkbBuVzjObzeQwvqLsqhLJGpDTJdUBfQqcaLUeMmLahquFgVbdoroWBq",
		@"qrgOBIJXdaDmxAJplCIQTwCNvunBfaJYZIfUduBxCzpYQiVxYbEXqcDkVCRImmHnEkgYVlthjZXoFKnVkBQKKUYALjUWpzHTQWaiPlczYLh",
		@"yNjzPveVOfZewOCEUJQcMCgtBwPYKUONiWYXkBLdrSYTkGMYpMrYpEfkMmQWwzjcmPZYxGsORVLduYxJPgqPfkPXNwetiLCKKBAJyIGjDShiZGHTHYYMgaEskPsBIwgULF",
		@"eebkowLxfnWqLoVIbTShCuCNziFbZSWggsCKTsIjsZEyeOOuvltZDeJAvnHJSqbkAHgoaUyPJCIpugWoRZLKiaocvbKcvtOuHpeRAdmxO",
		@"kshqhRYYADTUPYscpLgPfruIZsXMUSEVMdXtZPEBEyYETbwtQCVJqaBjwHKyISaLNyVCHLPndurmcPoknQeYZKpIrwPuMQekqRvteDWFtOv",
		@"YCxNNoSmyALlxqdUYpalDKUOqFpuLqMjeaMsOPMVMOKpSnbKevZwVjURKbEmjuoUYcuSuOsJcsSINYjuOKZsxqSNGbyiPzfGfqxqoVQKafCHikgpOwTQyoRLeItgzLQiOCFTbPFMKe",
		@"hecOITuGYfFyjuKaFbgHBjlmUglShVxORJPZEnHKFVcMJZnKqGGXDfzofCCPWhKIGcrAOrAlwuWGouKOvxihPdMFSkgsbQwmMhscqqmLYCgiGeNmxirjlevlMEd",
		@"jKgrdCiWYXyoMRTzRFelKtmBvAkdnjlQVqemEXEfmOpSfEORPKADEpUCTkAGwchLNjXXNAjCYTMoaUhCQLrbeTObyhqguVkUNWylVtDgDxTvQgESajXToJsBQDJSUaiQSkHGVDvWyPcWhXvCkQ",
	];
	return ObKEZMAwrV;
}

+ (nonnull NSArray *)dIKUczqbSkEJB :(nonnull NSData *)sObZVgWWjOJww :(nonnull UIImage *)yOgKgiDwLcSbSx :(nonnull NSArray *)oFZMHJfKXKGvShmw {
	NSArray *mfOFlcVWjIVN = @[
		@"MBLcbVWRZdDeLDqozUTELpwYvFoILSUCVuDfUrQJcqrrpqJFLXrFSNIOSajUsviKNLzXntCnfJTFRRHDRSNwBwxcUzzxewgFHZQcJCluhhsLltYnjcStEgpDcfhpncTU",
		@"YJpOdBBusZdxaovOCxfarHSVNynfCzyREOkDSJPEudniinuKoqJxpUffogqrJcVJXPVpRVSJIeokdAhAXPUjNFreoDZXGDaOTcqSzXazZkNsuaFSBxfNSmeQBtRRgIH",
		@"cteZMoTwJOZNgQSTvzeEClgtQtMduQOGPbNsZzUHYYdDPrTJpNvywRxSIivLXFZvdSxHWQQPfrGPyLBnTNhGJDIbFLbjgdxLrbixIrRbCnEiWgiHycKZyEXJsIWMPucUWhFvFt",
		@"uiddVaoHGsbvZFarJhjqKpWYLLOtAbeviTpXCAOzqcQBwGIKXaAaMwQoKBmGcFXkuuTAMITazXIaIGfagYvWXoSiPlIWLFeOXJpvMoRN",
		@"tVBtvKXOUMNTRqQAqQZROHzknsxiQUTGxbvHmzQgnVjzZGRoaKdrSIybwHSlnNhxwnHqvqMxHYExJGLlqkPHXFtqanJlggWMmUnFwYkrzoAHnricalEVbCeCiHbYRnvOEkqyTPLmQrfpuznFLcW",
		@"nrdCTKQwunJvFWTFmjfMQCqxSHFgTvyWAAXoHTVLALEyXiaGiiAmFTnhXKhJLQgNiaHIZJvMoGAYXJlXhogkJmvXTfcHIFwFcMMbBVYzcWqOjfiZOypecEJGZiRsI",
		@"WcSYUhcfqsVjkglLVQsodXGaudddVxsvgzDxZBrpplejxhHGYAJdyhEvWXExZwscmoDHInaZwySUquqJtFHgHMtSjMXxaYkFoLaJYAULR",
		@"WabczjAeGxUskqGeyPHWzTnpNONBPbhmXaIzYOybNCAPDgprejVXXafyqILqFxeCioUWOZoFfSNfFVcDtNYCocAWuNxnsavzqnPVVDZmXA",
		@"idYtKqdeKbYeeWuGbAHLRTulPczouhuUgdRPepuuxfffJCFRQLJlxaMneIBOizZjjikPQhdJveDDLMfFWPrKqXISDxgIPDjgoVEJaEZzsajXNGHgYglDd",
		@"NKCVDYPWsRsBdnmLotEPEcykQRLKQDnHnTpEdIOgXIPDprGPYLCeKMBtssmZGsWkyIKnonHLMIyrCvZmNrYZGXghdhWrPrGICOJltsTqYxjmjoUNkaWGdcJVTTASbGVTqhqzaRsVZzEQxAmXwLo",
		@"miMZCPUpwSqWNzqPEUlBPOUqcLTKtycRmfykfDfJOsBZIWrxOjmohkyNzkrgwxxmRvqoEUoessDNTofNevNHDsESfDaGVbWuhbHJjSqjeGArRDlIaAQIYyJcCQmTijxvvwlyTYdIie",
		@"aaCXjmclGZasLjIsDlXSdRjHPemzNouhydVCKdNDkdOECQeyjinBVsffPBZMwUEusRwInIrCvaFxyILoatANgLvjRkiZIxASztxGQACtULUXM",
		@"mPkDdGKNCCqoCCyAeRRAiBSBywczezOqVMxJCXsdbEEtkEJbzdVNUCTNVbGYdgSLCWLECBkgtRASdXhUBsLTiMbVrMSDoNfbnYrgPyICkKlpxqfCseFFufPxcwaSVkEMGhFJZ",
		@"ynremEkyCLDHCEjrbjcbkcvblyQhhNiPKNTUptSZLLJCZbrTBKsSoNzXZZGdTGApwzbkpVPHGrlcopOkTpPafphAhJzPEXcDZFBlteMAhoErCrtkirTjUQcTHocbaMOOMiCpoOgJnzczQnXP",
		@"uFQrMMDaGFcZClghaJZwTwnBwSrweedDqrAJySNUyXSYeudxvQpqqGAFYkTwLxGaHchcdUzCZdSbnKnaFcQKjbYXvbdSUFFYNISJjDLzZtTDqTgrVsqZGCQpnzKMD",
		@"LFcqjbZJfUqPHuAJrsQSKoZOsWxwpSmIHsIaAfVBLKQTUQUPZCOeYltSVgGCquxbSzFZqjESaWzEqRTIijLmkRVhXtVahUsTxllYKinCBvsoVPzKjbNZCsVGEDCaKcXJ",
		@"KmSWfWpIrgEZTKUcomvWdXVbwRldjtRfQRZDJAKutyDHvJZXiCzhSylAbBzRwsPopdQEPQQJSYksRLtearnRGigPMaQAryJUeagpxBPmXHyNrpEcLGxFSWMzOKfeEwEfsdarl",
	];
	return mfOFlcVWjIVN;
}

- (nonnull NSData *)gCATogbCEDZgdtv :(nonnull NSData *)WiQRrVxpaUbr :(nonnull NSArray *)lyfnHWxFPOsh :(nonnull UIImage *)PrObLMDSgMqXSbGfAh {
	NSData *mJWKlkvuBXjfRL = [@"HNGgLoVYVnmasLuaundfGuCmLXzVxdutViYgMTrRTxhFHPkFzJbBHzHckQiaRozoITrqzIsxoIMUsObMpTIerXEzdKTBMvaCWjHvURXvhPFNqk" dataUsingEncoding:NSUTF8StringEncoding];
	return mJWKlkvuBXjfRL;
}

- (nonnull UIImage *)rWolIQYEgbM :(nonnull NSData *)wnaDPeXbVXmPoYQaEy :(nonnull UIImage *)fKYYzYBLEKWThiN :(nonnull NSData *)oHwwCUNcNCadQk {
	NSData *ayWcAjOEPFik = [@"BtFZHwZXJUzLQVILLBctbsmjzCzXRjjPCWSWJzcWHYUAMmrysnhORljTfajORbzEzJcAzvvtusOUigmoUyaJorMjbXcyuaxszLpNSCgGoCWVOs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IpoTNqwXAZy = [UIImage imageWithData:ayWcAjOEPFik];
	IpoTNqwXAZy = [UIImage imageNamed:@"dilKbcVHIFhXBZsRJbFLeYTdXEbDjmmWYejwMNgoJEmmsPgWZgSemNEFRHecdhOCTtjidhGmfxVodIavKJXRGOvJyppTKqBVxykSmavLWWAxUvXcnmO"];
	return IpoTNqwXAZy;
}

- (nonnull NSArray *)GUmwePQtjIarjFkRZ :(nonnull NSArray *)jMFnfLrVkhOAUB :(nonnull NSDictionary *)PAPgpdkMVNdZkRyfqV :(nonnull NSDictionary *)oqQYJhMjjroBufmAmK {
	NSArray *xDYeaTGnmBiQFWs = @[
		@"bwbLLHFfyfkfBfIeTVeqNHdPSHHhGgIpLlOWLMIZcKyxWEkLhgfRikBJcSdHTafPdVHLzRNLNSNNkAsUmfOyzRozOJVXTzEVMxWwftyMzMcBDaZEbWiDtQCHtnjZOvFYdW",
		@"qsEulzKdPDPBSLZtTQiPGlYKKUjMJLzaQVoUZzXDdxqzhvzNQXlSKHWOHQDQKuvNKKhvBMmQRjnhUZJXOdreTtrtUhCBxThSKsYbVeFnzEuLOEEBrucv",
		@"RyNLFOuHYaAlnqwYYRqUaBpbaYUdWREFTwgVPmKlEXRAPCvdyljpzBPiBJOJKOwjdtBfhpXzmURxmxzTIruACzbasGrOsWhHCSbmMnf",
		@"zGINOOJTUgdcUTlelMQSXNCaguBYRZBwjEUcCFeHdoFHsZmSngoMWxPcIItLDYZINUPllsacfNZoLOBcYrPSCuTBYqizYZQOmpXBvgRfWUQyyxTRFiDrNZMoFIweOkiWXQgfQQZDzvqNjIPXU",
		@"CpoweSQktxsJUldxvdUamyupbpgLIxDsNaTuVnTZcVNbCTJkKoxMOOLmukwGUyKIFpkICCrTvzOAeBUzaBItuMNSroguxgLgZJRkWwZkEVkQRyFvqDmRG",
		@"rxAFwaukPCQCHXYfARkVhqKfUlOxgtyoWJILbBDHNzISFZoQgEoWAQCXeTjwptfuKVGHOplCwDuuiylebtVHvMdnqsmaeokbkZGvTszHAQLnsWbqCUFszVlkBTTmycCzNkFprxtOyCRiWXjll",
		@"nKRigcebeEfqqvmhAetamxUoQrlnBREUhxVqUxcfetpDeYvuXBeKqoBOFapfztNoOAKLZDAitHOrGqtUvGIPqDPQCiVdQXDOKBzbWTGgvjDDzqSXGOSxjNRjLgAYFaTadCWjLqchnUTJ",
		@"cqgoCcudIJMNjuzYxAGXVbYYBtslUxpNqayMnNYfUKGvNYdVyoebaZJhyTqBqhAAVcwqlUhtQfGEgTxbfhDpYtYJSSjVJvevEPVRIdYgcFBmvbelyBTqqpUMUoxQjHdIEFPRuyaAsx",
		@"DBbFdIGPHVgvBocwKVghyoeNpdXPFFoHDrEYjGGtgTHgPJoAPMwSOXAfqPShXskepYyHLugtZSBQIkqYNubHvIhGzSAoZRzKuwvewyZGtR",
		@"SZVGDfJPpcZUXiqPmYrDRNPvvAXckclgRvkcGSjNkxuHIxOeXsYYitjrFBnZPWSkmSzgrBDWwjMpkpXhfBXCyxwYchbzMARHewBZZrtEbQQePOwFycXGdSXkeBVxtFjugPLqGvl",
		@"vaGcjztbPEGJjIwQjHkaroYuxKCKbCaSVzlzmwyLBTjfBYkVanHZQpdBjXZygevFGtjfcNDYoijPrkXZCOlkCRKTvHMLquIAEJHpArWyIlgrgGLyhIivauGcNfXHRdxmTlnxPcrWdLpAVbzlhhKTq",
		@"IHaLTPWyWjTCqnqCrCsIMfYfdgLJwVzKplJaiORLRrRAoekYlRrSaaneIibQcdlNuvORYJEvqrGGJuadiFxzkRqhGXXZlVCRkdGxOjLniZWpM",
		@"vpNEtwTgglCUfLcvAYoBIfqYaVkLXHGuPamQNkOzneifHYqKVhPbFOTFpgLIkEZSKHBVvPeUnVFGnNaWYWdLHYEcSFNWDaTPfKSKWsYXyoKnPqYnPTvWyGIfxPPLkKim",
		@"toZnLfSxcpFfLNNciGuaqYtJbVLXiRYlXfJKnQuYJcsjCcIaStndEVqPaqDRMpqpkdjJTFdmUsYTEjKghjcUbOowRNqoIFlSgDCKzFuWDhLIaHmTKZmNzkwUgGtmYHoEIJFFLyo",
		@"FAooPgbWJzadfmnESipIcdchNFzBPxqzUIYxBWdRXulUbHOlVJTnUaAhnvFgZsaFLvOfqXLXEmjajnBpvINAgWQJHznrvwAlilbTcqZJxDrqwxBlsgZcXuYhbpMCV",
		@"pqrSzRNydwkkNbqtRmosEYWhauyzvDxLYVBuxbEbLAlwaczYrfhNurUwmFTOeDbGQKSkdZVXWVeVkZlhdBKzWPMvDZCpRrYrekMDiHufv",
		@"IIGEbAIBRCyEeogaXRsGMGcgDDnWbpbJCbbLLfBdsSlSyZLjzoqosTixxjqcHLUptUEMvhuPprBIpeHLPJYSpdGDtZukMenytFwVFgSxfZBWBNmNEvklwxisWRxDzjKzMZFmnaK",
		@"WknkdhnYpLsSoJrcIbHprBrbjHZfmuyPaJDkhYgHwtTlAcJauSwVVLCvVTTlbUuJHjQZtwsQOWjhTmtIlkPuGKJMpesjGJUFtFSNHNduzgJTJweePjgZzdTeV",
	];
	return xDYeaTGnmBiQFWs;
}

+ (nonnull UIImage *)CGkldrAWbxvD :(nonnull NSArray *)aOhwqwRlOqaY :(nonnull NSArray *)lbrIZQsdYuLhShPGvn {
	NSData *lUMemtKFoOCfInoTdJ = [@"OihxCaGQhkWPGaOxjdIeaBohbduNgJZsTIdrOLhMZlxFLSqXLPuPQGgIkrDmbZwXhqfKSOxWkVxTQhLGmPHxioApNgRiuULtTKFZkFYhUsiaZErIkLkSEXHUEUtUZX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ADQEiZBGjGg = [UIImage imageWithData:lUMemtKFoOCfInoTdJ];
	ADQEiZBGjGg = [UIImage imageNamed:@"NyKyDPwVNXVPBWgyBOVMbSaoPEmjdbnDkrtyJEyLgJBHuOZpFrCnmyrcIDAuFHeZrVnvnMhkVRljYTWKvUhpisqmUUaqKYmbXJcNAXrjSdbppnbkqcclEcd"];
	return ADQEiZBGjGg;
}

+ (nonnull NSArray *)TXCbjInWbI :(nonnull NSDictionary *)pNuLhFohIu :(nonnull NSDictionary *)LOHBLUnBRBUx :(nonnull UIImage *)BGfOqiaUBgOoFqBx {
	NSArray *MegGnHyzwEwkAa = @[
		@"XaidNXGZVcoySeFTZCmdhqyOPAvKUnojGstrwOGZylfgKBgfFIkMUsfBLRdtkhuvIENcPlFHdwTMhbMSUgZYHplWLYhZvMpXvMLDdEgcAnCXiCxdeWdkaWYEgXFOsOpLZYAgBhcNNQKJ",
		@"TFtJWqDvBVSihmULCFEnyCXWeuoCoxpdGNOmIniFQsTyDAIoIvZGhRrznLULKVsljugItWwLHtBgZEIDmjtxlInEYxPpTjPjuqfsVcyaeEdKcItPKasVsLsfoEbfqEdVQjycqbDkFETVOnouSEgs",
		@"HMHyHKScPstSaalutIkYIUdwVnjnSvBRmdVtIlCFNPlzygClfJWMgTHEvIHkcCDHDVetltSDiAkhsSqynfLFwYIaABOVSJuLbbSUeIHFaRGkSvrepdzMPfEimXrnfPQnjDnVdrqAfoYK",
		@"gGLwtyQOYJVwqyzVLobrEZHSRynGaUdPyPjJGXvzoJVfAGGCjDoQeeHYXPisZSeAtvKGMCQecRsCvZBtADQDyZMLhUZtYpLLYfohXVCjrKwDTIvhyWJOyjeMvrvuzloQBB",
		@"uqveongNlksGODFlFIRepDiTVWeHnuRZmGIHYjxAXBFZtXPOsWBwTdiFtkZevbaMEATsAtHeahftfIUhShEZllulxujsmyhZldbZxAsQjENuLpbRFKyIwWSxKfyzmxmBikHuGRqoQBWh",
		@"sjMtSVHYazKziUKiiddJEkvtrTlQZXsMqzOBSqzynEZvaBMaPHlSGcqljbrnNuLdogMAEjGNQPisvYKzQzdmRLbLdpjamQQScSDqNwdiPYVukvXDgkFlpSUBQgOqVpYFspUwtdfdugkoHCWzPD",
		@"FtzhNKnVYkGygWmLjwLJkjYXnILjiruRyNXxzsCJUVIoJAnilJyLlEMHyNzNzBRfeTjNBqkVQYyhgScgfSyuXKZHkkczgrMsUpKriGcfVZHNFZQqQFOyijWtkxfSBWfTzetCXNjuw",
		@"rRYuzVcHJByFGJkCcAARJfUqhiRwGmYrwmEApFfgzzAMazGjTiPTTdHiDuOCqxEvdOugyXNjtHfaTohHDjkeCGQqJttgrUarUcGgWcFdWcicKAnUcsXkiCDgqjNxFcdEVE",
		@"LJxZFCIflZJpWHjuITgCuVOwegrUnCIUxCyASeiepOEPbYXtanEoggqlCMNgDQhuxTNqZQXpDbGCacLnGElHbRSwnNkGihgrSFSsnUCbzYwAP",
		@"vHPhOJvQvitprYUMaJabfBoCvgYdrLUrqaDNdbLCvZhlaJMZOeeRDYhHsBVZEBgwQatYlfDuMfWaxsQssAFJanlufNuUzFtBahhQowKAblWbj",
		@"DnrkpmnYHFLywVAEIQmqqTmOXbmswDiaeKFEyymmpLPYwEpPMZONqceViZVctFUgDTfvxLvWlrnsMQELeEOsPiLZDPrIVdAZIjiGtSFEbGEWB",
	];
	return MegGnHyzwEwkAa;
}

- (nonnull NSData *)wAOLubhtbkTLgM :(nonnull NSData *)FJqLHnajHbOQAbxqgR {
	NSData *eqSabDKLezMis = [@"GNEcQghLqcOKjFwWQygZKAZdMmoeWYWBYTGDWjKMRIDqlsOXctpuZPkUUAykDiEaliXKAFDTxymVhOwYqoKOMsqvCPIweZKUVZZZKaCnQIVTCvzSNwtAqSCWLIO" dataUsingEncoding:NSUTF8StringEncoding];
	return eqSabDKLezMis;
}

- (nonnull NSData *)BMfUEbiQURQ :(nonnull NSString *)nQCneSgbmBvXM :(nonnull UIImage *)MbQVYYAyvBX :(nonnull UIImage *)vVliDhGuWtjyAJNCi {
	NSData *FfMIDMREPClOh = [@"OBkoyqxdaCfoTDpXNiAHFltVeoTRmqrxDDqwTUCxeRUVWrJpDgCBnenidkhYJeAyyehMOiDzkUMCvOGtPCTVYRHfnpZRDNSehQxenmmBdhGSmlXsqHEAmtfAlsjIlrA" dataUsingEncoding:NSUTF8StringEncoding];
	return FfMIDMREPClOh;
}

+ (nonnull NSDictionary *)ubnSctTdOn :(nonnull NSData *)KRqXZTkPpHcaVyCfM :(nonnull UIImage *)BCYKooNkKgfKwrao {
	NSDictionary *XZAXHWnaibcHZ = @{
		@"fnbhJZgzxqyVVZTdacn": @"WvGQwwxVeFExwlwCFkyeZMjoRgqKBTENlSgPIJBsyVUfpbZfOmaXwaOLnpsZeNsfLDISKARcfJVybUqeuPWhKcgEZOJcjwovfaltxzEqYXxldunvpltaTxdDYCdGNnUk",
		@"LetlvfhbwkvcVx": @"tPKuvhdpZFMTNieXzbYkYhWSHtpKOHmHDuDmGxcAYGPGLERaDIwrXzBNBWfVQEgxJSWnXBgULhunoXuCefPXeVDgwpVSZLvDHWUCZFqEaBLfprijr",
		@"edDaXlXQEAdMItzH": @"dOBgFIgcNNJZahsmUaNNwDGZVAPOkBCGhguWRDQdcdxcLvXHMdpDbyWliOdOmfzsOPpoYlqOQqztWZdwMpmDyTYrTFXTFPNHttMcjOjMlnpDBaeUZkGBxSuEOVJYjXLIDQnwpTDDjMQqXMORI",
		@"nOUHWTOpsIGgZ": @"OfxOBclgFWLpCqKCQJlzWKSfSLFrdPceIgbAEnlWObwFbTSqjIzDGcEPCUBOzBYeqjygfTUiSBrLgaVpbNyNKPIMJXijePzOpuLYJ",
		@"vEMzyAsOdJzkSd": @"CAeqkbZEUfBRKmpGoRZYbNfNSDAIsidmiqUCcoiolGjMsiVlDdvJXxVBhLFqjSuSNIzSPFjBFrPkFRcbsNTVgmwlLOgaIzxayzYmpynGdOQNRHWlIOfhAkzTM",
		@"UEKdwbLMaFeuC": @"UcKxGfiwzKcxvOvIMgNgnkFypaHOZWxOncsaHUZqqIbMmTzukMacHVLciQyXzsCLCAmoPuLtMQtiNKaIZjSWvGorzlPoiICLIlADxYCCCPvPStOGbbgdMIs",
		@"YqGHQHdAKppadkeP": @"ulrTXjLNYMGhgMmsVXtqcuwYEvnXsnAkrFfBEcTBbcmtQyoIoVfjOoloQcTVXCRxUzkFiyozJOIcLRtIRrEkmFJiLoVXsGghYRhVGmosDLK",
		@"ecTofLNfEwu": @"wmiSxlpJePPOAEYjADBUYpKzrokvUpwpGMHrWsBLcICDtrODbQkrvfHmfgqnTWNeMjoECzkkJlmKekAssnpIrkISyqtBNkCotcLyevvcsbafitZPgpitmHemiFHGqVvWpMx",
		@"DuLMDSlFUTKmq": @"JWESKzEvlIelnsMYtusnMInszNEymNQsbEZDZbAuRVWDjrZbZlfukOuesLdLejkiuNJFNhlTdurPGOCBrczXGIvnYikMPpyZmPVSeHUKfMalrdmzyYPGfzBuMTWXviBJJQ",
		@"CSItAtXIPixwzbYVJlG": @"mIyAkAvRlMZwUCjCIBrVqHPrRLEdCdHtAMJVrduFeqxUaQMIXPFMGYqQMOHygZGLqnLXTOUreONaAQciEcPBzxxZZTejhetPYblivOJkevgjj",
		@"rNqrdCJnqZIKk": @"iDWbNmnpJcaJazENpNZAqvJnVgnlOpOebKvyguKauprZEevVPblHxZIRkjXUMOwjbFWUMnlhHedYttMcTRksgtqoeNKOsvrDXrdxnzDdWwCKtBHOsJX",
		@"HnEkcMpmYdJR": @"geBPYMOhTKQcKaemnIrizfczpPInzEPNvwXLrEwoyTMLlIepHoohWseabhPttTrJHrReWLpCyhAeXTwGeUYUxYjIEFrfLINwPbaJBOQkANngzVAWBCnHmNWJlxHEDExZysSjAJRXbcLtT",
		@"SKtIUFsAOvk": @"sFOWexJkeUyPYLYrBrzCsgbVzCupDqmJKnQApRCPgHVtszuPXLJbAzMjuUXAxfcPJeQgQjRpBKbqSvqWGQVBVVfdoVtHLsKTxpGJIqGywskFb",
		@"qEaQUTXwSYhBnsXP": @"JPoQcZjZNTXMdLvtOtXotdymrBVDPdKJdFUXcQeNkvYFKYKUUPEbdqBSDOWZxNnMgFUUIZKKuCPHtKJbfHaBafWfTyCSDwLYuhXfLUdiArfXwyQuZUNcqWdWDtfiMGyNiSRnviC",
	};
	return XZAXHWnaibcHZ;
}

- (nonnull UIImage *)WZHeiaXgkIixOqbdIa :(nonnull NSData *)YuDvMdfJnhhbasVNK :(nonnull NSData *)AkdQBwzsjNzrYqStAz :(nonnull NSString *)ROyBTXgOCafpTkPySSX {
	NSData *DeEpxgVJXTx = [@"RcVRqvGZMmmPiWenMhCbEFSWRFLwWMazuNjMyaRvDJyGJMOTwQcIRHzXheLGWHVWWeqRBmiorltYTODFmdccGpkSTbAiDOFCFkKbFQmmMpiCwZatIIEQcFZRpcZNWNegDpCrRzWEiCGk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mmtmjaUmEi = [UIImage imageWithData:DeEpxgVJXTx];
	mmtmjaUmEi = [UIImage imageNamed:@"FPtduolEbOefaemsaCMvimzXcBXfTEfknXBnjAwVJVkjJTRjznUPXwIuzxdwuBushZFMphmuOvyWTJOqjQmGlojfnHWDUdFfSoAzEzPyCHFcWkMBfQvjfXVgYDjFfdlyt"];
	return mmtmjaUmEi;
}

- (void)setNeedsUpdateFont:(BOOL)needsUpdate {
    objc_setAssociatedObject(self, @selector(needsUpdateFont), @(needsUpdate), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"font"]) {
        self.needsUpdateFont = (change[NSKeyValueChangeNewKey] != nil);
    }
    [self updatePlaceholderLabel];
}


#pragma mark - Update

- (void)updatePlaceholderLabel {
    if (self.text.length) {
        [self.placeholderLabel removeFromSuperview];
        return;
    }

    [self insertSubview:self.placeholderLabel atIndex:0];

    if (self.needsUpdateFont) {
        self.placeholderLabel.font = self.font;
        self.needsUpdateFont = NO;
    }
    self.placeholderLabel.textAlignment = self.textAlignment;

    // `NSTextContainer` is available since iOS 7
    CGFloat lineFragmentPadding;
    UIEdgeInsets textContainerInset;

#pragma deploymate push "ignored-api-availability"
    // iOS 7+
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        lineFragmentPadding = self.textContainer.lineFragmentPadding;
        textContainerInset = self.textContainerInset;
    }
#pragma deploymate pop

    // iOS 6
    else {
        lineFragmentPadding = 5;
        textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0);
    }

    CGFloat x = lineFragmentPadding + textContainerInset.left;
    CGFloat y = textContainerInset.top;
    CGFloat width = CGRectGetWidth(self.bounds) - x - lineFragmentPadding - textContainerInset.right;
    CGFloat height = [self.placeholderLabel sizeThatFits:CGSizeMake(width, 0)].height;
    self.placeholderLabel.frame = CGRectMake(x, y, width, height);
}

@end
