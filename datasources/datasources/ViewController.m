//
//  ViewController.m
//  datasources
//
//  Created by Blake Ellingham on 5/30/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize moodlist;
- (void)viewDidLoad
{
    [super viewDidLoad];
    moodlist = [[NSArray alloc] initWithObjects:@"Ecstatic", @"Happy", @"Cheerful", @"fine", @"Tired", nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [moodlist count];
}

// delegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [moodlist objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    UIColor *newColor;
    if (row % 2 == 0){
        newColor = [UIColor blueColor];
    }
    else{
        newColor = [UIColor redColor];
    }
    
    self.view.backgroundColor = newColor;

}
@end
