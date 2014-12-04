//
//  RCMMasterViewController.h
//  coreDataExample
//
//  Created by Blake Ellingham on 7/17/13.
//  Copyright (c) 2013 Blake Elingham. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface RCMMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
