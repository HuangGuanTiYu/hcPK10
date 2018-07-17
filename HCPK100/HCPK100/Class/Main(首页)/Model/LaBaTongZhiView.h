

#import <UIKit/UIKit.h>



@protocol LaBaTongZhiViewDelegate <NSObject>



-(void) laBaAnimationDone;



@end

@interface LaBaTongZhiView : UIView

@property (assign, nonatomic) id<LaBaTongZhiViewDelegate>delegate;



-(void) startAnimationWithString:(NSString*)text;

@end
