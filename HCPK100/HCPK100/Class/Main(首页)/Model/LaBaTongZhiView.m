

#import "LaBaTongZhiView.h"


@interface LaBaTongZhiView (){
    UIView *gonggaoBGView;
    UILabel *gonggaoLabel;
}

@end


@implementation LaBaTongZhiView



- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initUI];
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void) _initUI{
    
    UIImageView *labaImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15 * Scale, 10 * Scale, 15 * Scale, 15 * Scale)];
    labaImageView.image = [UIImage imageNamed:@"home_board_icon"];
    [self addSubview:labaImageView];
    
    gonggaoBGView = [[UIView alloc] initWithFrame:CGRectMake(40 * Scale, 0, self.frame.size.width - 50 * Scale, 35 * Scale)];
    gonggaoBGView.backgroundColor = [UIColor clearColor];
    [self addSubview:gonggaoBGView];
    
    gonggaoLabel = [[UILabel alloc] init];
    gonggaoLabel.textColor = [UIColor colorWithWhite:0 alpha:0.7];
    [gonggaoBGView addSubview:gonggaoLabel];
    
    
    
    self.layer.masksToBounds = YES;
    gonggaoBGView.layer.masksToBounds = YES;
    
}





-(void) startAnimationWithString:(NSString*)text{
    
    // *** 设置公告文字
    gonggaoLabel.text = text;
    
    gonggaoLabel.font = [UIFont systemFontOfSize:14 * Scale];
    CGSize msgSize = [gonggaoLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14 * Scale],NSFontAttributeName, nil]];
    gonggaoLabel.frame = CGRectMake(0, 0, msgSize.width, 35 * (ScreenW/375));
    
    CGRect fr = gonggaoLabel.frame;
    fr.origin.x = gonggaoBGView.frame.size.width;
    gonggaoLabel.frame = fr;
    
    CGPoint fromPoint = CGPointMake(gonggaoBGView.frame.size.width + gonggaoLabel.frame.size.width/2, gonggaoBGView.frame.size.height/2);
    
    //路径曲线
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    [movePath addLineToPoint:CGPointMake(-gonggaoLabel.frame.size.width/2, gonggaoBGView.frame.size.height/2)];
    //关键帧
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.removedOnCompletion = YES;
    
    moveAnim.duration = gonggaoBGView.frame.size.width * 3 * 0.010;
    [moveAnim setDelegate:self];
    [gonggaoLabel.layer addAnimation:moveAnim forKey:@"gonggaoAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(laBaAnimationDone)]) {
            [self.delegate laBaAnimationDone];
        }
    }
}
@end
