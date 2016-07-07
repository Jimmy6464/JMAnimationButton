//
//  ViewController.m
//  AnimationButton
//
//  Created by Jimmy on 16/6/15.
//  Copyright © 2016年 Jimmy. All rights reserved.
//

#import "ViewController.h"
#import "JMAnimationButton.h"
#import "SecondViewController.h"
#import "JMNavigationController.h"
@interface ViewController () <JMAnimationButtonDelegate>
@property (nonatomic, weak) JMAnimationButton* button1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    JMAnimationButton* button1 = [JMAnimationButton buttonWithFrame:CGRectMake(30, 300, self.view.bounds.size.width - 2 * 30, 50)];
    self.button1 = button1;
    button1.delegate = self;
    [button1 setTitle:@"Login" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:button1];
    
    [button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    JMAnimationButton* button2 = [JMAnimationButton buttonWithFrame:CGRectMake(80, 100, self.view.bounds.size.width - 2 * 80, 50)];
    button2.delegate = self;
    [button2 setTitle:@"OK" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:button2];
    
    [button2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)click:(JMAnimationButton*)button{

    [button startAnimation];
    
}

#pragma mark JMAnimationButtonDelegate
-(void)JMAnimationButtonDidStartAnimation:(JMAnimationButton *)JMAnimationButton{
    NSLog(@"start");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [JMAnimationButton stopAnimation];
    });
}

-(void)JMAnimationButtonDidFinishAnimation:(JMAnimationButton *)JMAnimationButton{
    NSLog(@"stop");
}

-(void)JMAnimationButtonWillFinishAnimation:(JMAnimationButton *)JMAnimationButton{
    if (JMAnimationButton == self.button1) {
        
        SecondViewController* vc = [[SecondViewController alloc] init];
        [((JMNavigationController*)self.navigationController) pushViewController:vc withCenterButton:JMAnimationButton];
    }
}
@end
