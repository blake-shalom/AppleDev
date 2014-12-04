//
//  Course.h
//  CDCourses
//
//  Created by Blake Ellingham on 7/17/13.
//  Copyright (c) 2013 Blake Elingham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSString * author;

@end
