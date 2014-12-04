//
//  BDEViewController.m
//  PicnicAnimationTutorial
//
//  Created by Blake Ellingham on 6/24/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "BDEViewController.h"

@interface BDEViewController ()

@end

@implementation BDEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    CGRect basketTopFrame = self.basketTop.frame;
    basketTopFrame.origin.y = -basketTopFrame.size.height;
    
    CGRect basketBottomFrame = self.basketBottom.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationDelay:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//    
//    self.basketTop.frame = basketTopFrame;
//    self.basketBottom.frame = basketBottomFrame;
//    
//    [UIView commitAnimations];
    [UIView animateWithDuration:0.5
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.basketTop.frame = basketTopFrame;
                         self.basketBottom.frame = basketBottomFrame;
                     }
                     completion:^(BOOL finished){
                         [self animateNapkin];
                     }];

}
- (void)animateNapkin
{
    CGRect basketTopFrame = self.napkinTop.frame;
    basketTopFrame.origin.y = -basketTopFrame.size.height;
    
    CGRect basketBottomFrame = self.napkinBottom.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView animateWithDuration:0.5
                          delay:0.5f
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.basketTop.frame = basketTopFrame;
                         self.basketBottom.frame = basketBottomFrame;
                     }
                     completion:^(BOOL finished){
                         [self animateNapkin];
                     }];
}
@end
