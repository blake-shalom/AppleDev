//
//  ViewController.m
//  QuickConnections
//
//  Created by Blake Ellingham on 5/29/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@end

@implementation ViewController
@synthesize myTextField, myLabel;
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIAlertView *myAlert = [[UIAlertView alloc]
                            initWithTitle:@"Alert title"
                            message:@"Here's the message - fun"
                            delegate:nil
                            cancelButtonTitle:@"Okay"
                            otherButtonTitles:@"another button", nil];
    [myAlert show];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeLabel:(id)sender {
    NSString *message = [[NSString alloc]initWithFormat:@"Hello %@", [myTextField text]];
    [myLabel setText:message];
    [myTextField resignFirstResponder];
}

- (IBAction)dismissKeyboard:(id)sender {
    [myTextField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
