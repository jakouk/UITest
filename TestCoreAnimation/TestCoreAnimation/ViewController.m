//
//  ViewController.m
//  TestCoreAnimation
//
//  Created by unbTech on 2017. 4. 20..
//  Copyright © 2017년 unbTech. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *myView = [[UIView alloc] init];
    myView.frame = CGRectMake(0, 0,50, 50);
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 50, 50);
    label.text = @"hello";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    [UIView transitionWithView:label duration:10 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        
        label.textColor = [UIColor redColor];
        
    } completion:^(BOOL finished) {
        
    }];
    
    //CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    /*
     
        Animation Option
     
     duration 에니메이션 재생시간
     repeatCount 반복횟수
     beginTime 에니메이션 시작설정, 에니메이션 시작을 늦추면 CACurrentMediaTime() + 초의 형식으로 지정해 준다.
     timingFunction 애니메이션 속도 변화지정
     autoreverses 애니메이션 종료 후 역순으로 실행할지를 지정
     
     */
    
    /*
    animation.duration = 2.5;
    animation.repeatCount = 1;
    animation.beginTime = CACurrentMediaTime() + 2;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
     
     */
    
    /*
        fromValue 시작값
        toValue 종료값 ( 절대치 )
        byValue 종료값 ( 상대치 )
     */
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position1"];
    animation1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 480)];
    
    for ( NSInteger i = 0; i < 3; i ++ ) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.duration = 5;
            animation.repeatCount = 1;
            animation.fromValue = [NSValue valueWithCGPoint:myView.layer.position];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(32*i, 480)];
            [myView.layer addAnimation:animation forKey:@"move-layer"];
            
            NSLog(@"i = %ld",i);
            sleep(5);
            
        });
        
        
        
        
        
    }
    
    
    
    
    
    
//    CABasicAnimation * m_pAnimationObj = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
//    [m_pAnimationObj setFromValue:[NSValue valueWithCGPoint:CGPointMake(0,-50)]];
//    [m_pAnimationObj setToValue:[NSValue valueWithCGPoint:CGPointMake(0,[UIScreen mainScreen].bounds.size.height+100)]];
//    m_pAnimationObj.duration = 2.0;
//    m_pAnimationObj.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [myView.layer addAnimation:m_pAnimationObj forKey:@"animations"];
//    
//    CGRect currentCenter = [myView.layer.presentationLayer frame];
//    NSLog(@" x= %lf, y= %lf, height = %lf, width = %lf",currentCenter.origin.x,currentCenter.origin.y,currentCenter.size.height,currentCenter.size.width);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
