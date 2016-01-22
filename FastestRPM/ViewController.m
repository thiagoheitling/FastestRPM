//
//  ViewController.m
//  FastestRPM
//
//  Created by Thiago Heitling on 2016-01-21.
//  Copyright © 2016 Thiago Heitling. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *needle;
@property(nonatomic) CGPoint lastPoint;
@property(nonatomic) CGPoint speed;
@property(nonatomic) float speedMagnitude;
@property(nonatomic) float minSpeedPosition;

@end

@implementation ViewController

- (IBAction)speed:(UIPanGestureRecognizer *)sender {
    
    self.speed = [sender velocityInView:self.view];
    self.speedMagnitude = sqrtf((self.speed.x * self.speed.x) + (self.speed.y * self.speed.y));
    float speedRate = self.speedMagnitude / 4000;
    
    float degreesToRadians = (M_PI / 180);
    self.minSpeedPosition = (140 * degreesToRadians);
    
    if ( [sender state] == UIGestureRecognizerStateChanged) {
        
        self.needle.transform = CGAffineTransformMakeRotation(self.minSpeedPosition + self.minSpeedPosition * speedRate);

    }

    if ( [sender state] == UIGestureRecognizerStateEnded) {

        self.needle.transform = CGAffineTransformMakeRotation(self.minSpeedPosition);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.needle.transform = CGAffineTransformMakeRotation(140 * M_PI / 180);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
