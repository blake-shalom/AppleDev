//
//  ViewController.h
//  QuickConnections
//
//  Created by Blake Ellingham on 5/29/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)changeLabel:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end
