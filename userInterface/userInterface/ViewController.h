//
//  ViewController.h
//  userInterface
//
//  Created by Blake Ellingham on 5/30/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(NSString *) getFilePath;
-(void) saveData;
-(void) loadData;
- (IBAction)displayDay:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
