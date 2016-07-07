//
//  JMAnimationButton.h
//  AnimationButton
//
//  Created by Jimmy on 16/6/15.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMAnimationButton;
@protocol JMAnimationButtonDelegate <NSObject>
/**
 *  动画开始回调
 *
 *  @param JMAnimationButton self
 */
-(void)JMAnimationButtonDidStartAnimation:(JMAnimationButton*)JMAnimationButton;

/**
 *  动画已经结束时回调
 *
 *  @param JMAnimationButton self
 */
-(void)JMAnimationButtonDidFinishAnimation:(JMAnimationButton *)JMAnimationButton;

/**
 *  动画将要结束时回调  即 结束动画未执行时
 *
 *  @param JMAnimationButton self
 */
-(void)JMAnimationButtonWillFinishAnimation:(JMAnimationButton *)JMAnimationButton;

@end
@interface JMAnimationButton : UIButton
/**
 *  创建对象
 *
 *  @param frame
 *
 *  @return 对象
 */
+(instancetype)buttonWithFrame:(CGRect)frame;
/**
 *  边缘色
 *
 *  @param color
 */
-(void)setborderColor:(UIColor*)color;
/**
 *  边缘宽度
 *
 *  @param width
 */
-(void)setborderWidth:(CGFloat)width;
/**
 *  手动调用执行动画  一般在 button 的响应里调用  调用后会走代理进行回调
 */
-(void)startAnimation;
/**
 *  手动停止动画 停止前和停止后会走代理回调
 */
-(void)stopAnimation;
/**
 *  代理对象
 */
@property (nonatomic, weak) id <JMAnimationButtonDelegate> delegate;
@end
