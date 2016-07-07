//
//  JMNavAnimation.m
//  AnimationButton
//
//  Created by Jimmy on 16/6/15.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import "JMNavAnimation.h"

@interface JMNavAnimation ()
@property (nonatomic, strong)id<UIViewControllerContextTransitioning> transitionContext;
@end
@implementation JMNavAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    
    UIView* contentView = [self.transitionContext containerView];
    
    
    CGPoint point = self.centerButton.center;
    UIBezierPath* origionPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(point.x , point.y, 0, 0)];
    
    CGFloat X = [UIScreen mainScreen].bounds.size.width - point.x;
    CGFloat Y = [UIScreen mainScreen].bounds.size.height - point.y;
    CGFloat radius = sqrtf(X * X + Y * Y);
    UIBezierPath* finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(point.x , point.y, 0, 0), -radius, -radius)];
    
    UIViewController* toVc = [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.path = finalPath.CGPath;
    toVc.view.layer.mask = layer;
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.delegate = self;
    animation.fromValue = (__bridge id _Nullable)(origionPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = 0.25;
    [layer addAnimation:animation forKey:@"path"];
    
    [contentView addSubview:toVc.view];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.transitionContext completeTransition:YES];
}
@end
