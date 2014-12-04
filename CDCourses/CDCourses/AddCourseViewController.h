//
//  AddCourseViewController.h
//  CDCourses
//
//  Created by Blake Ellingham on 7/17/13.
//  Copyright (c) 2013 Blake Elingham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@protocol AddCourseViewControllerDelegate;

@interface AddCourseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (nonatomic, strong) Course *currentCourse;

@property (weak, nonatomic)id <AddCourseViewControllerDelegate>delegate;




- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end

@protocol AddCourseViewControllerDelegate
-(void)addCourseDidSave;
-(void)addCourseDidCancel:(Course *)courseToDelete;
@end
