# JMAnimationButton
![result](https://github.com/Jimmy6464/JMAnimationButton/blob/master/result.gif)
# Usage 

	Button:
	[button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];  
	-(void)click:(JMAnimationButton*)button{
		[button startAnimation];
	}
	After the button began to animate,you can observe the event use the delegate<JMAnimationButtonDelegate>
	Such as:
	-(void)JMAnimationButtonDidStartAnimation:(JMAnimationButton *)JMAnimationButton{
		NSLog(@"start");
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[JMAnimationButton stopAnimation];//Use this method to stop animation
		});
	}
# Welcome to fork and make some valuable comments.Thanks!
