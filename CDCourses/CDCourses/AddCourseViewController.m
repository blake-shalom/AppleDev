//
//  AddCourseViewController.m
//  CDCourses
//
//  Created by Blake Ellingham on 7/17/13.
//  Copyright (c) 2013 Blake Elingham. All rights reserved.
//

#import "AddCourseViewController.h"

@interface AddCourseViewController ()

@end

@implementation AddCourseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.titleField.text = [self.currentCourse title];
    self.authorField.text = [self.currentCourse author];
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    self.dateField.text = [dateFormat stringFromDate:[self.currentCourse releaseDate]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    // dismiss and remove the object
    [self.delegate addCourseDidCancel:self.currentCourse];
}

- (IBAction)save:(id)sender {
    // dismiss and save the context
    [self.currentCourse setTitle:self.titleField.text];
    [self.currentCourse setAuthor:self.authorField.text];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    [self.currentCourse setReleaseDate:[dateFormat dateFromString:self.dateField.text]];
    [self.delegate addCourseDidSave];
}
@end
