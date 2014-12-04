//
//  RMUWebController.m
//  RSSBlogTest
//
//  Created by Blake Ellingham on 4/23/14.
//  Copyright (c) 2014 Blake Ellingham. All rights reserved.
//

#import "RMUWebController.h"

@interface RMUWebController ()

@property (weak, nonatomic) IBOutlet UIWebView *blogWebView;

@end

@implementation RMUWebController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadBlogURL:self.blogURLString];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadBlogURL:(NSString*)blogURL
{
    NSLog(@"%@ bloggy bloggers", blogURL);
    NSURL *url = [NSURL URLWithString:blogURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.blogWebView loadRequest:request];
}

@end
