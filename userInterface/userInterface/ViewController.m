//
//  ViewController.m
//  userInterface
//
//  Created by Blake Ellingham on 5/30/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize datePicker;
-(NSString *) getFilePath{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathArray objectAtIndex:0]stringByAppendingPathComponent:@"saved.plist"];
}
-(void) saveData{
    NSArray *value = [[NSArray alloc]initWithObjects:[datePicker date], nil];
    [value writeToFile:[self getFilePath] atomically:YES];
}
-(void) loadData{
    NSString *myPath = [self getFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    if (fileExists){
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        datePicker.date = [values objectAtIndex:0];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayDay:(id)sender {
    
    NSDate *chosen = [datePicker date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init ];
    [formatter setDateFormat:@"EEEE"];
    
    NSString *weekday = [formatter stringFromDate:chosen];
    
    NSString *msg = [[NSString alloc] initWithFormat:@"That was a %@", weekday];
    
    UIAlertView *myAlert = [[UIAlertView alloc]
                           initWithTitle:@"What day is that?"
                           message:msg
                           delegate:nil
                           cancelButtonTitle:@"Thanks"
                           otherButtonTitles:nil];
    [myAlert show];
}
@end
