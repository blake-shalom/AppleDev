//
//  MainViewController.h
//  UtilityExampleiPad
//
//  Created by Blake Ellingham on 6/4/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

- (IBAction)showInfo:(id)sender;

@end
