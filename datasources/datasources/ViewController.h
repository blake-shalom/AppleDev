//
//  ViewController.h
//  datasources
//
//  Created by Blake Ellingham on 5/30/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, strong) NSArray *moodlist;

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end
