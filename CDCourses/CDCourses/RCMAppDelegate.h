//
//  RCMAppDelegate.h
//  CDCourses
//
//  Created by Blake Ellingham on 7/17/13.
//  Copyright (c) 2013 Blake Elingham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoursesTableViewController.h"

@interface RCMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
