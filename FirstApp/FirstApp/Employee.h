//
//  Employee.h
//  FirstApp
//
//  Created by Blake Ellingham on 5/27/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property NSString *name;
@property NSDate *hireDate;
@property int employeeNumber;

-(void) someMethod; // minus sign means an instance of this class
-(void) performAction: (int) param;
-(int) addNumber: (int) a toNumber: (int) b;
- (id)initWithInt:(int) a;
@end
