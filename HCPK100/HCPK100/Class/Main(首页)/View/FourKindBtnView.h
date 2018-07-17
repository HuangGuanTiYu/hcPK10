//
//  FourKindBtnView.h
//  Lottery123
//
//  Created by 项目2 on 16/9/23.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FourKindBtnViewDelegate<NSObject>
-(void)clickWhtaKindBtn:(NSDictionary *)clickDict;
@end
@interface FourKindBtnView : UIView
@property(nonatomic,assign) id<FourKindBtnViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame withBtnArr:(NSArray *)btnArr;
- (void)laBaAnimationDone;
@end
