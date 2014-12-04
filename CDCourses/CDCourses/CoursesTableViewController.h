//
//  CoursesTableViewController.h
//  CDCourses
//
//  Created by Blake Ellingham on 7/17/13.
//  Copyright (c) 2013 Blake Elingham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "AddCourseViewController.h"

@interface CoursesTableViewController : UITableViewController
<AddCourseViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

// Ties fetched results to tableview
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
