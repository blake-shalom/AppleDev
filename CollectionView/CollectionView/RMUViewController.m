//
//  RMUViewController.m
//  CollectionView
//
//  Created by Blake Ellingham on 4/23/14.
//  Copyright (c) 2014 Blake Ellingham. All rights reserved.
//

#import "RMUViewController.h"

@interface RMUViewController ()

@end

@implementation RMUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    if (indexPath.row % 2 == 0) {
        RMUCollectionCell *cellOne = [collectionView dequeueReusableCellWithReuseIdentifier:@"dude" forIndexPath:indexPath];
        [cellOne.number setText:[NSString stringWithFormat:(@"%li"),(long)indexPath.row]];
        cell = cellOne;
    }
    else {
        RMUCollectionTwo *cellTwo = [collectionView dequeueReusableCellWithReuseIdentifier:@"mon" forIndexPath:indexPath];
        [cellTwo.row setText:[NSString stringWithFormat:(@"%li"),(long)indexPath.row]];
        [cellTwo.col setText:[NSString stringWithFormat:(@"%li"), (long)indexPath.section]];
        cell = cellTwo;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row %2 == 0)
        return CGSizeMake(90, 140);
    else
        return CGSizeMake(60, 180);
    
}


@end
