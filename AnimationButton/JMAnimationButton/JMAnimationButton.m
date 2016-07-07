//
//  JMAnimationButton.m
//  AnimationButton
//
//  Created by Jimmy on 16/6/15.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import "JMAnimationButton.h"
#import "JMCircleAnimationView.h"
static NSTimeInterval startDuration = 0.3;
static NSTimeInterval endDuration = 0.5;
@interface JMAnimationButton ()
@property (nonatomic, strong) JMCircleAnimationView* circleView;
@property (nonatomic, assign) CGRect origionRect;
@end
@implementation JMAnimationButton
- (JMCircleAnimationView *)circleView
{
    if (!_circleView) {
        _circleView = [JMCircleAnimationView viewWithButton:self];
        [self addSubview:_circleView];
    }
    return _circleView;
}

+(instancetype)buttonWithFrame:(CGRect)frame{
    JMAnimationButton* button = [JMAnimationButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    button.layer.cornerRadius = frame.size.height / 2;
    button.layer.masksToBounds = YES;
    button.clipsToBounds = NO;
    button.origionRect = button.frame;
    return button;
}


-(void)setborderColor:(UIColor *)color{
    self.layer.borderColor = color.CGColor;
    
}

-(void)setborderWidth:(CGFloat)width{
    self.layer.borderWidth = width;
}



-(void)startAnimation{
    CGPoint center = self.center;
    CGFloat width = self.layer.cornerRadius * 2;
    CGFloat height = self.frame.size.height;
    CGRect desFrame = CGRectMake(center.x - width / 2, center.y - height / 2, width, height);

    self.userInteractionEnabled = NO;
    
    if ([self.delegate respondsToSelector:@selector(JMAnimationButtonDidStartAnimation:)]) {
        [self.delegate JMAnimationButtonDidStartAnimation:self];
    }

    [UIView animateWithDuration:startDuration animations:^{
        self.titleLabel.alpha = .0f;
        self.frame = desFrame;
    } completion:^(BOOL finished) {
  
        [self.circleView startAnimation];
    }];
}

-(void)stopAnimation{
    self.userInteractionEnabled = YES;
    
    
        if ([self.delegate respondsToSelector:@selector(JMAnimationButtonWillFinishAnimation:)]) {
            [self.delegate JMAnimationButtonWillFinishAnimation:self];
        }
        
        [self.circleView removeFromSuperview];
        self.circleView = nil;
        [UIView animateWithDuration:endDuration animations:^{
            self.frame = self.origionRect;
            self.titleLabel.alpha = 1.0f;
        } completion:^(BOOL finished) {
            if ([self.delegate respondsToSelector:@selector(JMAnimationButtonDidFinishAnimation:)]) {
                [self.delegate JMAnimationButtonDidFinishAnimation:self];
            }
        }];
    
}
@end
