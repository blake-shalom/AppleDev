//
//  RMUViewController.m
//  RSSBlogTest
//
//  Created by Blake Ellingham on 4/22/14.
//  Copyright (c) 2014 Blake Ellingham. All rights reserved.
//

#import "RMUViewController.h"

@interface RMUViewController ()

@property NSString *firstURL;

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
- (IBAction)fetchRSSFeed:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFXMLParserResponseSerializer new]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/rss+xml"];
    [manager GET:@"http://dinnerlab.tumblr.com/tagged/instagram/rss"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSError *parseError;
             NSXMLParser *parser = responseObject;
             NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLParser:parser error:parseError];
             NSLog(@" %@", xmlDictionary);
             self.firstURL = [[[[[[xmlDictionary objectForKey:@"rss"]objectForKey:@"channel"]objectForKey:@"item"]objectAtIndex:0]objectForKey:@"link"] objectForKey:@"text"];
             NSLog(@"%@", self.firstURL);
             [self performSegueWithIdentifier:@"viewToWeb" sender:self];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"error: %@, with response %@", error, operation.responseString);
         }];
}

//-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
//{
//    if ([elementName isEqualToString:@"category"])
//        NSLog(@"Dictionary: %@ \n namespaceURI: %@ \n qualified name: %@", attributeDict, namespaceURI, qName);
//}

//-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
//{
//    if ([elementName isEqualToString:@"category"]){
//        NSLog(@"namespaceURI: %@ \n qualified name: %@", namespaceURI, qName);
//        
//    }
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewToWeb"]){
        RMUWebController *webVC =  segue.destinationViewController;
        webVC.blogURLString = self.firstURL;
    }
    else {
        NSLog(@"%@", segue.identifier);
        
    }
}
@end
