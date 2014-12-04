//
//  Employee.m
//  FirstApp
//
//  Created by Blake Ellingham on 5/27/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "Employee.h"

@implementation Employee
@synthesize employeeNumber, name, hireDate;

-(void) someMethod {
    NSLog(@"in some method");
}
-(void)performAction:(int)param{
    NSLog(@"you passed in %i", param);
}
-(int)addNumber:(int)a toNumber:(int)b{
    return a+b;
}
-(id)init
{
    return self = [self initWithInt:300];
}
-(id)initWithInt:(int) a{
    self = [super init];
    if (self) {
        employeeNumber = a;
    }
    return self;
}
-(void)dealloc
{
    // close some sort of data or file... 
}
-(void) encodeWithCoder: (NSCoder*) coder {
    NSNumber *empNum = [NSNumber numberWithInt:employeeNumber];
    [coder encodeObject: empNum forKey:@"EMPnum"];
    [coder encodeObject:hireDate forKey:@"EMPdate"];
    [coder encodeObject:name forKey:@"EMPname"];
}
-(id) initWithCoder:(NSCoder*) coder{
    name = [coder decodeObjectForKey:@"EMPname"];
    NSNumber *empNum = [coder decodeObjectForKey:@"EMPnum"];
    employeeNumber = (int) [empNum integerValue];
    hireDate = [coder decodeObjectForKey:@"EMPdate"];
    return self;
}
@end
