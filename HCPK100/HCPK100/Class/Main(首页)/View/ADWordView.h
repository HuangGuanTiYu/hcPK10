//
//  ADWordView.h
//  Lottery123
//
//  Created by 项目2 on 16/9/22.
//  Copyright © 2016年 项目. All rights reserved.
//

#import <UIKit/UIKit.h>




@protocol ADWordViewDelegate <NSObject>



-(void) laBaAnimationDone;



@end

@interface ADWordView : UIView

@property (assign, nonatomic) id<ADWordViewDelegate>delegate;



-(void) startAnimationWithString:(NSString*)text;



@end
