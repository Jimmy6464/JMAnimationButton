# JMAnimationButton
![result](https://github.com/Jimmy6464/JMAnimationButton/blob/master/result.gif)
# Usage 

	Button:
	[button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];  
	-(void)click:(JMAnimationButton*)button{

    [button startAnimation];
    
}
