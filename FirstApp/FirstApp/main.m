//
//  main.m
//  FirstApp
//
//  Created by Blake Ellingham on 5/2/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "NSString+NSString_ConvertWhitespace.h"

int main(int argc, const char * argv[])
{
    typedef enum { lame, sauce, dude } blakeInt;
    
    @autoreleasepool {
        
        enum seatPref {window, aisle, middle }; // enums yums
        int mins = 60;
        int hours = 24;
        int days = 365;
        int minsInDays = mins * days * hours;
        NSString *message;
        message = @"Hello";
        message = [message uppercaseString];
        NSDate *myDate = [NSDate date];
        unsigned long length = [message length];
        NSLog(@"Value of Message %@", message);
        NSLog(@"Length of string = %li", length);
        NSLog(@"Todays date = %@", myDate);
        NSString *line = [NSString stringWithFormat: @"the message is %@", message]; // show some string methods
        NSLog(@"%@" ,line);
#if DEBUG // only in debug mode
        NSLog(@"Hello, World! %i", minsInDays);
#endif
        NSLog(@"Max value of an int is %i",INT_MAX);
        Employee *blake = [[Employee alloc]initWithInt:12];
        [blake someMethod];
        NSLog(@"The employeee number is %i", [blake employeeNumber]);
        
        
        // data structure tutorial
        
        // file manager
        //NSFileManager *fileMgr = [[NSFileManager alloc] init];
        NSURL *myURL = [NSURL URLWithString:@"file:///Users/blakeellingham/Documents/random.txt"];
        
        NSMutableString *text = [NSMutableString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:nil];
        
        NSLog(@"The Contents of the file were: \n%@", text);
        [text appendString:@"here's some mo' text"];
        [text writeToURL:myURL atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        // archiving objects
        [NSKeyedArchiver archiveRootObject:blake toFile:@"/Users/blakeellingham/blake.plist"];
        Employee *blakeTwo = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/blakeellingham/blake.plist"];
        NSLog(@"new employees number is %i", [blakeTwo employeeNumber]);
        NSString *message2 = @"the blah blah blue blee";
        NSLog(@"the message is: %@", [message2 convertWhitespace]);
    }
    return 0;
}


