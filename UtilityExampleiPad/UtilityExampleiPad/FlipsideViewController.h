//
//  FlipsideViewController.h
//  UtilityExampleiPad
//
//  Created by Blake Ellingham on 6/4/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
