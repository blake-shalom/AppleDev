//
//  RCMDetailViewController.h
//  coreDataExample
//
//  Created by Blake Ellingham on 7/17/13.
//  Copyright (c) 2013 Blake Elingham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCMDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
