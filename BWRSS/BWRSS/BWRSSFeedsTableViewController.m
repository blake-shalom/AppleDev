//
//  BWRSSFeedsTableViewController.m
//  BWRSS
//
//  Created by Blake Ellingham on 6/13/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "BWRSSFeedsTableViewController.h"

@interface BWRSSFeedsTableViewController () {
    BOOL iPadIdiom;
    NSDictionary *_newFeed;
    RSSDB *_rssDB;
    NSArray *_feedIDs;
}
@end

@implementation BWRSSFeedsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	if(UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) iPadIdiom = YES;
	[self loadFeedIDs];
	[self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	[self loadFeedIDs];
	return _feedIDs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedsCell" forIndexPath:indexPath];
    
    [self loadFeedIDsIfEmpty];
    
    //Configure the cell
    NSDictionary *feedRow = [_rssDB getFeedRow:_feedIDs[indexPath.row]];
    cell.textLabel.text = feedRow[@"title"];
    cell.detailTextLabel.text = feedRow[@"desc"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}
*/

#pragma mark - Database methods

- (void) loadNewFeed {
    // NSLog(@"%s", __FUNCTION__);
    if (!_newFeed) return;
    
    NSDictionary * newFeed = _newFeed;
    _newFeed = nil;
    
    NSNumber * rc = [_rssDB addFeedRow:newFeed];
    NSIndexPath * idx = [self indexPathForDBRec:newFeed];
    if (rc == nil) {    // inserted row in DB
        [self.tableView insertRowsAtIndexPaths:@[idx] withRowAnimation:UITableViewRowAnimationLeft];
    }
    [self.tableView scrollToRowAtIndexPath:idx atScrollPosition:UITableViewScrollPositionNone animated:YES];
    if (rc != nil) {    // updated existing row in DB
        [self.tableView reloadRowsAtIndexPaths:@[idx] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (NSIndexPath *) indexPathForDBRec:(NSDictionary *) dbRec {
    NSNumber * rowID = [_rssDB valueFromQuery:@"SELECT id FROM feed WHERE url = ?", dbRec[@"url"]];
    if (rowID) {
        NSArray * tempFeedIDs = [_rssDB getFeedIDs];
        return [NSIndexPath indexPathForRow:[tempFeedIDs indexOfObject:rowID] inSection:0];
    } else {
        return nil;
    }
}

- (NSArray *) loadFeedIDs {
    // NSLog(@"%s", __FUNCTION__);
    if (!_rssDB) [self loadFeedDB];
    _feedIDs = [_rssDB getFeedIDs];
    return _feedIDs;
}

- (NSArray *) loadFeedIDsIfEmpty {
    // NSLog(@"%s", __FUNCTION__);
    if (!_rssDB) [self loadFeedDB];
    if (!_feedIDs || ![_feedIDs count]) _feedIDs = [_rssDB getFeedIDs];
    return _feedIDs;
}

- (RSSDB *) loadFeedDB {
    // NSLog(@"%s", __FUNCTION__);
    // use self.rssDB? or rssDB?
    if (!_rssDB) _rssDB = [[RSSDB alloc] initWithRSSDBFilename:@"bwrss.db"];
    return _rssDB;
}

@end
