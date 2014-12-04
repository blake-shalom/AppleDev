//
//  NSString+NSString_ConvertWhitespace.m
//  FirstApp
//
//  Created by Blake Ellingham on 5/28/13.
//  Copyright (c) 2013 Blake Ellingham. All rights reserved.
//

#import "NSString+NSString_ConvertWhitespace.h"

@implementation NSString (NSString_ConvertWhitespace)

-(NSString *) convertWhitespace{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
}
@end
